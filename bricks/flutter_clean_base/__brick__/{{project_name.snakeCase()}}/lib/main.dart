//@formatter:off
import 'dart:async';
import 'dart:io';
{{#device_preview}}import 'package:device_preview/device_preview.dart';{{/device_preview}}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:{{project_name}}/core/arch/bloc/app_bloc_observer.dart';
{{#use_getit}}import 'package:get_it/get_it.dart';{{/use_getit}}
import 'package:{{project_name}}/app/app.dart';
import 'package:{{project_name}}/core/app/app_initialization.dart';

{{#flavorizr}}Future<void> mainApp() async {
  {{/flavorizr}}
  {{^flavorizr}}Future<void> main() async {
  {{/flavorizr}}
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
    {{#use_getit}}
    initializeDi(GetIt.instance);
    {{/use_getit}}
    {{#device_preview}}
    runApp(DevicePreview(
      enabled: false,
      builder: (context) => App(),
    ));
    {{/device_preview}}
    {{^device_preview}}
    runApp(const App());
    {{/device_preview}}
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