import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screens/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screens/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(
        scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => SplashScreenBloc(),
        child: const SplashScreen(),
      ),
    );
  }
}
