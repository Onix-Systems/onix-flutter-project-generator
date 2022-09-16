import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/main_page.dart';
import 'package:onix_flutter_bricks/presentation/screens/splash_screen/splash_screen.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
