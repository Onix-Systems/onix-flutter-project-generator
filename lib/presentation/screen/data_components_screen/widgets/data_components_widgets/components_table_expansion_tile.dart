import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/bloc/data_components_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/add_component_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/components_table.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';

class EntityTableExpansionTile extends StatefulWidget {
  final List<DataComponent> dataComponents;

  const EntityTableExpansionTile({
    required this.dataComponents,
    super.key,
  });

  @override
  State<EntityTableExpansionTile> createState() =>
      _EntityTableExpansionTileState();
}

class _EntityTableExpansionTileState extends State<EntityTableExpansionTile> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataComponentsScreenBloc, DataComponentsScreenState>(
      listener: (context, state) {
        if (state.config.dataComponents.isNotEmpty) {
          setState(() {
            expanded = true;
          });
        }
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: CupertinoColors.systemGrey,
              width: 0.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10),
            color: expanded
                ? AppColors.grayBG
                : CupertinoColors.activeBlue.withOpacity(0.1),
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
                    padding: const EdgeInsets.all(10),
                    child: CupertinoListTile(
                      padding: EdgeInsets.zero,
                      title: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  '${S.of(context).standaloneDataComponents} ${widget.dataComponents.length}',
                                  textAlign: TextAlign.center,
                                  style: context.appTextStyles.fs18?.copyWith(
                                      color: CupertinoColors.activeOrange),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            left: 0,
                            child: AppFilledButton(
                              label: S.of(context).addComponent,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              minimumSize: const Size(0, 50),
                              icon: CupertinoIcons.add,
                              onPressed: () =>
                                  showCupertinoModalPopup<DataComponent>(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const AddComponentDialog(
                                  dataComponent: null,
                                  source: null,
                                ),
                              ).then((entity) {
                                if (entity != null) {
                                  blocOf(context).add(
                                    DataComponentsScreenEventAddDataComponent(
                                        dataComponent: entity, source: null),
                                  );
                                }
                              }),
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        expanded
                            ? CupertinoIcons.chevron_up
                            : CupertinoIcons.chevron_down,
                        color: CupertinoColors.activeOrange,
                      ),
                    ),
                  ),
                ),
              ),
              if (expanded)
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: ComponentsTable(
                    dataComponents: widget.dataComponents.toSet(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  DataComponentsScreenBloc blocOf(BuildContext context) =>
      context.read<DataComponentsScreenBloc>();
}
