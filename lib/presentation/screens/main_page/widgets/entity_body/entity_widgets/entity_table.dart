import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/data/model/local/entity_wrapper/entity_wrapper.dart';
import 'package:onix_flutter_bricks/data/model/local/source_wrapper/source_wrapper.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/entity_widgets/add_entity_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/screen_body/screen_table_cell.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';
import 'package:recase/recase.dart';

class EntityTable extends StatelessWidget {
  const EntityTable({required this.entities, this.source, Key? key})
      : super(key: key);

  final Set<EntityWrapper> entities;
  final SourceWrapper? source;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: CupertinoColors.systemGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: CupertinoColors.systemGrey,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              borderRadius: source == null
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )
                  : null,
              color: CupertinoColors.activeBlue.withOpacity(0.1),
            ),
            child: Row(
              children: const [
                Cell(
                  value: Text('Entity', textAlign: TextAlign.center),
                  decorated: true,
                ),
                Cell(
                  value: Text('Gen request', textAlign: TextAlign.center),
                  decorated: true,
                ),
                Cell(
                  value: Text('Gen response', textAlign: TextAlign.center),
                  decorated: true,
                ),
                Cell(
                  value: Text('Actions', textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
          ...entities.map(
            (entity) => Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: AppColors.grayBG,
                borderRadius: entity == entities.last
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                    : null,
                border: entity == entities.last
                    ? null
                    : const Border(
                        bottom: BorderSide(
                          color: CupertinoColors.systemGrey,
                          width: 1,
                        ),
                      ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Cell(
                    value: Text(
                      entity.name.pascalCase,
                      style: TextStyle(
                          color: entity.exists
                              ? CupertinoColors.inactiveGray
                              : CupertinoColors.white),
                    ),
                    decorated: true,
                    alignment: Alignment.centerLeft,
                  ),
                  Cell(
                    value: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MSHCheckbox(
                          value: entity.generateRequest,
                          onChanged: (_) {},
                          isDisabled: true,
                          duration: const Duration(milliseconds: 200),
                          colorConfig: entity.exists
                              ? MSHColorConfig.fromCheckedUncheckedDisabled(
                                  checkedColor: CupertinoColors.inactiveGray,
                                  uncheckedColor: CupertinoColors.inactiveGray,
                                  disabledColor: CupertinoColors.inactiveGray,
                                )
                              : MSHColorConfig.fromCheckedUncheckedDisabled(
                                  checkedColor: CupertinoColors.activeOrange,
                                  uncheckedColor: CupertinoColors.activeOrange,
                                  disabledColor: CupertinoColors.activeOrange,
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
                        MSHCheckbox(
                          value: entity.generateResponse,
                          onChanged: (_) {},
                          isDisabled: true,
                          duration: const Duration(milliseconds: 200),
                          colorConfig: entity.exists
                              ? MSHColorConfig.fromCheckedUncheckedDisabled(
                                  checkedColor: CupertinoColors.inactiveGray,
                                  uncheckedColor: CupertinoColors.inactiveGray,
                                  disabledColor: CupertinoColors.inactiveGray,
                                )
                              : MSHColorConfig.fromCheckedUncheckedDisabled(
                                  checkedColor: CupertinoColors.activeOrange,
                                  uncheckedColor: CupertinoColors.activeOrange,
                                  disabledColor: CupertinoColors.activeOrange,
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
                            CupertinoButton(
                              color: entity.exists
                                  ? CupertinoColors.inactiveGray
                                  : CupertinoColors.activeOrange,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              onPressed: () {
                                if (!entity.exists) {
                                  showCupertinoModalPopup<EntityWrapper>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => AddEntityDialog(
                                      entity: entity,
                                      standalone: source == null,
                                    ),
                                  ).then((entity) {
                                    if (entity != null) {
                                      context.read<AppBloc>().add(
                                            const StateUpdate(),
                                          );
                                    }
                                  });
                                }
                              },
                              child: const Text('Modify'),
                            ),
                            const SizedBox(width: 10),
                            CupertinoButton(
                              color: entity.exists
                                  ? CupertinoColors.inactiveGray
                                  : CupertinoColors.activeOrange,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              onPressed: () {
                                if (!entity.exists) {
                                  context.read<AppBloc>().add(
                                        EntityDelete(
                                            entity: entity, source: source),
                                      );
                                }
                              },
                              child: const Text('Delete'),
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
}
