import 'package:{{project_name}}/app/logger/app_logger.dart';
import 'package:{{project_name}}/app/logger/crashlytics_util.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

AppLogger get logger => AppLoggerImpl.I;

class AppLoggerImpl extends AppLogger {
  late Logger _logger;

  @visibleForTesting
  static bool recordCrashlyticsError = true;

  AppLoggerImpl._() {
    _logger = Logger();
  }

  static final AppLoggerImpl _instance = AppLoggerImpl._();

  static AppLoggerImpl get I => _instance;

  @override
  void crash({String reason = '', Object? error, StackTrace? stackTrace}) {
    e(reason, error: error, stackTrace: stackTrace);
    if (recordCrashlyticsError) {
      CrashlyticsUtil.recordError(
        reason: reason,
        error: error,
        stackTrace: stackTrace,
      );
    }
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
  void e(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.e(message, time: time, error: error, stackTrace: stackTrace);
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
  void i(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.i(message, time: time, error: error, stackTrace: stackTrace);
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

  @override
  void w(
    Object message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.w(message, time: time, error: error, stackTrace: stackTrace);
  }
}
