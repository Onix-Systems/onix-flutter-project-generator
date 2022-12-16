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
  final TextEditingController _projectOrgController = TextEditingController();
  final TextEditingController _flavorsController = TextEditingController();

  void _init(BuildContext context) {
    _projectNameController.text = context.read<AppBloc>().state.projectName;
    _projectNameController.addListener(() {
      var position = _projectNameController.selection.base;
      context.read<AppBloc>().add(ProjectNameChange(
            projectName: _projectNameController.text,
          ));
      _projectNameController.selection = TextSelection.fromPosition(position);
    });

    _projectOrgController.text = context.read<AppBloc>().state.organization;
    _projectOrgController.addListener(() {
      var position = _projectOrgController.selection.base;
      context.read<AppBloc>().add(OrganizationChange(
            organization: _projectOrgController.text,
          ));
      _projectOrgController.selection = TextSelection.fromPosition(position);
    });

    _flavorsController.text = context.read<AppBloc>().state.flavors.toString();
    _flavorsController.addListener(() {
      var position = _flavorsController.selection.base;
      context.read<AppBloc>().add(FlavorsChange(
            flavors: _flavorsController.text,
          ));
      _flavorsController.selection = TextSelection.fromPosition(position);
    });
  }

  @override
  Widget build(BuildContext context) {
    _init(context);
    return CupertinoPageScaffold(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              logger.d('State: $state');
              if (state.projectName != _projectNameController.text) {
                _projectNameController.text = state.projectName;
              }
              if (state.organization != _projectOrgController.text) {
                _projectOrgController.text = state.organization;
              }
              if (state.flavors
                      .toString()
                      .replaceAll('{', '')
                      .replaceAll('}', '')
                      .replaceAll(',', '') !=
                  _flavorsController.text) {
                _flavorsController.text = state.flavors
                    .toString()
                    .replaceAll('{', '')
                    .replaceAll('}', '')
                    .replaceAll(',', '');
              }
              return Column(
                children: [
                  BuildTop(
                    projectPath: state.projectPath,
                    projectName: state.projectName,
                    onPathChange: (projectPath) {
                      context
                          .read<AppBloc>()
                          .add(ProjectPathChange(projectPath: projectPath));
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
                  if (state.tab == 0)
                    BuildBody(
                      state: state,
                      projectNameController: _projectNameController,
                      organizationController: _projectOrgController,
                      flavorsController: _flavorsController,
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
                    )
                  else
                    const Text('Screen'),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
