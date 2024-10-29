import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/signing_dialog.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/switch_with_label.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/text_field_with_label.dart';
import 'package:onix_flutter_bricks/util/extra_space_formatter.dart';

class LeftPart extends StatelessWidget {
  final ProjectSettingsScreenBloc bloc;
  final TextEditingController flavorsController;

  const LeftPart({
    required this.bloc,
    required this.flavorsController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = bloc.state;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.appColors.contrastColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!state.config.platformsList.webOnly) ...[
            SwitchWithLabel(
              label: S.of(context).flavorize,
              initialValue: state.config.flavorize,
              subLabel: S.of(context).willBeAddedAutomatically,
              valueSetter: (_) => bloc.add(
                const ProjectSettingsScreenEventFlavorizeChange(),
              ),
            ),
            const Gap(20),
          ],
          if (!state.config.platformsList.webOnly &&
              state.config.flavorize) ...[
            TextFieldWithLabel(
              label: S.of(context).addFlavors,
              expanded: true,
              subLabel: S.of(context).spaceSeparated,
              textController: flavorsController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z\s]', unicode: true),
                ),
                ExtraSpaceFormatter(),
              ],
              onChanged: () => bloc.add(
                ProjectSettingsScreenEventFlavorsChange(
                  flavors: flavorsController.text,
                ),
              ),
            ),
            const Gap(20),
          ],
          if (state.config.platformsList.mobile) ...[
            SwitchWithLabel(
              label: S.of(context).generateSigningKey,
              initialValue: state.config.generateSigningKey,
              subLabel: S.of(context).dialogWillOpenInSeparateWindow,
              valueSetter: (value) {
                bloc.add(
                  ProjectSettingsScreenEventGenerateSigningKeyChange(
                    generateSigningKey: value,
                  ),
                );
                if (value) {
                  _showSigningVarsDialog(
                    context: context,
                    state: state,
                    toggleGenerateSigningKey: true,
                  );
                }
              },
            ),
            TextButton(
              onPressed: () =>
                  _showSigningVarsDialog(context: context, state: state),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Text(S.of(context).modifySigningVars),
            ),
            const Gap(20),
          ],
          SwitchWithLabel(
            label: S.of(context).useSonar,
            initialValue: state.config.useSonar,
            valueSetter: (_) =>
                bloc.add(const ProjectSettingsScreenEventUseSonarChange()),
          ),
          const Gap(20),
          SwitchWithLabel(
            label: S.of(context).integrateGraphQl,
            initialValue: state.config.graphql,
            valueSetter: (_) =>
                bloc.add(const ProjectSettingsScreenEventGraphQLChange()),
          ),
          const Gap(20),
          SwitchWithLabel(
            label: S.of(context).integrateSentry,
            initialValue: state.config.sentry,
            valueSetter: (_) => bloc.add(
              const ProjectSettingsScreenEvent.sentryChange(),
            ),
          ),
        ],
      ),
    );
  }

  void _showSigningVarsDialog({
    required BuildContext context,
    required ProjectSettingsScreenState state,
    bool toggleGenerateSigningKey = false,
  }) {
    showCupertinoModalPopup<List<String>>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => SigningDialog(
        signingVars: state.config.signingVars,
      ),
    ).then(
      (signingVars) {
        if (!context.mounted) return;
        bloc.add(
          ProjectSettingsScreenEventSigningVarsChange(
            signingVars: signingVars ?? state.config.signingVars,
          ),
        );
        if (toggleGenerateSigningKey) {
          bloc.add(
            ProjectSettingsScreenEventGenerateSigningKeyChange(
              generateSigningKey: signingVars != null,
            ),
          );
        }
      },
    );
  }
}
