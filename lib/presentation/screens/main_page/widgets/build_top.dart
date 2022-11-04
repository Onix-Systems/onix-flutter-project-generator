import 'dart:async';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';

class BuildTop extends StatelessWidget {
  BuildTop(
      {Key? key,
      required this.pathStreamController,
      required this.pathStream,
      required this.projectNameController})
      : super(key: key);

  StreamController<String> pathStreamController;
  Stream<String> pathStream;
  TextEditingController projectNameController;

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
                pathStreamController.add(value);
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
              StreamBuilder<String>(
                  stream: pathStream,
                  builder: (context, snapshot) {
                    return Text(
                      '${snapshot.data}/${projectNameController.text}' ??
                          'null???',
                      style: const TextStyle(color: CupertinoColors.systemGrey),
                    );
                  }),
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
