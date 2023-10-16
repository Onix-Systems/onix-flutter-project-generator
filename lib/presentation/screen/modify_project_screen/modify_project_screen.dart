import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/data_components_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/modify_project_screen/bloc/modify_project_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/screens_screen.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widgets/dialogs/dialog.dart';

class ModifyProjectScreen extends StatefulWidget {
  final Config config;

  const ModifyProjectScreen({
    required this.config,
    super.key,
  });

  @override
  State<ModifyProjectScreen> createState() => _ModifyProjectScreenState();
}

class _ModifyProjectScreenState extends BaseState<
    ModifyProjectScreenState,
    ModifyProjectScreenBloc,
    ModifyProjectScreenSR,
    ModifyProjectScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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
  void onBlocCreated(BuildContext context, ModifyProjectScreenBloc bloc) {
    bloc.add(ModifyProjectScreenEvent.init(config: widget.config));

    // if (widget.goToDataComponents) {
    //   _tabController.animateTo(1);
    //   bloc.add(
    //     const ModifyProjectScreenEventChangeTab(index: 1),
    //   );
    // }
    super.onBlocCreated(context, bloc);
  }

  void _onSingleResult(
      BuildContext context, ModifyProjectScreenSR singleResult) {
    singleResult.when(
      loadFinished: (_) {},
      onRefresh: () {},
      onGenerate: () => context.go(AppRouter.generationScreen,
          extra: blocOf(context).state.config),
      onError: (error) => Dialogs.showOkDialog(
        context: context,
        isError: true,
        title: S.of(context).error,
        content: Text(error,
            style: context.appTextStyles.fs18?.copyWith(
              fontSize: 16,
            )),
      ),
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    ModifyProjectScreenState state,
  ) {
    return Center(
      child: Column(
        children: [
          Material(
            child: TabBar(
              padding: const EdgeInsets.only(top: 30),
              controller: _tabController,
              onTap: (index) {
                blocOf(context).add(
                  ModifyProjectScreenEventChangeTab(index: index),
                );
              },
              tabs: [
                Tab(
                    child: Text(
                  S.of(context).screens,
                  style: context.appTextStyles.fs18,
                )),
                Tab(
                    child: Text(
                  S.of(context).dataComponents,
                  style: context.appTextStyles.fs18,
                )),
              ],
            ),
          ),
          Expanded(
            child: state.currentTab == 0
                ? ScreensScreen(
                    config: widget.config,
                    onContinue: () {
                      _tabController.animateTo(1);
                      blocOf(context).add(
                        const ModifyProjectScreenEventChangeTab(
                          index: 1,
                        ),
                      );
                    },
                  )
                : DataComponentsScreen(
                    config: widget.config,
                    onSR: blocOf(context).singleResults,
                    onBack: () {
                      _tabController.animateTo(0);
                      blocOf(context).add(
                        const ModifyProjectScreenEventChangeTab(
                          index: 0,
                        ),
                      );
                    },
                    onGenerate: () => _onGenerate(context),
                  ),
          ),
        ],
      ),
    );
  }

  _onGenerate(BuildContext context) {
    blocOf(context).add(
      const ModifyProjectScreenEventOnGenerate(),
    );
  }
}
