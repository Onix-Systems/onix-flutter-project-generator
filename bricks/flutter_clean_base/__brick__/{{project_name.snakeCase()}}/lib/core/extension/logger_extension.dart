import 'package:logger/logger.dart';

extension Crash on Logger {
  void crash({String reason = '', Object? error, StackTrace? stackTrace}) {
    e(reason, error: error, stackTrace: stackTrace);
    //TODO Add here crash recognition system
    // FirebaseCrashlytics.instance.recordError(
    //   error,
    //   stackTrace,
    //   printDetails: true,
    //   fatal: false,
    //   reason: reason,
    // );
  }
}
