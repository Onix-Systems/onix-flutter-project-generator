import 'dart:async';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';

class BuildTop extends StatelessWidget {
  const BuildTop(
      {Key? key,
      required this.projectName,
      required this.projectPath,
      required this.onPathChange})
      : super(key: key);

  final String projectPath;
  final String projectName;
  final void Function(String) onPathChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        CupertinoButton(
          color: AppColors.orange,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          onPressed: () {
            getDirectoryPath().then((value) {
              if (value != null) {
                onPathChange(value);
              }
            });
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
              Text(
                '$projectPath/$projectName',
                style: const TextStyle(color: CupertinoColors.systemGrey),
              ),
            ],
          ),
        ),
        SizedBox(
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
      ],
    );
  }
}
