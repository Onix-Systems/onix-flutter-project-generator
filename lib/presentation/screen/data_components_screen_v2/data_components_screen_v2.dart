import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/router/app_router.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/bloc/data_components_screen_v2_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/data_components_content.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/navigation_button_bar.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';
import 'package:onix_flutter_bricks/presentation/widget/title_bar.dart';

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
  Widget buildWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: TitleBar(title: S.of(context).dataComponents),
      child: blocBuilder(
        builder: (context, state) {
          final components = state.components;
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (components == null) ...[
                  const Delimiter.height(100),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      S.of(context).noDataComponents,
                      style: const TextStyle(fontSize: 22),
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
}
