import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:logger/logger.dart';

Future logError(Object error, StackTrace? stackTrace) async {
  final log = Logger();
  await FirebaseCrashlytics.instance
      .recordError(error, stackTrace, reason: 'a non-fatal error');
  log.e('$error', error: error, stackTrace: stackTrace);
}
