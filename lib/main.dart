import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:window_manager/window_manager.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  injections();

  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(1000, 720),
    size: Size(1000, 720),
    center: true,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
    title: 'Onix Flutter Bricks',
  );
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    //windowManager.maximize();
    await windowManager.focus();
  });

  runApp(const MyApp());
}
