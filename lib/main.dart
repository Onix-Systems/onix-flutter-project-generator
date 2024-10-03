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
        minimumSize: Size(1100, 750),
        size: Size(1100, 750),
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
    _onError,
  )?.catchError((error, stackTrace) {
    _onError(error, stackTrace);
    exit(-1);
  });
}

void _onError(dynamic error, dynamic stackTrace) {
  if (kDebugMode) {
    print('ERROR: $error');
    print(stackTrace);
  }
}
