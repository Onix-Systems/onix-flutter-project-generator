abstract class AppLogger {
  void f(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void i(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void t(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void e(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void w(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void d(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  });

  void crash({String reason = '', Object? error, StackTrace? stackTrace});
}
