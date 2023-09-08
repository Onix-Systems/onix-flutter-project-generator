//@formatter:off
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:{{project_name}}/core/arch/bloc/app_bloc_observer.dart';
{{#use_getit}}import 'package:get_it/get_it.dart';{{/use_getit}}
import 'package:{{project_name}}/app/app.dart';
import 'package:{{project_name}}/core/app/app_initialization.dart';

Future<void> main{{#flavorizr}}App{{/flavorizr}}() async {
    await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await AppInitialization.I.initApp();

    // await SystemChrome.setPreferredOrientations([
    //   //DeviceOrientation.portraitUp,
    //   //DeviceOrientation.portraitDown,
    //   //DeviceOrientation.landscapeLeft,
    //   //DeviceOrientation.landscapeRight
    // ]);

    Bloc.observer = AppBlocObserver();

    final isAllowedToUseApp = await environmentService().initialize();
      if (isAllowedToUseApp) {
        runApp(const App());
      } else {
        runApp(const BannedApp());
    }

    {{#use_getit}}
    initializeDi(GetIt.instance);
    {{/use_getit}}
    runApp(const App());
    }, (error, stackTrace) {
      if (kDebugMode) {
        print('runZonedGuarded: Caught error in root zone.\n$error');
        print(stackTrace);
      }
      //there we can add FirebaseCrashlytics recordError method
    },)?.catchError((e, trace) {
      if (kDebugMode) {
        print('ERROR: $e');
        print(trace);
        }
        exit(-1);
    });
  }