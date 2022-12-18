import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/data/model/local/colored_line.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/utils/platforms_list.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/build_output.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/platforms_selector.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/signing_dialog.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_segmented_control.dart';
import 'package:onix_flutter_bricks/presentation/widgets/switch_with_label.dart';
import 'package:onix_flutter_bricks/presentation/widgets/text_field_with_label.dart';
import 'package:process_run/shell.dart';

part '../utils/flutter_project_gen.dart';

class BuildBody extends StatelessWidget {
  BuildBody({
    Key? key,
    required this.state,
    required this.projectNameController,
    required this.organizationController,
    required this.flavorsController,
    required this.onGenerate,
  }) : super(key: key) {
    init();
  }

  final AppState state;

  final TextEditingController projectNameController;
  final TextEditingController organizationController;
  final TextEditingController flavorsController;

  final VoidCallback onGenerate;

  bool isGenerating = false;

  final outputStreamController = StreamController<ColoredLine>();
  late final Stream<ColoredLine> outputStream =
      outputStreamController.stream.asBroadcastStream();
  List<ColoredLine> outputText = [];

  void init() {
    outputStream.listen((event) {
      outputText.add(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 440,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFieldWithLabel(
                  label: 'Project name:',
                  textController: projectNameController,
                  value: state.projectName,
                  error: state.projectExists,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_]')),
                  ],
                ),
                const SizedBox(height: 20),
                TextFieldWithLabel(
                  label: 'Organization:',
                  textController: organizationController,
                  value: state.organization,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[-a-zA-Z0-9.]')),
                  ],
                ),
                const SizedBox(height: 20),
                PlatformSelector(
                  platforms: state.platforms,
                ),
                const SizedBox(height: 20),
                SwitchWithLabel(
                  label: 'Flavorize?',
                  initialValue: state.flavorize,
                  subLabel: '(DEV & PROD flavors will be added automatically)',
                  valueSetter: (_) {
                    context.read<AppBloc>().add(const FlavorizeChange());
                  },
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: state.flavorize,
                  child: TextFieldWithLabel(
                    label: 'Add flavors:',
                    subLabel: '(space separated)',
                    textController: flavorsController,
                    value: state.flavors.toString(),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z0-9 ]')),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
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
                  values:
                      ProjectLocalization.values.map((e) => e.name).toList(),
                  onChange: (_) {
                    context.read<AppBloc>().add(const LocalizationChange());
                  },
                  selectedValue: state.localization.name,
                ),
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
                              signingVars: signingVars ?? state.signingVars));
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
                const Spacer(),
                CupertinoButton(
                  color: isGenerating || state.projectExists
                      ? AppColors.orange.withOpacity(0.03)
                      : AppColors.orange,
                  onPressed: onGenerate,
                  child: Text(
                    'Generate!',
                    style: TextStyle(
                        color: isGenerating || state.projectExists
                            ? AppColors.inactiveText
                            : CupertinoColors.black),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: BuildOutput(
              outputStream: outputStream,
              outputText: outputText,
            ),
          ),
        ],
      ),
    );
  }
}
