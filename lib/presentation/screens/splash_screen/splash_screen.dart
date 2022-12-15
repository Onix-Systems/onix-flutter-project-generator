import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/main_screen.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool logoVisible = false;
  bool buttonVisible = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        logoVisible = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: logoVisible ? 0.5 : 0,
              duration: const Duration(seconds: 2),
              child: Hero(
                tag: 'logo',
                child: SvgPicture.asset(
                  'assets/logo.svg',
                  color: AppColors.white,
                ),
              ),
              onEnd: () {
                setState(() {
                  buttonVisible = true;
                });
              },
            ),
            Visibility(
              visible: buttonVisible,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CupertinoButton(
                  color: AppColors.orange,
                  onPressed: () {
                    getDirectoryPath().then(
                      (value) {
                        if (value != null) {
                          Navigator.of(context).pushAndRemoveUntil(
                            CupertinoPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) =>
                                    AppBloc(projectPath: value),
                                child: MainScreen(),
                              ),
                            ),
                            (route) => false,
                          );
                        }
                      },
                    );
                  },
                  child: const Text(
                    'Select folder with your projects',
                    style: TextStyle(color: CupertinoColors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
