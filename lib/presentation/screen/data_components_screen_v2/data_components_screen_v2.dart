import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/router/app_router.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/swagger_parser_failure.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/bloc/data_components_screen_v2_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/data_components_content.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_component_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_source_dialog.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/navigation_button_bar.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';
import 'package:onix_flutter_bricks/presentation/widget/title_bar.dart';
import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';

class DataComponentsScreenV2 extends StatefulWidget {
  final Config config;
  final VoidCallback? onGenerate;
  final VoidCallback? onBack;

  const DataComponentsScreenV2({
    required this.config,
    this.onBack,
    this.onGenerate,
    super.key,
  });

  @override
  State<DataComponentsScreenV2> createState() => _DataComponentsScreenState();
}

class _DataComponentsScreenState extends BaseState<
    DataComponentsScreenV2State,
    DataComponentsScreenV2Bloc,
    DataComponentsScreenV2SR,
    DataComponentsScreenV2> {
  @override
  DataComponentsScreenV2Bloc createBloc() =>
      GetIt.I.get<DataComponentsScreenV2Bloc>();

  @override
  void onBlocCreated(BuildContext context, DataComponentsScreenV2Bloc bloc) {
    bloc.add(DataComponentsScreenV2Event.init(config: widget.config));
    super.onBlocCreated(context, bloc);
  }

  @override
  void onFailure(BuildContext context, Failure failure) {
    if (failure is SwaggerParserFailure) {
      final message = failure.getTranslatedMessage(context);
      onSR(context, DataComponentsScreenV2SR.error(message: message));
    }
    super.onFailure(context, failure);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: TitleBar(
        title: S.of(context).dataComponents,
        actions: [
          AppFilledButton(
            label: S.of(context).addSource,
            icon: Icons.add,
            onPressed: () => showCupertinoDialog(
              context: context,
              builder: (ctx) => AddEditSourceDialog(
                bloc: blocOf(context),
              ),
            ),
          ),
          AppFilledButton(
            label: S.of(context).addComponent,
            icon: Icons.add,
            onPressed: () => showCupertinoModalPopup(
              context: context,
              builder: (ctx) => AddEditComponentDialog(
                bloc: blocOf(context),
              ),
            ),
          ),
        ],
      ),
      child: blocBuilder(
        builder: (context, state) {
          final components = state.components;
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (components == Components.empty()) ...[
                  const Gap(100),
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          S.of(context).noDataComponents,
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ] else
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: context.appColors.controlColor,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: DataComponentsContent(
                          components: components,
                          objectViews: (source) =>
                              blocOf(context).getSourceObjects(source),
                          onEdit: (sourceName) {
                            showCupertinoDialog(
                              context: context,
                              builder: (ctx) => AddEditSourceDialog(
                                sourceName: sourceName,
                                bloc: blocOf(context),
                              ),
                            );
                          },
                          onDelete: (sourceName) {
                            _showDeleteSourceDialog(
                              context,
                              sourceName: sourceName,
                            );
                          },
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
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void onSR(
    BuildContext context,
    DataComponentsScreenV2SR singleResult,
  ) {
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
        isError: true,
      ),
    );
  }

  void _onBack(BuildContext context, DataComponentsScreenV2State state) {
    state.config.projectExists
        ? widget.onBack?.call()
        : context.go(
            AppRouter.swaggerParserScreen,
            extra: widget.config,
          );
  }

  void _onContinue(BuildContext context, DataComponentsScreenV2State state) {
    state.config.projectExists
        ? widget.onGenerate?.call()
        : context.go(AppRouter.summaryScreen, extra: widget.config);
  }

  void _showDeleteSourceDialog(
    BuildContext context, {
    required String sourceName,
  }) {
    Dialogs.showOkCancelDialog(
      context: context,
      title: S.of(context).sourceDeletingDialogTitle(sourceName),
      content: const SizedBox(),
      onOk: () {
        blocOf(context).add(
          DataComponentsScreenV2Event.deleteSource(
            sourceName: sourceName,
          ),
        );
      },
    );
  }
}
