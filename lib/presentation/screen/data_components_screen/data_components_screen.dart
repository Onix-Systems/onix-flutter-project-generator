import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/bloc/data_components_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/components_table_expansion_tile.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/source_widgets/source_table_expansion_title.dart';
import 'package:onix_flutter_bricks/presentation/screen/modify_project_screen/bloc/modify_project_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/modify_project_screen/bloc/modify_project_screen_models.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/navigation_button_bar.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';
import 'package:onix_flutter_bricks/presentation/widget/title_bar.dart';

class DataComponentsScreen extends StatefulWidget {
  final Config config;
  final VoidCallback? onGenerate;
  final VoidCallback? onBack;
  final Stream<ModifyProjectScreenSR>? onSR;

  const DataComponentsScreen({
    required this.config,
    this.onBack,
    this.onSR,
    this.onGenerate,
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
        navigationBar: TitleBar(
          title: S.of(context).dataComponents,
        ),
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
    widget.onSR?.listen((sr) {
      if (sr is ModifyProjectScreenSROnRefresh) {
        bloc.add(DataComponentsScreenEventInit(config: widget.config));
      }
    });
    bloc.add(DataComponentsScreenEventInit(config: widget.config));
    super.onBlocCreated(context, bloc);
  }

  void _onSingleResult(
      BuildContext context, DataComponentsScreenSR singleResult) {
    singleResult.when(
      error: (message) => Dialogs.showOkDialog(
          context: context,
          title: '${S.of(context).error}!',
          content: Text(
            message,
            style: context.appTextStyles.fs18?.copyWith(
              fontSize: 16,
            ),
          ),
          isError: true),
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    DataComponentsScreenState state,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Delimiter.height(100),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: context.appColors.controlColor,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SourceTableExpansionTile(
                        sources: state.config.sources
                            .toList()
                            .sorted((a, b) => a.name.compareTo(b.name)),
                      ),
                      const SizedBox(height: 20),
                      EntityTableExpansionTile(
                        dataComponents: state.config.dataComponents
                            .toList()
                            .sorted((a, b) => a.name.compareTo(b.name)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Delimiter.height(10),
            NavigationButtonBar(
              nextText: S.of(context).continueLabel,
              prevText: S.of(context).goBack,
              onNextPressed: () {
                _onContinue(context, state);
              },
              onPrevPressed: () {
                _onBack(context, state);
              },
            ),

            ///Todo existing project flow
            /*  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppFilledButton(
                  label: S.of(context).goBack,
                  icon: Icons.arrow_back_ios_rounded,
                  onPressed: () => _onBack(context, state),
                ),
                const Delimiter.width(10),
                if (state.config.projectExists) ...[
                  AppFilledButton(
                    label: S.of(context).getFromSwagger,
                    icon: Icons.dataset_outlined,
                    onPressed: () {
                      context
                          .push(
                        AppRouter.swaggerParserScreen,
                        extra: state.config,
                      )
                          .then((_) {
                        blocOf(context).add(
                          const DataComponentsScreenEventStateUpdate(),
                        );
                      });
                    },
                  ),
                  const Delimiter.width(10),
                ],
                AppFilledButton(
                  label: state.config.projectExists
                      ? S.of(context).generate
                      : S.of(context).continueLabel,
                  icon: state.config.projectExists
                      ? Icons.local_fire_department
                      : Icons.arrow_forward_ios_rounded,
                  iconLeft: false,
                  color: state.config.projectExists
                      ? CupertinoColors.destructiveRed
                      : null,
                  active: widget.config.projectExists
                      ? sourceRepository.containsNewComponents() ||
                          dataComponentRepository.containsNewComponents() ||
                          screenRepository.containsNewComponents() ||
                          state.config.styles.isNotEmpty
                      : true,
                  onPressed: () => _onContinue(context, state),
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }

  void _onBack(BuildContext context, DataComponentsScreenState state) {
    state.config.projectExists
        ? widget.onBack?.call()
        : context.go(
            AppRouter.swaggerParserScreen,
            extra: widget.config,
          );
  }

  void _onContinue(BuildContext context, DataComponentsScreenState state) {
    state.config.projectExists
        ? widget.onGenerate?.call()
        : context.go(AppRouter.summaryScreen, extra: widget.config);
  }
}
