import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/source_widgets/source_expansion_tile.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class SourceTableExpansionTile extends StatefulWidget {
  const SourceTableExpansionTile({required this.sources, Key? key})
      : super(key: key);

  final List<Source> sources;

  @override
  State<SourceTableExpansionTile> createState() =>
      _SourceTableExpansionTileState();
}

class _SourceTableExpansionTileState extends State<SourceTableExpansionTile> {
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
                          'Sources: ${widget.sources.length}',
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
          if (widget.sources.isNotEmpty && expanded) ...[
            ...widget.sources.map(
              (source) => Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 10, right: 10, bottom: 10),
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
