//@formatter:off
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/app/banned_app.dart';
import 'package:{{project_name}}/core/arch/bloc/app_bloc_observer.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:{{project_name}}/app/app_initialization.dart';
import 'package:{{project_name}}/core/di/services.dart';
import 'package:{{project_name}}/app/util/extension/orientation_extension.dart';
import 'package:{{project_name}}/core/arch/logger/app_logger_impl.dart';
{{#sentry}}import 'package:sentry_flutter/sentry_flutter.dart';{{/sentry}}

Future<void> main{{#flavorizr}}App{{/flavorizr}}() async {
  unawaited(
    runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        {{^sentry}}
        await SentryFlutter.init(
          (options) {
              options.dsn = 'https://example@sentry.io/add-your-dsn-here';
          },
        );
        {{/sentry}}
        await Initialization.I.initApp();
        await OrientationExtension.lockVertical();
        Bloc.observer = AppBlocObserver();
        final isAllowedToUseApp = await environmentService().initialize();
        if (isAllowedToUseApp) {
          runApp(const App());
        } else {
          runApp(const BannedApp());
        }
        },
        (error, stackTrace) {
          _onError(error, stackTrace);
        },
        )?.catchError((error, stackTrace) {
          _onError(error, stackTrace);
          exit(-1);
      },
    ),
  );

  Future<void> _onError(dynamic error, dynamic stackTrace) async {
    logger.crash(error: error, stackTrace: stackTrace, reason: 'main');
    {{#sentry}}await Sentry.captureException(exception, stackTrace: stackTrace);{{/sentry}}
  }
}