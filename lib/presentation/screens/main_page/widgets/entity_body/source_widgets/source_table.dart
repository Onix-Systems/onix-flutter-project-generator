import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/data/model/local/source/source_entity.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/source_widgets/source_table_expansion_title.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/screen_body/screen_table_cell.dart';

class SourceTable extends StatefulWidget {
  const SourceTable({required this.sources, Key? key}) : super(key: key);

  final Set<SourceEntity> sources;

  @override
  State<SourceTable> createState() => _SourceTableState();
}

class _SourceTableState extends State<SourceTable> {
  bool expanded = false;

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
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: CupertinoColors.activeBlue.withOpacity(0.1),
            ),
            child: Row(
              children: [
                Cell(
                    decorated: false,
                    value: SourceTableExpansionTile(
                        sources: widget.sources.toList())),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
