import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/state_management/project_state_manager.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_models.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';
import 'package:recase/recase.dart';

class StateSelector extends StatelessWidget {
  final ProjectSettingsScreenBloc bloc;
  const StateSelector({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = bloc.state;
    return Row(
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
                if (manager != state.config.stateManager &&
                    state.config.screens.isNotEmpty &&
                    !bloc.screensMatchStrategy(manager)) {
                  Dialogs.showOkCancelDialog(
                    context: context,
                    title: S.of(context).changeStateManagerError,
                    content: Text(
                      S.of(context).changeStateManagerErrorContent(
                            manager.strategy.variants.first.name,
                          ),
                      style: context.appTextStyles.fs18,
                    ),
                    onOk: () => _onStateManagerChange(
                      manager: manager,
                      bloc: bloc,
                    ),
                  );
                } else {
                  _onStateManagerChange(manager: manager, bloc: bloc);
                }
              }
            },
          ),
        ),
      ],
    );
  }

  void _onStateManagerChange({
    required ProjectStateManager manager,
    required ProjectSettingsScreenBloc bloc,
  }) {
    bloc.add(
      ProjectSettingsScreenEventStateManagerChange(
        stateManager: manager,
      ),
    );
  }
}
