//@formatter:off
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:{{project_name}}/app/banned_app.dart';
import 'package:{{project_name}}/core/arch/bloc/app_bloc_observer.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:{{project_name}}/app/app_initialization.dart';
import 'package:{{project_name}}/core/di/services.dart';

Future<void> main{{#flavorizr}}App{{/flavorizr}}() async {
  unawaited(
    runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await Initialization.I.initApp();
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        Bloc.observer = AppBlocObserver();
        final isAllowedToUseApp = await environmentService().initialize();
        if (isAllowedToUseApp) {
          runApp(const App());
        } else {
          runApp(const BannedApp());
        }
        },
        (error, stackTrace) {
          if (kDebugMode) {
            print('runZonedGuarded: Caught error in root zone.\n$error');
            print(stackTrace);
          }
          //there we can add FirebaseCrashlytics recordError method
        },
        )?.catchError((e, trace) {
          if (kDebugMode) {
            print('ERROR: $e');
            print(trace);
          }
      exit(-1);
    }),
  );
}