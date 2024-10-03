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

Future<void> main{{#flavorizr}}App{{/flavorizr}}() async {
  unawaited(
    runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await Initialization.I.initApp();

        await OrientationExtension.lockVertical();

        {{#isBloc}}Bloc.observer = AppBlocObserver();{{/isBloc}}
        final isAllowedToUseApp = await environmentService().initialize();
        if (isAllowedToUseApp) {
          runApp(const App());
        } else {
          runApp(const BannedApp());
        }
        },
        (error, stackTrace) {
          logger.crash(error: error, stackTrace: stackTrace, reason: 'main');
        },
        )?.catchError((e, trace) {
          logger.crash(error: e, stackTrace: trace, reason: 'main');
          exit(-1);
    }),
  );
}