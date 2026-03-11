import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:icoc/core/constants.dart';

class BibleReferenceLinkifier {
  static final RegExp _englishBibleReferenceRegExp = RegExp(
    r'(?<![\w>])(?:[1-3]\s*)?(?:Genesis|Gen|Exodus|Exod|Leviticus|Lev|Numbers|Num|Deuteronomy|Deut|Joshua|Josh|Judges|Judg|Ruth|1\s*Samuel|2\s*Samuel|1\s*Sam|2\s*Sam|1\s*Kings|2\s*Kings|1\s*Kgs|2\s*Kgs|1\s*Chronicles|2\s*Chronicles|1\s*Chr|2\s*Chr|Ezra|Nehemiah|Neh|Esther|Esth|Job|Psalms?|Ps|Proverbs|Prov|Ecclesiastes|Eccl|Song\s+of\s+Solomon|Song\s+of\s+Songs|Song|Isaiah|Isa|Jeremiah|Jer|Lamentations|Lam|Ezekiel|Ezek|Daniel|Dan|Hosea|Hos|Joel|Amos|Obadiah|Obad|Jonah|Micah|Mic|Nahum|Nah|Habakkuk|Hab|Zephaniah|Zeph|Haggai|Hag|Zechariah|Zech|Malachi|Mal|Matthew|Matt|Mark|Luke|John|Acts|Romans|Rom|1\s*Corinthians|2\s*Corinthians|1\s*Cor|2\s*Cor|Galatians|Gal|Ephesians|Eph|Philippians|Phil|Colossians|Col|1\s*Thessalonians|2\s*Thessalonians|1\s*Thess|2\s*Thess|1\s*Timothy|2\s*Timothy|1\s*Tim|2\s*Tim|Titus|Philemon|Phlm|Hebrews|Heb|James|Jas|1\s*Peter|2\s*Peter|1\s*Pet|2\s*Pet|1\s*John|2\s*John|3\s*John|Jude|Revelation|Rev)\s+\d{1,3}:\d{1,3}(?:\s*[-–]\s*\d{1,3})?(?:\s*,\s*\d{1,3}(?::\d{1,3})?)*',
    caseSensitive: false,
  );

  static String linkifyByLanguage({
    required String htmlContent,
    required Languages language,
  }) {
    if (language != Languages.en || htmlContent.isEmpty) {
      return htmlContent;
    }

    final document = parser.parse(htmlContent);
    final body = document.body;
    if (body == null) return htmlContent;

    _walkAndReplaceTextNodes(body);
    return body.innerHtml;
  }

  static void _walkAndReplaceTextNodes(dom.Node node) {
    if (node is dom.Element &&
        (node.localName == 'a' ||
            node.localName == 'script' ||
            node.localName == 'style')) {
      return;
    }

    final children = List<dom.Node>.from(node.nodes);
    for (final child in children) {
      if (child is dom.Text) {
        _replaceTextNode(child);
      } else {
        _walkAndReplaceTextNodes(child);
      }
    }
  }

  static void _replaceTextNode(dom.Text textNode) {
    final text = textNode.text;
    if (!_englishBibleReferenceRegExp.hasMatch(text)) {
      return;
    }

    final result = text.replaceAllMapped(_englishBibleReferenceRegExp, (match) {
      final String? ref = match.group(0);
      if (ref == null || ref.isEmpty) {
        return match.input.substring(match.start, match.end);
      }
      final url =
          'https://www.biblegateway.com/passage/?search=${Uri.encodeQueryComponent(ref)}';
      return '<a href="$url">$ref</a>';
    });

    final fragment = parser.parseFragment(result);
    textNode.replaceWith(fragment);
  }
}
