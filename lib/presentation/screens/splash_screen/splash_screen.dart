import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/main_screen.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool logoVisible = false;
  bool buttonVisible = false;

  PackageInfo? packageInfo;

  @override
  void initState() {
    PackageInfo.fromPlatform().then((value) {
      Future.delayed(const Duration(seconds: 1)).then((_) {
        setState(() {
          packageInfo = value;
          logoVisible = true;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Positioned.fill(
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
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
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
          Positioned(
            right: 10,
            bottom: 10,
            child: Text(packageInfo != null ? 'v${packageInfo!.version}' : ''),
          ),
        ],
      ),
    );
  }
}
