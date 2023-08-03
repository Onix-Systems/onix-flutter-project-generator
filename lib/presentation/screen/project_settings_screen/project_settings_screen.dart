import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/platforms_list/platforms_list.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/widgets/signing_dialog.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widgets/inputs/labeled_segmented_control.dart';
import 'package:onix_flutter_bricks/presentation/widgets/inputs/switch_with_label.dart';
import 'package:onix_flutter_bricks/presentation/widgets/inputs/text_field_with_label.dart';

class ProjectSettingsScreen extends StatefulWidget {
  final ProjectSettingsScreenExtra extra;

  const ProjectSettingsScreen({
    required this.extra,
    super.key,
  });

  @override
  State<ProjectSettingsScreen> createState() => _ProjectSettingsScreenState();
}

class _ProjectSettingsScreenState extends BaseState<ProjectSettingsScreenState,
    ProjectSettingsScreenBloc, ProjectSettingsScreenSR, ProjectSettingsScreen> {
  final TextEditingController _flavorsController = TextEditingController();

  @override
  Widget buildWidget(BuildContext context) {
    return srObserver(
      context: context,
      child: CupertinoPageScaffold(
        child: SizedBox.expand(
          child: blocConsumer(
            stateListener: (state) => _buildMainContainer(context, state),
          ),
        ),
      ),
      onSR: _onSingleResult,
    );
  }

  void _onSingleResult(
      BuildContext context, ProjectSettingsScreenSR singleResult) {
    singleResult.when(
      loadFinished: () {},
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    ProjectSettingsScreenState state,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 300,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.orange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SwitchWithLabel(
                          label: 'Flavorize?',
                          initialValue: state.flavorize,
                          subLabel:
                              '(DEV & PROD flavors will be added automatically)',
                          valueSetter: (_) => blocOf(context).add(
                              const ProjectSettingsScreenEventFlavorizeChange()),
                        ),
                        if (state.flavorize) ...[
                          const SizedBox(height: 20),
                          TextFieldWithLabel(
                            label: 'Add flavors:',
                            expanded: true,
                            subLabel: '(space separated)',
                            textController: _flavorsController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z ]')),
                            ],
                            onChanged: () => blocOf(context)
                                .add(ProjectSettingsScreenEventFlavorsChange(
                              flavors: _flavorsController.text,
                            )),
                          ),
                        ],
                        const SizedBox(height: 20),
                        SwitchWithLabel(
                          label: 'Generate signing key?',
                          initialValue: state.generateSigningKey,
                          subLabel: '(Dialog will open in separate window)',
                          valueSetter: (_) => blocOf(context).add(
                              const ProjectSettingsScreenEventGenerateSigningKeyChange()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () =>
                                  showCupertinoModalPopup<List<String>>(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) =>
                                    SigningDialog(state: state),
                              ).then(
                                (signingVars) {
                                  blocOf(context).add(
                                    ProjectSettingsScreenEventSigningVarsChange(
                                        signingVars:
                                            signingVars ?? state.signingVars),
                                  );
                                },
                              ),
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
                          valueSetter: (_) => blocOf(context).add(
                              const ProjectSettingsScreenEventUseSonarChange()),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 300,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.systemOrange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LabeledSegmentedControl(
                          label: 'Router:',
                          values:
                              ProjectRouter.values.map((e) => e.name).toList(),
                          onChange: (_) => blocOf(context).add(
                              const ProjectSettingsScreenEventRouterChange()),
                          selectedValue: state.router.name,
                        ),
                        const SizedBox(height: 20),
                        LabeledSegmentedControl(
                          label: 'Localization:',
                          values: ProjectLocalization.values
                              .map((e) => e.name)
                              .toList(),
                          onChange: (_) => blocOf(context).add(
                              const ProjectSettingsScreenEventLocalizationChange()),
                          selectedValue: state.localization.name,
                        ),
                        const SizedBox(height: 20),
                        LabeledSegmentedControl(
                          label: 'Theming:',
                          values:
                              ProjectTheming.values.map((e) => e.name).toList(),
                          onChange: (_) => blocOf(context).add(
                              const ProjectSettingsScreenEventThemingChange()),
                          selectedValue: state.theming.name,
                        ),
                        const SizedBox(height: 20),
                        SwitchWithLabel(
                          label: 'Integrate Device Preview?',
                          initialValue: state.integrateDevicePreview,
                          valueSetter: (_) => blocOf(context).add(
                              const ProjectSettingsScreenEventIntegrateDevicePreviewChange()),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Delimiter.height(40),
            AppFilledButton(
                label: S.of(context).continueLabel, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class ProjectSettingsScreenExtra {
  final String projectPath;
  final String projectName;
  final String organization;
  final PlatformsList platformsList;

  const ProjectSettingsScreenExtra({
    required this.projectPath,
    required this.projectName,
    required this.organization,
    required this.platformsList,
  });
}
