//@formatter:off
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
{{#isBloc}}import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/core/arch/bloc/app_bloc_observer.dart';{{/isBloc}}
import 'package:{{project_name}}/app/banned_app.dart';
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
        await Initialization.I.initApp();
        {{#sentry}}await SentryFlutter.init(
          (options) {
              options.dsn = 'SENTRY_DSN';
          },
        );{{/sentry}}
        await OrientationExtension.lockVertical();

        {{#isBloc}}Bloc.observer = AppBlocObserver();{{/isBloc}}
        final isAllowedToUseApp = await environmentService().initialize();
        if (isAllowedToUseApp) {
          runApp(const App());
        } else {
          runApp(const BannedApp());
        }
        },
        _onError,
        )?.catchError((error, stackTrace) {
          _onError(error, stackTrace);
          exit(-1);
      },
    ),
  );
}


Future<void> _onError(dynamic error, dynamic stackTrace) async {
  logger.crash(error: error, stackTrace: stackTrace, reason: 'main');
  {{#sentry}}await Sentry.captureException(error, stackTrace: stackTrace);{{/sentry}}
}