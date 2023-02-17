import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/data/model/local/source_entity.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/source_widgets/source_expansion_tile.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';

class SourceTableExpansionTile extends StatefulWidget {
  const SourceTableExpansionTile({required this.sources, Key? key})
      : super(key: key);

  final List<SourceEntity> sources;

  @override
  State<SourceTableExpansionTile> createState() =>
      _SourceTableExpansionTileState();
}

class _SourceTableExpansionTileState extends State<SourceTableExpansionTile> {
  bool expanded = false;

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
                      'Sources: ${widget.sources.length}',
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
          if (widget.sources.isNotEmpty && expanded) ...[
            ...widget.sources.map(
              (source) => Padding(
                padding: source != widget.sources.last
                    ? const EdgeInsets.only(bottom: 10)
                    : const EdgeInsets.only(bottom: 0),
                child: SourceExpansionTile(
                    source: source,
                    isFirst: source == widget.sources.first,
                    isLast: source == widget.sources.last),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
