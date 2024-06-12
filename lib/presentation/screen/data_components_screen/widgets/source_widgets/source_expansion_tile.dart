import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/bloc/data_components_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/add_component_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/components_table.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/source_widgets/add_source_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/source_widgets/delete_source_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/screen_table_cell.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:recase/recase.dart';

class SourceExpansionTile extends StatefulWidget {
  final Source source;
  final bool isFirst;
  final bool isLast;

  const SourceExpansionTile({
    required this.source,
    required this.isFirst,
    required this.isLast,
    super.key,
  });

  @override
  State<SourceExpansionTile> createState() => _SourceExpansionTileState();
}

class _SourceExpansionTileState extends State<SourceExpansionTile> {
  bool expanded = true;

  String oldSourceName = '';

  @override
  void initState() {
    super.initState();
    oldSourceName = widget.source.name;
  }

  @override
  Widget build(BuildContext context) {
    oldSourceName = widget.source.name;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: context.appColors.fadedColor,
          width: 1,
        ),
        color: context.appColors.darkContrastColor,
      ),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Delimiter.width(22),
                    Cell(
                      value: Text(
                        '${widget.source.name.pascalCase}Source',
                        style: context.appTextStyles.fs18,
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
                              CupertinoButton(
                                color: widget.source.exists ||
                                        widget.source.isGenerated
                                    ? context.appColors.fadedColor
                                    : context.appColors.contrastColor,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                pressedOpacity: _pressedOpacity(widget.source),
                                onPressed: () {
                                  widget.source.exists ||
                                          widget.source.isGenerated
                                      ? null
                                      : showCupertinoModalPopup<Source>(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) => AddSourceDialog(
                                              source: widget.source),
                                        ).then((source) {
                                          if (source != null) {
                                            blocOf(context).add(
                                              DataComponentsScreenEventModifySource(
                                                  source: source,
                                                  oldSourceName: oldSourceName),
                                            );
                                          }
                                        });
                                },
                                child: Text(
                                  S.of(context).modify,
                                  style: context.appTextStyles.fs18?.copyWith(
                                    color: context.appColors.textColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              CupertinoButton(
                                color: context.appColors.contrastColor,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                onPressed: () {
                                  showCupertinoModalPopup<DataComponent>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => AddComponentDialog(
                                      dataComponent: null,
                                      source: widget.source,
                                    ),
                                  ).then((entity) {
                                    if (entity != null) {
                                      blocOf(context).add(
                                        DataComponentsScreenEventAddDataComponent(
                                            dataComponent: entity,
                                            source: widget.source),
                                      );
                                    }
                                  });
                                },
                                child: Text(
                                  S.of(context).addComponent,
                                  style: context.appTextStyles.fs18?.copyWith(
                                    color: context.appColors.textColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              CupertinoButton(
                                color: widget.source.exists ||
                                        widget.source.isGenerated
                                    ? context.appColors.fadedColor
                                    : context.appColors.contrastColor,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                pressedOpacity: _pressedOpacity(widget.source),
                                onPressed: () {
                                  widget.source.exists ||
                                          widget.source.isGenerated
                                      ? null
                                      : showCupertinoModalPopup<bool>(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (context) =>
                                              DeleteSourceDialog(
                                                sourceName: widget.source.name,
                                              )).then((withDataComponents) {
                                          if (withDataComponents != null) {
                                            blocOf(context).add(
                                              DataComponentsScreenEventDeleteSource(
                                                sourceName: widget.source.name,
                                                withDataComponents:
                                                    withDataComponents,
                                              ),
                                            );
                                          }
                                        });
                                },
                                child: Text(
                                  S.of(context).delete,
                                  style: context.appTextStyles.fs18?.copyWith(
                                    color: context.appColors.textColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (widget.source.dataComponentsNames.isNotEmpty)
                      Icon(
                        expanded
                            ? CupertinoIcons.chevron_up
                            : CupertinoIcons.chevron_down,
                        color: context.appColors.controlColor,
                      )
                    else
                      const SizedBox(width: 24),
                  ],
                ),
              ),
            ),
          ),
          if (widget.source.dataComponentsNames.isNotEmpty && expanded) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ComponentsTable(
                dataComponents: widget.source.dataComponentsNames
                    .map((e) => dataComponentRepository.getDataComponentByName(
                        dataComponentName: e))
                    .whereNotNull()
                    .toList()
                    .sorted((a, b) => a.name.compareTo(b.name))
                    .toSet(),
                source: widget.source,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }

  double _pressedOpacity(Source source) =>
      !widget.source.exists && !widget.source.isGenerated ? 0.5 : 1;

  DataComponentsScreenBloc blocOf(BuildContext context) =>
      context.read<DataComponentsScreenBloc>();
}
