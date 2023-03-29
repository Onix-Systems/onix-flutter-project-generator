import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/data/model/local/entity/entity_entity.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/entity_widgets/entity_table.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';

class EntityTableExpansionTile extends StatefulWidget {
  const EntityTableExpansionTile({required this.entities, Key? key})
      : super(key: key);

  final List<EntityEntity> entities;

  @override
  State<EntityTableExpansionTile> createState() =>
      _EntityTableExpansionTileState();
}

class _EntityTableExpansionTileState extends State<EntityTableExpansionTile> {
  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
          GestureDetector(
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            child: CupertinoListTile(
              padding: EdgeInsets.zero,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Standalone entities: ${widget.entities.length}',
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(color: CupertinoColors.activeOrange),
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
          if (expanded)
            Column(
              children: [
                EntityTable(
                  entities: widget.entities.toSet(),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
