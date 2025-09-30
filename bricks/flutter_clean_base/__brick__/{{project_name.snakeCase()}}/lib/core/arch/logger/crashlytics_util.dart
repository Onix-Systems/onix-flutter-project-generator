import 'package:flutter/foundation.dart';

class CrashlyticsUtil {
  static bool _isInitialized = false;

  static Future<void> recordError({
    String reason = '',
    Object? error,
    StackTrace? stackTrace,
    Map<String, dynamic>? customData,
    bool isFatal = false,
  }) async {
    if (!_isInitialized) {
      await _initializeIfNeeded();
    }

    try {
      //TODO: uncomment when FirebaseCrashlytics is added
      /*final crashlytics = FirebaseCrashlytics.instance;

      // Add custom data if provided
      if (customData != null) {
        for (final entry in customData.entries) {
          await crashlytics.setCustomKey(entry.key, entry.value);
        }
      }

      await crashlytics.recordError(
        error ?? reason,
        stackTrace,
        printDetails: true,
        reason: reason.isNotEmpty ? reason : 'Unspecified error',
        fatal: isFatal,
      );*/
    } catch (e) {
      // Fallback to debug logging if Crashlytics fails
      debugPrint('Failed to record error to Crashlytics: $e');
      if (error != null) {
        debugPrint('Original error: $error');
      }
      if (stackTrace != null) {
        debugPrint('Stack trace: $stackTrace');
      }
    }
  }

  /// Initializes Crashlytics if not already initialized
  static Future<void> _initializeIfNeeded() async {
    try {
      //TODO: uncomment when FirebaseCrashlytics is added
      // await FirebaseCrashlytics.instance.checkForUnsentReports();
      _isInitialized = true;
    } catch (e) {
      debugPrint('Crashlytics initialization failed: $e');
    }
  }
}
