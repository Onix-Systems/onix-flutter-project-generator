import 'package:logger/logger.dart';

class AppCrashlyticsLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    switch (event.level) {
      // ignore: deprecated_member_use
      case Level.nothing:
      case Level.off:
        break;
      case Level.all:
      // ignore: deprecated_member_use
      case Level.verbose:
      case Level.trace:
      case Level.debug:
      case Level.info:
      case Level.warning:
      //TODO: uncomment when FirebaseCrashlytics is added
      // FirebaseCrashlytics.instance.log(event.lines.join('\n'));
      case Level.error:
      // ignore: deprecated_member_use
      case Level.wtf:
      case Level.fatal:
      //TODO: uncomment when FirebaseCrashlytics is added
      // FirebaseCrashlytics.instance.recordError(
      //   event.origin.error,
      //   event.origin.stackTrace,
      //   printDetails: true,
      //   reason: event.origin.time.toIso8601String(),
      //   information: [event.origin.message],
      // );
    }
  }
}
