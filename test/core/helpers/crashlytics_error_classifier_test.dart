import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/helpers/crashlytics_error_classifier.dart';

void main() {
  group('CrashlyticsErrorClassifier', () {
    test('records ordinary Flutter errors as fatal', () {
      final details = FlutterErrorDetails(
        exception: StateError('broken state'),
        stack: StackTrace.current,
      );

      expect(
        CrashlyticsErrorClassifier.shouldRecordFlutterErrorAsFatal(details),
        isTrue,
      );
    });

    test('does not record image loading socket errors as fatal', () {
      final details = FlutterErrorDetails(
        exception: const SocketException('Connection timed out'),
        stack: StackTrace.fromString(
          'ImageStreamCompleter.reportError\n'
          'MultiFrameImageStreamCompleter.<fn>',
        ),
      );

      expect(
        CrashlyticsErrorClassifier.shouldRecordFlutterErrorAsFatal(details),
        isFalse,
      );
    });

    test('keeps non-image socket errors fatal', () {
      final details = FlutterErrorDetails(
        exception: const SocketException('Connection timed out'),
        stack: StackTrace.fromString('SomeRepository.fetch'),
      );

      expect(
        CrashlyticsErrorClassifier.shouldRecordFlutterErrorAsFatal(details),
        isTrue,
      );
    });
  });
}
