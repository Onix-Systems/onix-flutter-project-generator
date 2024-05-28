import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/bloc/data_components_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/add_component_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/component_preview_modal.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/screen_table_cell.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';
import 'package:recase/recase.dart';

class ComponentsTable extends StatelessWidget {
  final Set<DataComponent> dataComponents;
  final Source? source;

  const ComponentsTable({
    required this.dataComponents,
    this.source,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: context.appColors.fadedColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: context.appColors.fadedColor,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              borderRadius: source == null
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )
                  : null,
              color: context.appColors.contrastColor,
            ),
            child: Row(
              children: [
                Cell(
                  value: Text(
                    S.of(context).dataComponent,
                    textAlign: TextAlign.center,
                    style: context.appTextStyles.fs18,
                  ),
                  decorated: true,
                ),
                Cell(
                  value: Text(
                    '${S.of(context).generate} ${S.of(context).request.toLowerCase()}',
                    textAlign: TextAlign.center,
                    style: context.appTextStyles.fs18,
                  ),
                  decorated: true,
                ),
                Cell(
                  value: Text(
                    '${S.of(context).generate} ${S.of(context).response.toLowerCase()}',
                    textAlign: TextAlign.center,
                    style: context.appTextStyles.fs18,
                  ),
                  decorated: true,
                ),
                Cell(
                  value: Text(
                    S.of(context).actions,
                    textAlign: TextAlign.center,
                    style: context.appTextStyles.fs18,
                  ),
                ),
              ],
            ),
          ),
          ...dataComponents.map(
            (dataComponent) => Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: context.appColors.darkContrastColor,
                borderRadius: dataComponent == dataComponents.last
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                    : null,
                border: dataComponent == dataComponents.last
                    ? null
                    : Border(
                        bottom: BorderSide(
                          color: context.appColors.fadedColor,
                          width: 1,
                        ),
                      ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Cell(
                    value: Text(
                      dataComponent.name.pascalCase,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextStyles.fs18?.copyWith(
                          color: dataComponent.exists
                              ? context.appColors.fadedColor
                              : context.appColors.textColor),
                    ),
                    decorated: true,
                    alignment: Alignment.centerLeft,
                  ),
                  Cell(
                    value: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (dataComponent.isEnum)
                          Text(
                            'enum',
                            style: context.appTextStyles.fs18,
                          )
                        else
                          MSHCheckbox(
                            value: dataComponent.generateRequest,
                            onChanged: (_) {},
                            isDisabled: true,
                            duration: const Duration(milliseconds: 200),
                            colorConfig: dataComponent.exists
                                ? MSHColorConfig.fromCheckedUncheckedDisabled(
                                    checkedColor: context.appColors.fadedColor,
                                    uncheckedColor:
                                        context.appColors.fadedColor,
                                    disabledColor: context.appColors.fadedColor,
                                  )
                                : MSHColorConfig.fromCheckedUncheckedDisabled(
                                    checkedColor:
                                        context.appColors.controlColor,
                                    uncheckedColor:
                                        context.appColors.controlColor,
                                    disabledColor:
                                        context.appColors.controlColor,
                                  ),
                          ),
                      ],
                    ),
                    decorated: true,
                  ),
                  Cell(
                    value: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (dataComponent.isEnum)
                          Text(
                            'enum',
                            style: context.appTextStyles.fs18,
                          )
                        else
                          MSHCheckbox(
                            value: dataComponent.generateResponse,
                            onChanged: (_) {},
                            isDisabled: true,
                            duration: const Duration(milliseconds: 200),
                            colorConfig: dataComponent.exists
                                ? MSHColorConfig.fromCheckedUncheckedDisabled(
                                    checkedColor: context.appColors.fadedColor,
                                    uncheckedColor:
                                        context.appColors.fadedColor,
                                    disabledColor: context.appColors.fadedColor,
                                  )
                                : MSHColorConfig.fromCheckedUncheckedDisabled(
                                    checkedColor:
                                        context.appColors.controlColor,
                                    uncheckedColor:
                                        context.appColors.controlColor,
                                    disabledColor:
                                        context.appColors.controlColor,
                                  ),
                          ),
                      ],
                    ),
                    decorated: true,
                  ),
                  Cell(
                    value: SizedBox(
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Delimiter.width(10),
                            SizedBox(
                              width: 120,
                              child: CupertinoButton(
                                color: context.appColors.contrastColor,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                pressedOpacity: !dataComponent.isEnum ? 0.5 : 1,
                                onPressed: () {
                                  if (!dataComponent.exists &&
                                      !dataComponent.isEnum &&
                                      !dataComponent.isGenerated) {
                                    showCupertinoModalPopup<DataComponent>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) => AddComponentDialog(
                                        dataComponent:
                                            DataComponent.copyOf(dataComponent),
                                        source: source,
                                      ),
                                    ).then((component) {
                                      if (component != null) {
                                        blocOf(context).add(
                                          DataComponentsScreenEventModifyDataComponent(
                                              dataComponent: component,
                                              oldDataComponentName:
                                                  dataComponent.name,
                                              source: source),
                                        );
                                      }
                                    });
                                  } else {
                                    showCupertinoModalPopup(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) =>
                                          ComponentPreviewModal(
                                        dataComponent: dataComponent,
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  !dataComponent.exists &&
                                          //!dataComponent.isEnum &&
                                          !dataComponent.isGenerated
                                      ? S.of(context).modify
                                      : S.of(context).preview,
                                  style: context.appTextStyles.fs18?.copyWith(
                                    color: context.appColors.textColor,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            CupertinoButton(
                              color: dataComponent.exists ||
                                      dataComponent.isGenerated
                                  ? context.appColors.fadedColor
                                  : context.appColors.contrastColor,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              pressedOpacity: !dataComponent.exists &&
                                      !dataComponent.isEnum &&
                                      !dataComponent.isGenerated
                                  ? 0.5
                                  : 1,
                              onPressed: () {
                                if (!dataComponent.exists &&
                                    !dataComponent.isGenerated) {
                                  Dialogs.showOkCancelDialog(
                                      context: context,
                                      title: S
                                          .of(context)
                                          .deleteComponentConfirmation(
                                              dataComponent.name.pascalCase),
                                      isError: true,
                                      content: const SizedBox(),
                                      onOk: () {
                                        blocOf(context).add(
                                          DataComponentsScreenEventDeleteDataComponent(
                                              dataComponentName:
                                                  dataComponent.name,
                                              sourceName: source?.name ?? ''),
                                        );
                                      });
                                }
                              },
                              child: Text(
                                S.of(context).delete,
                                style: context.appTextStyles.fs18?.copyWith(
                                    color: context.appColors.textColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataComponentsScreenBloc blocOf(BuildContext context) =>
      context.read<DataComponentsScreenBloc>();
}
