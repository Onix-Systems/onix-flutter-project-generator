import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';

class BuildTop extends StatelessWidget {
  BuildTop(
      {Key? key,
      required this.projectPath,
      required this.pathStreamController,
      required this.pathStream,
      required this.projectNameController})
      : super(key: key);

  bool dialogIsOpen = false;
  String projectPath;
  StreamController<String> pathStreamController;
  Stream<String> pathStream;
  TextEditingController projectNameController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: SizedBox(
            height: 44,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              alignment: Alignment.centerRight,
              child: Hero(
                tag: 'logo',
                child: SvgPicture.asset(
                  'assets/logo.svg',
                  color: CupertinoColors.activeOrange,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CupertinoButton(
              color: AppColors.orange,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              onPressed: () {
                if (!dialogIsOpen) {
                  FilePicker.platform
                      .getDirectoryPath(
                    dialogTitle: 'Select project folder',
                  )
                      .then((value) {
                    if (value != null) {
                      projectPath = value;
                      pathStreamController.add(
                          '${value.replaceAll('/Volumes/Macintosh HD/Users', '')}/${projectNameController.text}');
                    }
                  });
                }
              },
              child: const Text('Change project folder'),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Current project\'s folder: ',
                    style: TextStyle(color: CupertinoColors.systemGrey),
                  ),
                  const SizedBox(height: 2),
                  StreamBuilder<String>(
                      stream: pathStream,
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? 'null???',
                          style: const TextStyle(
                              color: CupertinoColors.systemGrey),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
