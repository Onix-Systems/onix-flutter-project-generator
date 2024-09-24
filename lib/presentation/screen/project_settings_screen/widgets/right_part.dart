import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/project_state_manager.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/labeled_segmented_control.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/switch_with_label.dart';
import 'package:onix_flutter_bricks/util/enum/project_localization.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';
import 'package:onix_flutter_bricks/util/enum/project_theming.dart';
import 'package:recase/recase.dart';

class RightPart extends StatelessWidget {
  final ProjectSettingsScreenBloc bloc;
  final double height;

  const RightPart({
    required this.bloc,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = bloc.state;
    return Container(
      height: height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: context.appColors.contrastColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).stateManager,
                  style: context.appTextStyles.fs18?.copyWith(
                    color: context.appColors.textColor,
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: DropdownButton2<ProjectStateManager>(
                    value: state.config.stateManager,
                    style: context.appTextStyles.fs18?.copyWith(
                      color: context.appColors.textColor,
                    ),
                    underline: const SizedBox(),
                    alignment: Alignment.centerRight,
                    items: ProjectStateManager.values
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            alignment: Alignment.centerRight,
                            child: Text(e.name.titleCase),
                          ),
                        )
                        .toList(),
                    onChanged: (manager) {
                      if (manager != null) {
                        bloc.add(
                          ProjectSettingsScreenEventStateManagerChange(
                            stateManager: manager,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const Gap(10),
          LabeledSegmentedControl(
            label: S.of(context).router,
            values: ProjectRouter.values.map((e) => e.name).toList(),
            onChange: (_) =>
                bloc.add(const ProjectSettingsScreenEventRouterChange()),
            selectedValue: state.config.router.name,
          ),
          const Gap(20),
          LabeledSegmentedControl(
            label: S.of(context).localization,
            values: ProjectLocalization.values.map((e) => e.name).toList(),
            onChange: (_) =>
                bloc.add(const ProjectSettingsScreenEventLocalizationChange()),
            selectedValue: state.config.localization.name,
          ),
          const Gap(20),
          LabeledSegmentedControl(
            label: S.of(context).theming,
            values: ProjectTheming.values.map((e) => e.name).toList(),
            onChange: (_) =>
                bloc.add(const ProjectSettingsScreenEventThemingChange()),
            selectedValue: state.config.theming.name,
          ),
          const Gap(20),
          SwitchWithLabel(
            label: S.of(context).firebaseAuth,
            initialValue: state.config.firebaseAuth,
            valueSetter: (_) =>
                bloc.add(const ProjectSettingsScreenEventFirebaseChange()),
          ),
          if (!state.config.platformsList.webOnly) ...[
            const Gap(20),
            SwitchWithLabel(
              label: S.of(context).useScreenUtil,
              initialValue: state.config.screenUtil,
              valueSetter: (_) => bloc.add(
                const ProjectSettingsScreenEvent.screenUtilChange(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
