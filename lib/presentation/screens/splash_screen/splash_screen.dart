import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/main_page.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool logoVisible = false;
  bool buttonVisible = false;
  bool dialogIsOpen = false;

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
                    if (!dialogIsOpen) {
                      dialogIsOpen = true;
                      FilePicker.platform.getDirectoryPath().then((value) {
                        if (value != null) {
                          Navigator.of(context).pushAndRemoveUntil(
                              CupertinoPageRoute(
                                  builder: (context) => MainPage(
                                        projectPath: value,
                                      )),
                              (route) => false);
                        } else {
                          dialogIsOpen = false;
                        }
                      });
                    }
                  },
                  child: const Text('Select folder with your projects'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
