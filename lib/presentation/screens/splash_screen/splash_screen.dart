import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/main_screen.dart';
import 'package:onix_flutter_bricks/presentation/screens/splash_screen/bloc/splash_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool buttonVisible = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: BlocConsumer<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          if (state.loadFinished) {
            if (state.localVersion != null &&
                state.remoteVersion != state.localVersion) {
              showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                        title: const Text('New version available'),
                        content: const Text(
                            'Please, download new version from GitHub'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('OK'),
                            onPressed: () {
                              _launchUrl();
                              Navigator.of(context).pop();
                            },
                          ),
                          CupertinoDialogAction(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ));
            }
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: state.logoVisible ? 0.5 : 0,
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
                child: Text(
                    state.localVersion != null ? 'v${state.localVersion}' : '',
                    style: TextStyle(
                      color: state.remoteVersion == state.localVersion
                          ? AppColors.orange
                          : AppColors.red,
                    )),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _launchUrl() async {
    final url = Uri.parse(
        'https://gitlab.onix.ua/onix-systems/flutter-project-generator/-/blob/swagger_parser/release/onix_flutter_proj_gen.zip');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
