import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/bloc/data_components_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/entity_table_expansion_tile.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/source_widgets/source_table_expansion_title.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widgets/dialogs/dialog.dart';

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

  @override
  void onBlocCreated(BuildContext context, DataComponentsScreenBloc bloc) {
    bloc.add(DataComponentsScreenEventInit(config: widget.config));
    super.onBlocCreated(context, bloc);
  }

  void _onSingleResult(
      BuildContext context, DataComponentsScreenSR singleResult) {
    singleResult.when(
      error: (message) => Dialogs.showOkDialog(
          context: context, title: "Error!", content: message, isError: true),
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
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SourceTableExpansionTile(
                        sources: state.config.sources.toList(),
                      ),
                      const SizedBox(height: 20),
                      EntityTableExpansionTile(
                        dataComponents: state.config.dataComponents.toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Delimiter.height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppFilledButton(
                  label: S.of(context).goBack,
                  icon: Icons.arrow_back_ios_rounded,
                  onPressed: () => _onBack(context, state),
                ),
                const Delimiter.width(10),
                AppFilledButton(
                  label: S.of(context).continueLabel,
                  icon: Icons.arrow_forward_ios_rounded,
                  iconLeft: false,
                  onPressed: () => _onContinue(context, state),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onBack(BuildContext context, DataComponentsScreenState state) {
    context.go(AppRouter.swaggerParserScreen,
        extra: widget.config.copyWith(
          sources: state.config.sources,
          dataComponents: state.config.dataComponents,
        ));
  }

  void _onContinue(BuildContext context, DataComponentsScreenState state) {
    // context.go(AppRouter.swaggerParserScreen, extra: widget.config.copyWith(
    //   sources: state.sources,
    //   dataComponents: state.dataComponents,
    // ));
  }
}
