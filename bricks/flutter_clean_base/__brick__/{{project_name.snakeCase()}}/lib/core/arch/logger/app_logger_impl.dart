import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:{{project_name}}/core/arch/logger/app_logger.dart';
import 'package:{{project_name}}/core/arch/logger/crashlytics_util.dart';
import 'package:{{project_name}}/core/arch/logger/logger_factory.dart';

AppLogger get logger => AppLoggerImpl.I;

class AppLoggerImpl extends AppLogger {
  late final Logger _logger;

  @visibleForTesting
  static bool recordCrashlyticsError = true;

  AppLoggerImpl._() {
    _logger = _createLogger();
  }

  static final AppLoggerImpl _instance = AppLoggerImpl._();

  static AppLoggerImpl get I => _instance;

  Logger _createLogger() {
    return LoggerFactory.createLogger(isProduction: kReleaseMode);
  }

  @override
  void crash({String reason = '', Object? error, StackTrace? stackTrace}) {
    final message = reason.isEmpty ? 'Application crash' : reason;
    e(message, error: error, stackTrace: stackTrace);

    if (recordCrashlyticsError) {
      _recordCrash(reason: reason, error: error, stackTrace: stackTrace);
    }
  }

  void _recordCrash({
    String reason = '',
    Object? error,
    StackTrace? stackTrace,
  }) {
    try {
      CrashlyticsUtil.recordError(
        reason: reason.isEmpty ? 'Application crash' : reason,
        error: error,
        stackTrace: stackTrace,
      );
    } catch (e, stack) {
      _logger.e(
        'Failed to record crash to Crashlytics',
        error: e,
        stackTrace: stack,
      );
    }
  }

  @override
  void f(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.f(message, time: time, error: error, stackTrace: stackTrace);
  }

  @override
  void e(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.e(message, time: time, error: error, stackTrace: stackTrace);
  }

  @override
  void w(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.w(message, time: time, error: error, stackTrace: stackTrace);
  }

  @override
  void i(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.i(message, time: time, error: error, stackTrace: stackTrace);
  }

  @override
  void d(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.d(message, time: time, error: error, stackTrace: stackTrace);
  }

  @override
  void t(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.t(message, time: time, error: error, stackTrace: stackTrace);
  }
}
