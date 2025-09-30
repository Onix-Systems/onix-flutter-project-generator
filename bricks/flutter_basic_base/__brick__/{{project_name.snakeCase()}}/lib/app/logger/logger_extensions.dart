import 'package:{{project_name}}/logger/app_logger.dart';

/// Extension methods for AppLogger to provide convenient logging patterns
/// for common application scenarios and business logic tracking.
extension AppLoggerExtensions on AppLogger {
  /// Logs API call information with method, endpoint, and optional parameters
  void apiCall(
    String endpoint, {
    String method = 'GET',
    Map<String, dynamic>? params,
    int? statusCode,
  }) {
    final buffer = StringBuffer('API $method $endpoint');

    if (statusCode != null) {
      buffer.write(' ($statusCode)');
    }

    if (params != null && params.isNotEmpty) {
      buffer.write(' - Params: ${params.keys.join(', ')}');
    }

    if (statusCode != null && statusCode >= 400) {
      e(buffer.toString(), error: params);
    } else {
      d(buffer.toString(), error: params);
    }
  }

  /// Logs navigation events between screens
  void navigation(String from, String to, {Map<String, dynamic>? arguments}) {
    final message = 'Navigation: $from → $to';
    if (arguments != null && arguments.isNotEmpty) {
      d('$message, arguments: $arguments');
    } else {
      d(message);
    }
  }

  /// Logs user actions and interactions
  void userAction(String action, {Map<String, dynamic>? actionContext}) {
    final message = 'User action: $action';
    if (actionContext != null && actionContext.isNotEmpty) {
      i('$message, action context: $actionContext');
    } else {
      i(message);
    }
  }

  /// Logs performance metrics with duration thresholds
  void performance(
    String operation,
    Duration duration, {
    Duration? slowThreshold,
  }) {
    final threshold = slowThreshold ?? const Duration(seconds: 1);
    final milliseconds = duration.inMilliseconds;

    final message = 'Performance: $operation took ${milliseconds}ms';

    if (duration > threshold) {
      w('Slow operation: $operation took ${milliseconds}ms');
    } else {
      d(message);
    }
  }

  /// Logs state changes in BLoC/Cubit patterns
  void stateChange(
    String bloc,
    String fromState,
    String toState, {
    Object? event,
  }) {
    final message = 'State: $bloc $fromState → $toState';

    if (event != null) {
      d('$message event: $event');
    } else {
      d(message);
    }
  }
}
