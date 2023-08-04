import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/add_entity_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/entity_table.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/source_widgets/add_source_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/screen_table_cell.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:recase/recase.dart';

class SourceExpansionTile extends StatefulWidget {
  const SourceExpansionTile({
    required this.source,
    required this.isFirst,
    required this.isLast,
    Key? key,
  }) : super(key: key);

  final Source source;
  final bool isFirst;
  final bool isLast;

  @override
  State<SourceExpansionTile> createState() => _SourceExpansionTileState();
}

class _SourceExpansionTileState extends State<SourceExpansionTile> {
  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: CupertinoColors.systemGrey,
          width: 1,
        ),
        color: CupertinoColors.activeBlue.withOpacity(0.1),
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
                                    ? CupertinoColors.inactiveGray
                                    : CupertinoColors.activeOrange,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                onPressed: () {
                                  widget.source.exists ||
                                          widget.source.isGenerated
                                      ? null
                                      : showCupertinoModalPopup<Source>(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) => AddSourceDialog(
                                              source: widget.source),
                                        ).then((entity) {
                                          // if (entity != null) {
                                          //   context.read<AppBloc>().add(
                                          //     const StateUpdate(),
                                          //   );
                                          // }
                                        });
                                },
                                child: const Text('Modify'),
                              ),
                              const SizedBox(width: 10),
                              CupertinoButton(
                                color: CupertinoColors.activeOrange,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                onPressed: () {
                                  showCupertinoModalPopup<DataComponent>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => const AddEntityDialog(
                                      entity: null,
                                      standalone: false,
                                    ),
                                  ).then((entity) {
                                    if (entity != null) {
                                      // context.read<AppBloc>().add(
                                      //   EntityAdd(
                                      //       entity: entity,
                                      //       source: widget.source),
                                      // );
                                    }
                                  });
                                },
                                child: const Text('Add entity'),
                              ),
                              const SizedBox(width: 10),
                              CupertinoButton(
                                color: widget.source.exists ||
                                        widget.source.isGenerated
                                    ? CupertinoColors.inactiveGray
                                    : CupertinoColors.activeOrange,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                onPressed: () {
                                  // widget.source.exists ||
                                  //     widget.source.isGenerated
                                  //     ? null
                                  //     : context.read<AppBloc>().add(
                                  //   SourceDelete(source: widget.source),
                                  // );
                                },
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (widget.source.dataComponents.isNotEmpty)
                      Icon(
                        expanded
                            ? CupertinoIcons.chevron_up
                            : CupertinoIcons.chevron_down,
                        color: CupertinoColors.activeOrange,
                      )
                    else
                      const SizedBox(width: 24),
                  ],
                ),
              ),
            ),
          ),
          if (widget.source.dataComponents.isNotEmpty && expanded) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: EntityTable(
                entities: widget.source.dataComponents.toSet(),
                source: widget.source,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}
