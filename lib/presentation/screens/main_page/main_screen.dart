import 'dart:async';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/build_body.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/build_top.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key, required this.projectPath}) : super(key: key);

  String projectPath;
  final pathStreamController = StreamController<String>();
  late final pathStream = pathStreamController.stream.asBroadcastStream();
  final TextEditingController projectNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    pathStreamController.add(projectPath);
    return CupertinoPageScaffold(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              BuildTop(
                //projectPath: projectPath,
                pathStream: pathStream,
                pathStreamController: pathStreamController,
                projectNameController: projectNameController,
              ),
              const Divider(
                thickness: 1,
                height: 40,
                color: CupertinoColors.activeOrange,
              ),
              BuildBody(
                  projectPath: projectPath,
                  pathStream: pathStream,
                  pathStreamController: pathStreamController,
                  projectNameController: projectNameController),
            ],
          ),
        ),
      ),
    );
  }
}
