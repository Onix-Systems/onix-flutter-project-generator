import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/bloc/data_components_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/entity_table_expansion_tile.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/source_widgets/source_table_expansion_title.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';

class DataComponentsScreen extends StatefulWidget {
  final Config config;

  const DataComponentsScreen({
    required this.config,
    super.key,
  });

  @override
  State<DataComponentsScreen> createState() => _DataComponentsScreenState();
}

class _DataComponentsScreenState extends BaseState<DataComponentsScreenState,
    DataComponentsScreenBloc, DataComponentsScreenSR, DataComponentsScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return srObserver(
      context: context,
      child: CupertinoPageScaffold(
        child: SizedBox.expand(
          child: blocConsumer(
            stateListener: (state) => _buildMainContainer(context, state),
          ),
        ),
      ),
      onSR: _onSingleResult,
    );
  }

  void _onSingleResult(
      BuildContext context, DataComponentsScreenSR singleResult) {
    singleResult.when(
      loadFinished: () {},
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    DataComponentsScreenState state,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    widget.config.sources.isNotEmpty
                        ? SourceTableExpansionTile(
                            sources: widget.config.sources.toList(),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 20),
                    widget.config.dataComponents.isNotEmpty
                        ? EntityTableExpansionTile(
                            dataComponents:
                                widget.config.dataComponents.toList(),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            const Delimiter.height(20),
            AppFilledButton(
              label: S.of(context).continueLabel,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
