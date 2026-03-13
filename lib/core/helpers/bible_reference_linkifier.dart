import 'dart:collection';

import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html_parser;
import 'package:icoc/core/helpers/bible_reference_parser.dart';

class BibleReferenceLinkifier {
  static final LinkedHashMap<String, String> _cache =
      LinkedHashMap<String, String>();
  static const int _cacheLimit = 20;

  static String linkifyHtml(String input, {required String langHint}) {
    final String cacheKey = '$langHint::$input';
    final String? cached = _cache[cacheKey];
    if (cached != null) {
      return cached;
    }

    final dom.Document document = html_parser.parse(input);
    final dom.Element? body = document.body;
    if (body == null) {
      return input;
    }

    _applyExplicitDataRefLinks(document, langHint: langHint);
    _applyAnchorTextBibleLinks(document, langHint: langHint);
    _applyInlineFragmentedBibleLinks(document, langHint: langHint);
    final List<dom.Text> textNodes = <dom.Text>[];
    _collectTextNodes(body, insideBlockedTag: false, out: textNodes);
    for (final dom.Text textNode in textNodes) {
      _linkifyTextNode(textNode, langHint: langHint);
    }

    final String result = body.innerHtml;
    _cache[cacheKey] = result;
    if (_cache.length > _cacheLimit) {
      _cache.remove(_cache.keys.first);
    }
    return result;
  }

  static void _applyInlineFragmentedBibleLinks(dom.Document document,
      {required String langHint}) {
    final dom.Element? body = document.body;
    if (body == null) {
      return;
    }

    final List<dom.Element> allElements = body.querySelectorAll('*');
    for (final dom.Element element in allElements) {
      if (element.localName == 'a') {
        continue;
      }
      if (_hasAnchorAncestor(element)) {
        continue;
      }
      if (element.children.isEmpty) {
        continue;
      }
      if (!_containsOnlyInlineChildren(element)) {
        continue;
      }

      final String text = element.text.trim();
      if (text.isEmpty) {
        continue;
      }
      final parsed = BibleReferenceParser.parse(text, langHint: langHint);
      if (parsed == null) {
        continue;
      }

      final dom.Element anchor = dom.Element.tag('a');
      anchor.attributes['href'] = parsed.toUri().toString();
      final List<dom.Node> children = List<dom.Node>.from(element.nodes);
      for (final dom.Node node in children) {
        anchor.append(node);
      }
      element.append(anchor);
    }
  }

  static void _applyAnchorTextBibleLinks(dom.Document document,
      {required String langHint}) {
    final List<dom.Element> anchors = document.querySelectorAll('a');
    for (final dom.Element anchor in anchors) {
      final String currentHref = (anchor.attributes['href'] ?? '').trim();
      final bool isExternal = currentHref.startsWith('http://') ||
          currentHref.startsWith('https://') ||
          currentHref.startsWith('mailto:') ||
          currentHref.startsWith('tel:');
      if (isExternal) {
        continue;
      }

      final String text = anchor.text.trim();
      if (text.isEmpty) {
        continue;
      }
      final parsed = BibleReferenceParser.parse(text, langHint: langHint);
      if (parsed == null) {
        continue;
      }
      anchor.attributes['href'] = parsed.toUri().toString();
    }
  }

  static void _applyExplicitDataRefLinks(dom.Document document,
      {required String langHint}) {
    final List<dom.Element> dataRefElements =
        document.querySelectorAll('[data-ref]');
    for (final dom.Element element in dataRefElements) {
      if (element.localName != 'a') {
        continue;
      }
      final String dataRef = element.attributes['data-ref'] ?? '';
      if (dataRef.trim().isEmpty) {
        continue;
      }
      final String href = element.attributes['href'] ?? '';
      final bool isExternalLink =
          href.startsWith('http://') || href.startsWith('https://');
      if (isExternalLink) {
        continue;
      }

      final parsed = BibleReferenceParser.parse(dataRef, langHint: langHint);
      if (parsed == null) {
        continue;
      }
      element.attributes['href'] = parsed.toUri().toString();
    }
  }

  static void _collectTextNodes(
    dom.Node node, {
    required bool insideBlockedTag,
    required List<dom.Text> out,
  }) {
    bool nextBlocked = insideBlockedTag;
    if (node is dom.Element) {
      final String tag = node.localName ?? '';
      if (tag == 'a' || tag == 'script' || tag == 'style') {
        nextBlocked = true;
      }
    }

    if (node is dom.Text && !nextBlocked) {
      out.add(node);
      return;
    }

    final List<dom.Node> children = List<dom.Node>.from(node.nodes);
    for (final dom.Node child in children) {
      _collectTextNodes(child, insideBlockedTag: nextBlocked, out: out);
    }
  }

  static void _linkifyTextNode(dom.Text textNode, {required String langHint}) {
    final String value = textNode.text;
    if (value.trim().isEmpty) {
      return;
    }

    final List<BibleReferenceMatch> matches =
        BibleReferenceParser.findMatches(value, langHint: langHint);
    if (matches.isEmpty) {
      return;
    }

    final dom.Node? parent = textNode.parentNode;
    if (parent == null) {
      return;
    }

    final List<dom.Node> replacementNodes = <dom.Node>[];
    int cursor = 0;
    for (final BibleReferenceMatch match in matches) {
      if (match.start < cursor || match.end > value.length) {
        continue;
      }
      if (match.start > cursor) {
        replacementNodes.add(dom.Text(value.substring(cursor, match.start)));
      }
      final dom.Element anchor = dom.Element.tag('a');
      anchor.attributes['href'] = match.reference.toUri().toString();
      anchor.text = match.label;
      replacementNodes.add(anchor);
      cursor = match.end;
    }

    if (replacementNodes.isEmpty) {
      return;
    }

    if (cursor < value.length) {
      replacementNodes.add(dom.Text(value.substring(cursor)));
    }

    for (final dom.Node node in replacementNodes) {
      parent.insertBefore(node, textNode);
    }
    textNode.remove();
  }

  static bool _containsOnlyInlineChildren(dom.Element element) {
    for (final dom.Element child in element.children) {
      final String tag = child.localName ?? '';
      if (!_inlineTags.contains(tag)) {
        return false;
      }
    }
    return true;
  }

  static bool _hasAnchorAncestor(dom.Element element) {
    dom.Element? current = element.parent;
    while (current != null) {
      if (current.localName == 'a') {
        return true;
      }
      current = current.parent;
    }
    return false;
  }

  static const Set<String> _inlineTags = <String>{
    'span',
    'strong',
    'b',
    'em',
    'i',
    'u',
    'small',
    'sub',
    'sup',
    'font',
  };
}
