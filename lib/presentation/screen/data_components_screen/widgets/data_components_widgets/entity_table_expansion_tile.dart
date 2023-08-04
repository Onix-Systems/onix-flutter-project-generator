import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/entity_table.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class EntityTableExpansionTile extends StatefulWidget {
  const EntityTableExpansionTile({required this.dataComponents, Key? key})
      : super(key: key);

  final List<DataComponent> dataComponents;

  @override
  State<EntityTableExpansionTile> createState() =>
      _EntityTableExpansionTileState();
}

class _EntityTableExpansionTileState extends State<EntityTableExpansionTile> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: CupertinoColors.systemGrey,
          width: 0.0, // One physical pixel.
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
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Standalone data components: ${widget.dataComponents.length}',
                          textAlign: TextAlign.center,
                          style: context.appTextStyles.fs18
                              ?.copyWith(color: CupertinoColors.activeOrange),
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
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: EntityTable(
                entities: widget.dataComponents.toSet(),
              ),
            ),
        ],
      ),
    );
  }
}
