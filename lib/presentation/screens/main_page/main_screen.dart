import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/colored_line.dart';
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

  final outputStreamController = StreamController<ColoredLine>();
  late final Stream<ColoredLine> outputStream =
      outputStreamController.stream.asBroadcastStream();
  List<ColoredLine> outputText = [];

  void _init(BuildContext context) {
    _projectNameController.text = context.read<AppBloc>().state.projectName;
    _projectNameController.addListener(() {
      var position = _projectNameController.selection.base;
      context.read<AppBloc>().add(ProjectNameChange(
            projectName: _projectNameController.text,
            textPosition: _projectNameController.selection.base,
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

    outputStream.listen((event) {
      outputText.add(event);
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
              if (state.projectName != _projectNameController.text) {
                var offset = _projectNameController.selection.base.offset + 1;
                if (_projectNameController.text.length == 1) offset--;
                _projectNameController.text = state.projectName;
                _projectNameController.selection = TextSelection.fromPosition(
                    offset <= _projectNameController.text.length
                        ? TextPosition(offset: offset)
                        : TextPosition(offset: offset - 2));
              }
              if (state.organization != _projectOrgController.text) {
                var offset = _projectOrgController.selection.base.offset + 1;
                if (_projectOrgController.text.length == 1) offset++;
                _projectOrgController.text = state.organization;
                _projectOrgController.selection = TextSelection.fromPosition(
                    offset <= _projectOrgController.text.length
                        ? TextPosition(offset: offset)
                        : TextPosition(offset: offset - 2));
              }
              if (state.flavors
                      .toString()
                      .replaceAll('{', '')
                      .replaceAll('}', '')
                      .replaceAll(',', '') !=
                  _flavorsController.text) {
                var offset = _flavorsController.selection.base.offset;
                _flavorsController.text = state.flavors
                    .toString()
                    .replaceAll('{', '')
                    .replaceAll('}', '')
                    .replaceAll(',', '');
                _flavorsController.selection = TextSelection.fromPosition(
                    offset <= _flavorsController.text.length
                        ? TextPosition(offset: offset)
                        : TextPosition(offset: offset - 1));
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
                      if (state.projectExists) ...[
                        const SizedBox(width: 5),
                        NavigationButton(
                          selected: context.read<AppBloc>().state.tab == 1,
                          label: 'Screen',
                          onTap: () => context
                              .read<AppBloc>()
                              .add(const TabChange(tabIndex: 1)),
                        ),
                      ],
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
                      outputStream: outputStream,
                      outputText: outputText,
                      onGenerate: () async {
                        if (state.projectName.isEmpty ||
                            state.organization.isEmpty ||
                            state.isGenerating ||
                            !state.platforms.selected) {
                          //TODO: show error
                        } else {
                          outputText.clear();
                          context.read<AppBloc>().add(GenerateProject(
                                generateProject: true,
                                outputStreamController: outputStreamController,
                              ));
                        }
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
