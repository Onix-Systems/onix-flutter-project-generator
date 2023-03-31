import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/colored_line.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/platforms_selector.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/signing_dialog.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_segmented_control.dart';
import 'package:onix_flutter_bricks/presentation/widgets/switch_with_label.dart';
import 'package:onix_flutter_bricks/presentation/widgets/text_field_with_label.dart';

class BuildBase extends StatelessWidget {
  const BuildBase({
    Key? key,
    required this.state,
    required this.projectNameController,
    required this.organizationController,
    required this.flavorsController,
    required this.onGenerate,
    required this.outputStream,
    required this.outputText,
  }) : super(key: key);

  final AppState state;

  final TextEditingController projectNameController;
  final TextEditingController organizationController;
  final TextEditingController flavorsController;

  final VoidCallback onGenerate;

  final Stream<ColoredLine> outputStream;
  final List<ColoredLine> outputText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: CupertinoColors.systemOrange),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFieldWithLabel(
                  label: 'Project name:',
                  expanded: true,
                  textController: projectNameController,
                  value: state.projectName,
                  error: state.projectExists,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_]')),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: TextFieldWithLabel(
                  label: 'Organization:',
                  expanded: true,
                  textController: organizationController,
                  value: state.organization,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[-a-zA-Z0-9.]')),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: CupertinoColors.systemOrange),
            borderRadius: BorderRadius.circular(10),
          ),
          child: PlatformSelector(
            platforms: state.platforms,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemOrange),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SwitchWithLabel(
                      label: 'Flavorize?',
                      initialValue: state.flavorize,
                      subLabel:
                          '(DEV & PROD flavors will be added automatically)',
                      valueSetter: (_) {
                        context.read<AppBloc>().add(const FlavorizeChange());
                      },
                    ),
                    if (state.flavorize) ...[
                      const SizedBox(height: 20),
                      TextFieldWithLabel(
                        label: 'Add flavors:',
                        expanded: true,
                        subLabel: '(space separated)',
                        textController: flavorsController,
                        value: state.flavors.toString(),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z0-9 ]')),
                        ],
                        onChanged: () {
                          context.read<AppBloc>().add(FlavorsChange(
                                flavors: flavorsController.text,
                              ));
                        },
                      ),
                    ],
                    const SizedBox(height: 20),
                    SwitchWithLabel(
                      label: 'Generate signing key?',
                      initialValue: state.generateSigningKey,
                      subLabel: '(Dialog will open in separate window)',
                      valueSetter: (_) {
                        context
                            .read<AppBloc>()
                            .add(const GenerateSigningKeyChange());
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            showCupertinoModalPopup<List<String>>(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => SigningDialog(state: state),
                            ).then((signingVars) {
                              context.read<AppBloc>().add(SigningVarsChange(
                                  signingVars:
                                      signingVars ?? state.signingVars));
                            });
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: const Text('Modify signing vars...'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SwitchWithLabel(
                      label: 'Will you use Sonar?',
                      initialValue: state.useSonar,
                      valueSetter: (_) {
                        context.read<AppBloc>().add(const UseSonarChange());
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemOrange),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    LabeledSegmentedControl(
                      label: 'Router:',
                      values: ProjectRouter.values.map((e) => e.name).toList(),
                      onChange: (_) {
                        context.read<AppBloc>().add(const RouterChange());
                      },
                      selectedValue: state.router.name,
                    ),
                    const SizedBox(height: 20),
                    LabeledSegmentedControl(
                      label: 'Localization:',
                      values: ProjectLocalization.values
                          .map((e) => e.name)
                          .toList(),
                      onChange: (_) {
                        context.read<AppBloc>().add(const LocalizationChange());
                      },
                      selectedValue: state.localization.name,
                    ),
                    const SizedBox(height: 20),
                    LabeledSegmentedControl(
                      label: 'Theming:',
                      values: ProjectTheming.values.map((e) => e.name).toList(),
                      onChange: (_) {
                        context.read<AppBloc>().add(const ThemingChange());
                      },
                      selectedValue: state.theming.name,
                    ),
                    const SizedBox(height: 20),
                    SwitchWithLabel(
                      label: 'Integrate Device Preview?',
                      initialValue: state.integrateDevicePreview,
                      valueSetter: (_) {
                        context
                            .read<AppBloc>()
                            .add(const IntegrateDevicePreviewChange());
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const Spacer(),
        CupertinoButton(
          color: state.projectName.isEmpty ||
                  state.organization.isEmpty ||
                  state.generatingState == GeneratingState.generating ||
                  !state.platforms.selected ||
                  state.projectExists
              ? AppColors.orange.withOpacity(0.03)
              : AppColors.orange,
          onPressed: () {
            if (!state.projectExists) {
              onGenerate();
            }
          },
          child: Text(
            'Generate!',
            style: TextStyle(
                color: state.generatingState == GeneratingState.generating ||
                        state.projectExists
                    ? AppColors.inactiveText
                    : CupertinoColors.black),
          ),
        ),
      ],
    );
  }
}
