//@formatter:off
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'dart:async';
import 'dart:io';

import 'app_service.dart'; // Assuming this is where AppService is defined
import 'logger.dart'; // Assuming this is where logger is defined
import 'initialization.dart'; // Assuming this is where Initialization is defined
import 'orientation_extension.dart'; // Assuming this is where OrientationExtension is defined
import 'app_bloc_observer.dart'; // Assuming this is where AppBlocObserver is defined
import 'environment_service.dart'; // Assuming this is where environmentService is defined
import 'app.dart'; // Assuming this is where the App and BannedApp widgets are defined

Future<void> main() async {
  //Sentry docs suggested to wrap the main function with runZonedGuarded
  // see https://github.com/getsentry/sentry-dart/blob/main/flutter/README.md
  runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.dsn = const String.fromEnvironment(AppService.sentryDsn);
      },
    );
    WidgetsFlutterBinding.ensureInitialized();
    await Initialization.I.initApp();
    await OrientationExtension.lockVertical();

    Bloc.observer = AppBlocObserver();
    final isAllowedToUseApp = await environmentService().initialize();
    if (isAllowedToUseApp) {
      runApp(
        DefaultAssetBundle(
          bundle: SentryAssetBundle(),
          child: MyApp(),
        ),
      );
    } else {
      runApp(const BannedApp());
    }
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
    logger.crash(error: exception, stackTrace: stackTrace, reason: 'main');
    exit(-1);
  });
}

