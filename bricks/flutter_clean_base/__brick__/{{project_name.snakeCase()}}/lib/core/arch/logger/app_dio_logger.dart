import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:{{project_name}}/core/arch/logger/logger_factory.dart';

/// Specialized logger for Dio HTTP client operations.
///
/// This logger is optimized for HTTP request/response logging with
/// appropriate formatting and output routing based on the build mode.
class AppDioLogger {
  /// Singleton instance configured based on build mode
  static final Logger instance = LoggerFactory.createNetworkLogger(
    isDebugMode: kDebugMode,
  );
}
