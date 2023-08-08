import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/bloc/data_components_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/source_widgets/add_source_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/source_widgets/source_expansion_tile.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';

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
    return BlocConsumer<DataComponentsScreenBloc, DataComponentsScreenState>(
      listener: (context, state) {
        if (state.config.sources.isNotEmpty) {
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
              width: 0.0, // One physical pixel.
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10),
            color: expanded
                ? AppColors.grayBG
                : CupertinoColors.activeBlue.withOpacity(0.1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                                  'Sources: ${widget.sources.length}',
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
                              label: S.of(context).addSource,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              minimumSize: const Size(0, 50),
                              icon: CupertinoIcons.add,
                              onPressed: () => showCupertinoModalPopup<Source>(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => AddSourceDialog(),
                              ).then((source) {
                                if (source != null) {
                                  blocOf(context)
                                      .add(DataComponentsScreenEvent.addSource(
                                    source: Source(
                                        name: source.name,
                                        dataComponents: [],
                                        isGenerated: false),
                                  ));
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
      },
    );
  }

  DataComponentsScreenBloc blocOf(BuildContext context) =>
      context.read<DataComponentsScreenBloc>();
}
