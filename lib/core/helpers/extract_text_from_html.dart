import 'package:html/dom.dart';
import 'package:html/parser.dart';

class FormatTextHelper {
  static String extractFormattedText(String htmlString) {
    final document = parse(htmlString);
    String result = document.body!.nodes.map(_processNode).join('').trim();
    RegExp exp = RegExp(
        r"&nbsp;|&rdquo;|&shy;|&quot;|&amp;|&lt;|&gt;|&apos;|&copy;|&reg;|&laquo;|&raquo|&oacute;",
        multiLine: true,
        caseSensitive: true);
    result = result = result.replaceAll(exp, ' ');
    exp = RegExp(r"&rsquo;", multiLine: true, caseSensitive: true);
    result = result = result.replaceAll(exp, '\'');
    return result;
  }
}

String _processNode(Node node) {
  if (node is Text) {
    return node.text;
  } else if (node is Element) {
    final buffer = StringBuffer();
    for (var child in node.nodes) {
      buffer.write(_processNode(child));
    }
    final content = buffer.toString();

    switch (node.localName) {
      case 'p':
        return '$content\n\n';
      case 'br':
        return '\n';
      case 'h1':
        return '# $content\n\n';
      case 'h2':
        return '## $content\n\n';
      case 'h3':
        return '### $content\n\n';
      case 'li':
        return '• $content\n';
      case 'b':
      case 'strong':
        return '*$content*';
      case 'i':
      case 'em':
        return '_${content}_';
      default:
        return content;
    }
  }
  return '';
}
