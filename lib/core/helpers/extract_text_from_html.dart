class FormatTextHelper {
  static String extractFormattedText(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    String result = htmlText.replaceAll(exp, '\n');
    exp = RegExp(
        r"&nbsp;|&rdquo;|&shy;|&quot;|&amp;|&lt;|&gt;|&apos;|&copy;|&reg;|&laquo;|&raquo|&oacute;",
        multiLine: true,
        caseSensitive: true);
    result = result = result.replaceAll(exp, '');
    exp = RegExp(r"&rsquo;", multiLine: true, caseSensitive: true);
    result = result = result.replaceAll(exp, '\'');

    return result;
  }
}
