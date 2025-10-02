abstract class AppLogger {
  /// Logs a fatal error message.
  /// Fatal errors typically indicate critical system failures.
  void f(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  /// Logs an informational message.
  /// Use for general application flow and important events.
  void i(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  /// Logs a trace message.
  /// Use for fine-grained debugging information.
  void t(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  /// Logs an error message.
  /// Use for error conditions that don't terminate the app.
  void e(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  /// Logs a warning message.
  /// Use for potentially harmful situations that aren't errors.
  void w(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  /// Logs a debug message.
  /// Use for debugging information during development.
  void d(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  /// Records a critical crash with optional Firebase Crashlytics reporting.
  ///
  /// This method logs the crash locally and optionally sends it to Crashlytics
  /// for production error tracking.
  void crash({String reason = '', Object? error, StackTrace? stackTrace});
}
