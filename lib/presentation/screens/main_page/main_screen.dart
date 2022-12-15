import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/build_body.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/build_top.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/navigation_button.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final TextEditingController _projectNameController = TextEditingController();

  void _init(BuildContext context) {
    _projectNameController.text = context.read<AppBloc>().state.projectName;
    _projectNameController.addListener(() {
      context.read<AppBloc>().add(ProjectNameChange(
            projectName: _projectNameController.text,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    _init(context);
    return CupertinoPageScaffold(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  logger.d('state: $state');
                  return BuildTop(
                    projectPath: state.projectPath,
                    projectName: state.projectName,
                    onPathChange: (projectPath) {
                      context
                          .read<AppBloc>()
                          .add(ProjectPathChange(projectPath: projectPath));
                    },
                  );
                },
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
                  BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) => Row(
                      children: [
                        NavigationButton(
                          selected: context.read<AppBloc>().state.tab == 0,
                          label: 'Base',
                          onTap: () => context
                              .read<AppBloc>()
                              .add(const TabChange(tabIndex: 0)),
                        ),
                        const SizedBox(width: 5),
                        NavigationButton(
                          selected: context.read<AppBloc>().state.tab == 1,
                          label: 'Screen',
                          onTap: () => context
                              .read<AppBloc>()
                              .add(const TabChange(tabIndex: 1)),
                        ),
                      ],
                    ),
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
              BlocBuilder<AppBloc, AppState>(builder: (context, state) {
                if (state.tab == 0) {
                  return BuildBody(
                    projectPath: state.projectPath,
                    projectName: state.projectName,
                    projectNameController: _projectNameController,
                    onGenerate: () async {
                      // if (!isGenerating && !projectExists) {
                      //   outputText.clear();
                      //
                      //   isGenerating = true;
                      //
                      //   if (projectName.isNotEmpty && orgName.isNotEmpty) {
                      //     var configFile =
                      //     await File('$projectPath/config.json').create();
                      //     await configFile.writeAsString(jsonEncode({
                      //       'withUI': true,
                      //       'signingVars': signingVars,
                      //       'project_name_dirt': projectName,
                      //       'project_org': orgName,
                      //       'flavorizr': flavorize,
                      //       'flavors': flavors.toList(),
                      //       'navigation': router,
                      //       'localization': localization,
                      //       'use_keytool': generateSigningKey,
                      //       'use_sonar': useSonar,
                      //       'device_preview': integrateDevicePreview
                      //     }).toString());
                      //     var generatingResult = await flutterProjectGen(
                      //         projectPath: projectPath,
                      //         configFile: configFile,
                      //         projectName: projectName,
                      //         orgName: orgName,
                      //         outputText: outputText,
                      //         outputStreamController: outputStreamController);
                      //     configFile.delete();
                      //
                      //     isGenerating = false;
                      //     projectExists = true;
                      //   } else if (projectName.isEmpty) {
                      //     FocusScope.of(context)
                      //         .requestFocus(projectNameFocusNode);
                      //   } else {
                      //     FocusScope.of(context)
                      //         .requestFocus(organizationFocusNode);
                      //   }
                      // }
                    },
                  );
                } else {
                  return const Text('Screen');
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
