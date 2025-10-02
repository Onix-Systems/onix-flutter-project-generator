import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:{{project_name}}/core/arch/logger/app_console_log_output.dart';
import 'package:{{project_name}}/core/arch/logger/app_crashlytics_log_output.dart';

/// Centralized factory for creating logger instances with different configurations.
/// Provides both configuration settings and specialized logger creation methods.
class LoggerFactory {
  /// Enable or disable Crashlytics error reporting
  static const bool enableCrashlytics = true;

  /// Enable or disable console logging
  static bool enableConsoleLogging = false;

  /// Minimum log level based on build mode
  static const Level minLogLevel = kDebugMode ? Level.trace : Level.warning;

  /// Maximum stack trace lines for regular logs
  static const int maxStackTraceLines = 4;

  /// Maximum stack trace lines for error logs
  static const int errorStackTraceLines = 10;

  /// Line length for pretty printer
  static const int lineLength = 200;

  /// Creates a logger printer based on environment
  static LogPrinter createPrinter({bool isProduction = false}) {
    if (isProduction) {
      return SimplePrinter(colors: false);
    }

    return PrefixPrinter(
      PrettyPrinter(
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
        methodCount: maxStackTraceLines,
        stackTraceBeginIndex: 2,
        errorMethodCount: errorStackTraceLines,
        lineLength: lineLength,
      ),
      debug: '🌐',
      trace: '🔍',
      fatal: '💀',
      info: '📡',
      warning: '⚠️',
      error: '❌',
    );
  }

  /// Creates a logger filter based on environment
  static LogFilter createFilter({bool isProduction = false}) {
    if (isProduction) {
      return ProductionFilter();
    }
    return DevelopmentFilter();
  }

  /// Creates appropriate log output based on environment
  static LogOutput createOutput({bool isProduction = false}) {
    if (isProduction && enableCrashlytics) {
      return AppCrashlyticsLogOutput();
    }

    if (enableConsoleLogging) {
      return AppConsoleLogOutput();
    }

    return ConsoleOutput();
  }

  /// Creates a configured logger instance for general use
  static Logger createLogger({
    bool isProduction = kReleaseMode,
    String? prefix,
    Level? level,
  }) {
    return Logger(
      printer: prefix != null
          ? PrefixPrinter(createPrinter(isProduction: isProduction))
          : createPrinter(isProduction: isProduction),
      filter: createFilter(isProduction: isProduction),
      output: createOutput(isProduction: isProduction),
      level: level ?? minLogLevel,
    );
  }

  /// Creates a logger optimized for Dio HTTP client logging
  static Logger createNetworkLogger({bool isDebugMode = kDebugMode}) {
    if (isDebugMode) {
      return Logger(
        printer: _createNetworkPrinter(),
        output: AppConsoleLogOutput(prefix: '[HTTP] '),
        filter: DevelopmentFilter(),
      );
    }

    return Logger(
      printer: SimplePrinter(colors: false),
      output: AppCrashlyticsLogOutput(),
      filter: ProductionFilter(),
      level: Level.error,
    );
  }

  /// Creates a feature-specific logger with custom prefixes
  static Logger createFeatureLogger(
    String featureName, {
    bool isDebugMode = kDebugMode,
  }) {
    if (isDebugMode) {
      return Logger(
        printer: PrefixPrinter(
          PrettyPrinter(
            dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
            methodCount: 0,
            errorMethodCount: 3,
          ),
          debug: '[$featureName] 🐛',
          info: '[$featureName] 💡',
          warning: '[$featureName] ⚠️',
          error: '[$featureName] ⛔',
          fatal: '[$featureName] 💀',
          trace: '[$featureName] 🔍',
        ),
        filter: DevelopmentFilter(),
      );
    }

    return Logger(
      printer: SimplePrinter(colors: false),
      output: AppCrashlyticsLogOutput(),
      filter: ProductionFilter(),
      level: Level.warning,
    );
  }

  /// Creates a performance logger for measuring execution times
  static Logger createPerformanceLogger({bool isDebugMode = kDebugMode}) {
    return Logger(
      printer: PrefixPrinter(
        SimplePrinter(colors: isDebugMode),
        debug: '[PERF] ⏱️',
        info: '[PERF] 📊',
        warning: '[PERF] 🐌',
        error: '[PERF] ❌',
      ),
      filter: isDebugMode ? DevelopmentFilter() : ProductionFilter(),
      level: isDebugMode ? Level.debug : Level.warning,
    );
  }

  /// Creates a minimal logger for production environments
  static Logger createMinimalLogger() {
    return Logger(
      printer: SimplePrinter(colors: false),
      output: AppCrashlyticsLogOutput(),
      filter: ProductionFilter(),
      level: Level.error,
    );
  }

  /// Creates the DIO-specific printer with HTTP-focused formatting
  static PrefixPrinter _createNetworkPrinter() {
    return PrefixPrinter(
      SimplePrinter(colors: kDebugMode),
      debug: '🌐 DEBUG',
      trace: '🔍 TRACE',
      fatal: '💀 FATAL',
      info: '📡 INFO',
      warning: '⚠️ WARNING',
      error: '❌ ERROR',
    );
  }
}
