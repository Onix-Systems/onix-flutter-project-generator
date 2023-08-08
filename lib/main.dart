//@formatter:off

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onix_flutter_bricks/app/app.dart';
import 'package:onix_flutter_bricks/core/app/app_initialization.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/app_bloc_observer.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await AppInitialization.I.initApp();

      await windowManager.ensureInitialized();

      WindowOptions windowOptions = const WindowOptions(
        minimumSize: Size(1000, 850),
        size: Size(1000, 850),
        center: true,
        skipTaskbar: false,
        titleBarStyle: TitleBarStyle.hidden,
        title: 'Onix Flutter Project Generator',
      );
      await windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        //windowManager.maximize();
        await windowManager.focus();
      });

      Bloc.observer = AppBlocObserver();

      runApp(const App());
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
  });
}
