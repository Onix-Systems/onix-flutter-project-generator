import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/arch/arch_type.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_models.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:recase/recase.dart';

class ArchSelector extends StatelessWidget {
  final ProjectSettingsScreenBloc bloc;
  const ArchSelector({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = bloc.state;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).projectArch,
            style: context.appTextStyles.fs18?.copyWith(
              color: context.appColors.textColor,
            ),
          ),
          Material(
            color: Colors.transparent,
            child: DropdownButton2<ArchType>(
              value: state.config.arch,
              style: context.appTextStyles.fs18?.copyWith(
                color: context.appColors.textColor,
              ),
              underline: const SizedBox(),
              alignment: Alignment.centerRight,
              items: ArchType.values
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      alignment: Alignment.centerRight,
                      child: Text(e.name.titleCase),
                    ),
                  )
                  .toList(),
              onChanged: (arch) {
                if (arch != null) {
                  _onArchChange(arch: arch, bloc: bloc);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onArchChange({
    required ArchType arch,
    required ProjectSettingsScreenBloc bloc,
  }) {
    bloc.add(
      ProjectSettingsScreenEventArchChange(
        arch: arch,
      ),
    );
  }
}
