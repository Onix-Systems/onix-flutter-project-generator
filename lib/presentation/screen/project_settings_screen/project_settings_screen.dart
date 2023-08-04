import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/widgets/signing_dialog.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widgets/inputs/labeled_segmented_control.dart';
import 'package:onix_flutter_bricks/presentation/widgets/inputs/switch_with_label.dart';
import 'package:onix_flutter_bricks/presentation/widgets/inputs/text_field_with_label.dart';

class ProjectSettingsScreen extends StatefulWidget {
  final Config config;

  const ProjectSettingsScreen({
    required this.config,
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
                          label: S.of(context).flavorize,
                          initialValue: state.flavorize,
                          subLabel: S.of(context).willBeAddedAutomatically,
                          valueSetter: (_) => blocOf(context).add(
                              const ProjectSettingsScreenEventFlavorizeChange()),
                        ),
                        if (state.flavorize) ...[
                          const SizedBox(height: 20),
                          TextFieldWithLabel(
                            label: S.of(context).addFlavors,
                            expanded: true,
                            subLabel: S.of(context).spaceSeparated,
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
                          label: S.of(context).generateSigningKey,
                          initialValue: state.generateSigningKey,
                          subLabel:
                              S.of(context).dialogWillOpenInSeparateWindow,
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
                              child: Text(S.of(context).modifySigningVars),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SwitchWithLabel(
                          label: S.of(context).useSonar,
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
                          label: S.of(context).router,
                          values:
                              ProjectRouter.values.map((e) => e.name).toList(),
                          onChange: (_) => blocOf(context).add(
                              const ProjectSettingsScreenEventRouterChange()),
                          selectedValue: state.router.name,
                        ),
                        const SizedBox(height: 20),
                        LabeledSegmentedControl(
                          label: S.of(context).localization,
                          values: ProjectLocalization.values
                              .map((e) => e.name)
                              .toList(),
                          onChange: (_) => blocOf(context).add(
                              const ProjectSettingsScreenEventLocalizationChange()),
                          selectedValue: state.localization.name,
                        ),
                        const SizedBox(height: 20),
                        LabeledSegmentedControl(
                          label: S.of(context).theming,
                          values:
                              ProjectTheming.values.map((e) => e.name).toList(),
                          onChange: (_) => blocOf(context).add(
                              const ProjectSettingsScreenEventThemingChange()),
                          selectedValue: state.theming.name,
                        ),
                        const SizedBox(height: 20),
                        SwitchWithLabel(
                          label: S.of(context).integrateDevicePreview,
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
              label: S.of(context).continueLabel,
              onPressed: () => context.go(
                AppRouter.screensScreen,
                extra: widget.config.copyWith(
                  flavorize: state.flavorize,
                  flavors: state.flavors,
                  generateSigningKey: state.generateSigningKey,
                  useSonar: state.useSonar,
                  router: state.router,
                  localization: state.localization,
                  theming: state.theming,
                  integrateDevicePreview: state.integrateDevicePreview,
                  signingVars: state.signingVars,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
