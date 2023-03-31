import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/build_base.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/output_widget.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/build_entity.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/screen_body/build_screen.dart';
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

    // _flavorsController.text = context.read<AppBloc>().state.flavors.toString();
    // _flavorsController.addListener(() {
    //   var position = _flavorsController.selection.base;
    //   context.read<AppBloc>().add(FlavorsChange(
    //         flavors: _flavorsController.text,
    //       ));
    //   _flavorsController.selection = TextSelection.fromPosition(position);
    // });
  }

  @override
  Widget build(BuildContext context) {
    _init(context);
    return CupertinoPageScaffold(
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          logger.i(state);
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
          // if (state.flavors
          //         .toString()
          //         .replaceAll('{', '')
          //         .replaceAll('}', '')
          //         .replaceAll(',', '') !=
          //     _flavorsController.text) {
          //   var offset = _flavorsController.selection.base.offset;
          //   _flavorsController.text = state.flavors
          //       .toString()
          //       .replaceAll('{', '')
          //       .replaceAll('}', '')
          //       .replaceAll(',', '');
          //
          //   while (_flavorsController.text.contains('  ')) {
          //     _flavorsController.text =
          //         _flavorsController.text.replaceFirst('  ', ' ');
          //     offset--;
          //   }
          //
          //   _flavorsController.selection = TextSelection.fromPosition(
          //       offset <= _flavorsController.text.length
          //           ? TextPosition(offset: offset)
          //           : TextPosition(offset: offset - 1));
          // }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Stack(fit: StackFit.expand, children: [
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        BuildTop(
                          projectPath: state.projectPath,
                          projectName: state.projectName,
                          onPathChange: (projectPath) {
                            context.read<AppBloc>().add(
                                ProjectPathChange(projectPath: projectPath));
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
                            const SizedBox(width: 20),
                            NavigationButton(
                              selected: context.read<AppBloc>().state.tab == 0,
                              label: 'Base',
                              onTap: () => context
                                  .read<AppBloc>()
                                  .add(const TabChange(tabIndex: 0)),
                            ),
                            const SizedBox(width: 10),
                            NavigationButton(
                              selected: context.read<AppBloc>().state.tab == 1,
                              label: 'Screen',
                              onTap: () => context
                                  .read<AppBloc>()
                                  .add(const TabChange(tabIndex: 1)),
                            ),
                            const SizedBox(width: 10),
                            NavigationButton(
                              selected: context.read<AppBloc>().state.tab == 2,
                              label: 'Entity',
                              onTap: () => context
                                  .read<AppBloc>()
                                  .add(const TabChange(tabIndex: 2)),
                            ),
                            const SizedBox(width: 20),
                            const Expanded(
                              child: Divider(
                                thickness: 1,
                                height: 40,
                                color: CupertinoColors.activeOrange,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        if (state.tab == 0)
                          Expanded(
                            child: BuildBase(
                              state: state,
                              projectNameController: _projectNameController,
                              organizationController: _projectOrgController,
                              flavorsController: _flavorsController,
                              outputStream: outputService.outputStream,
                              outputText: outputService.outputLines,
                              onGenerate: () async {
                                if (state.projectName.isEmpty ||
                                    state.organization.isEmpty ||
                                    state.generatingState ==
                                        GeneratingState.generating ||
                                    !state.platforms.selected) {
                                } else {
                                  outputService.clear();
                                  context
                                      .read<AppBloc>()
                                      .add(const GenerateProject());
                                }
                              },
                            ),
                          )
                        else if (state.tab == 1)
                          Expanded(
                            child: BuildScreen(
                              state: state,
                              projectNameController: _projectNameController,
                              onGenerate: () {
                                outputService.clear();
                                context
                                    .read<AppBloc>()
                                    .add(const ScreensGenerate());
                              },
                            ),
                          )
                        else
                          Expanded(
                            child: BuildEntity(
                              state: state,
                              projectNameController: _projectNameController,
                              onGenerate: () {
                                outputService.clear();
                                context
                                    .read<AppBloc>()
                                    .add(const EntitiesGenerate());
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                if (state.generatingState == GeneratingState.generating ||
                    state.generatingState == GeneratingState.waiting)
                  OutputWidget(
                    canClose: state.generatingState == GeneratingState.waiting,
                  ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
