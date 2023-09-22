import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/fields_dialog/add_component_tile.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/fields_dialog/bloc/fields_dialog_imports.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/remove_button.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/fields_dialog/add_field_tile.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_action_button.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class FieldsDialog extends StatefulWidget {
  final DataComponent dataComponent;

  const FieldsDialog({required this.dataComponent, super.key});

  @override
  State<FieldsDialog> createState() => _FieldsDialogState();
}

class _FieldsDialogState extends BaseState<FieldsDialogState, FieldsDialogBloc,
    FieldsDialogSR, FieldsDialog> {
  @override
  void onBlocCreated(BuildContext context, FieldsDialogBloc bloc) {
    bloc.add(FieldsDialogEventInit(
        componentName: widget.dataComponent.name.pascalCase,
        properties: widget.dataComponent.properties
            .map((e) => Property.copyOf(e))
            .toList()));
    super.onBlocCreated(context, bloc);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return srObserver(
      context: context,
      child: blocConsumer(
        stateListener: (state) => _buildMainContainer(context, state),
      ),
      onSR: _onSingleResult,
    );
  }

  void _onSingleResult(BuildContext context, FieldsDialogSR singleResult) {
    singleResult.when(
      loadFinished: () {},
      validated: () {
        widget.dataComponent.properties = blocOf(context).state.properties;
        Navigator.of(context).pop();
      },
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    FieldsDialogState state,
  ) {
    return SizedBox(
      width: 800,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.bgDark,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${widget.dataComponent.name.pascalCase} fields',
                style: context.appTextStyles.fs18,
              ),
              const Divider(
                color: AppColors.white,
                thickness: 0.25,
                height: 40,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      SliverList.separated(
                          itemCount: state.properties.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Expanded(
                                  child: _isStandardType(
                                          state.properties[index].type)
                                      ? AddFieldTile(
                                          property: state.properties[index],
                                          error: state.errorIndexes
                                              .contains(index),
                                          onChanged: (value) =>
                                              blocOf(context).add(
                                            FieldsDialogEvent.updateField(
                                              index: index,
                                              property: value,
                                            ),
                                          ),
                                        )
                                      : AddComponentTile(
                                          property: state.properties[index],
                                          components: state.components,
                                          error: state.errorIndexes
                                              .contains(index),
                                          onChanged: (value) =>
                                              blocOf(context).add(
                                            FieldsDialogEvent.updateField(
                                              index: index,
                                              property: value,
                                            ),
                                          ),
                                        ),
                                ),
                                RemoveButton(
                                  onPressed: () => blocOf(context).add(
                                      FieldsDialogEvent.removeField(
                                          index: index)),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ))
                    ],
                  ),
                ),
              ),
              const Delimiter.height(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppFilledButton(
                    label: 'Add field',
                    icon: CupertinoIcons.plus,
                    onPressed: () =>
                        blocOf(context).add(const FieldsDialogEvent.addField()),
                  ),
                  const SizedBox(width: 20),
                  AppFilledButton(
                    label: 'Add component',
                    icon: CupertinoIcons.plus,
                    onPressed: () => blocOf(context).add(
                        const FieldsDialogEvent.addField(isComponent: true)),
                  ),
                ],
              ),
              const Delimiter.height(20),
              const Divider(
                color: AppColors.white,
                thickness: 0.25,
                height: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: AppActionButton(
                      label: S.of(context).ok,
                      onPressed: () {
                        if (state.errorIndexes.isEmpty) {
                          widget.dataComponent.properties = state.properties;
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                      height: 56,
                      width: 0.3,
                      child: VerticalDivider(
                        color: AppColors.white,
                        thickness: 0.3,
                      )),
                  Expanded(
                    child: AppActionButton(
                      label: S.of(context).cancel,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isStandardType(String type) => TypeMatcher.isStandardType(
        TypeMatcher.getDartType(
          type.replaceAll('List<', '').replaceAll('>', ''),
        ),
      );
}
