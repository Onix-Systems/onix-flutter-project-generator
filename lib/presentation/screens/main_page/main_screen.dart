import 'dart:async';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/build_body.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/build_top.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/navigation_button.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key, required this.projectPath}) : super(key: key);

  String projectPath;
  final pathStreamController = StreamController<String>();
  late final pathStream = pathStreamController.stream.asBroadcastStream();
  final TextEditingController projectNameController = TextEditingController();
  final navigationStreamController = StreamController<int>();
  late final navigationStream =
      navigationStreamController.stream.asBroadcastStream();

  @override
  Widget build(BuildContext context) {
    pathStreamController.add(projectPath);
    navigationStreamController.add(0);
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
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      height: 40,
                      color: CupertinoColors.activeOrange,
                    ),
                  ),
                  const SizedBox(width: 5),
                  NavigationButton(
                    index: 0,
                    label: 'Base',
                    navigationStreamController: navigationStreamController,
                    navigationStream: navigationStream,
                  ),
                  const SizedBox(width: 5),
                  NavigationButton(
                    index: 1,
                    label: 'Screen',
                    navigationStreamController: navigationStreamController,
                    navigationStream: navigationStream,
                  ),
                  const SizedBox(width: 5),
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      height: 40,
                      color: CupertinoColors.activeOrange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              StreamBuilder<int>(
                  stream: navigationStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data == 0) {
                        return BuildBody(
                          projectPath: projectPath,
                          pathStream: pathStream,
                          pathStreamController: pathStreamController,
                          projectNameController: projectNameController,
                        );
                      } else {
                        return const Text('Screen');
                      }
                    }
                    return CircularProgressIndicator();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
