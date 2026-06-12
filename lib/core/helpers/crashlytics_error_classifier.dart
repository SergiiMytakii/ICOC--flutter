import 'dart:io';

import 'package:flutter/foundation.dart';

class CrashlyticsErrorClassifier {
  const CrashlyticsErrorClassifier._();

  static bool shouldRecordFlutterErrorAsFatal(FlutterErrorDetails details) {
    return !_isExpectedImageLoadingError(details);
  }

  static bool _isExpectedImageLoadingError(FlutterErrorDetails details) {
    if (!_isNetworkError(details.exception)) {
      return false;
    }

    final String stack = details.stack?.toString() ?? '';
    final String context = details.context?.toString() ?? '';
    final String library = details.library ?? '';
    final String diagnosticText = '$library\n$context\n$stack';

    return diagnosticText.contains('ImageStreamCompleter') ||
        diagnosticText.contains('MultiFrameImageStreamCompleter') ||
        diagnosticText.contains('image resource service') ||
        diagnosticText.contains('painting library');
  }

  static bool _isNetworkError(Object exception) {
    return exception is SocketException ||
        exception is HttpException ||
        exception is HandshakeException;
  }
}
