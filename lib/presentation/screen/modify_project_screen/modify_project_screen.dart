import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/data_components_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/modify_project_screen/bloc/modify_project_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/screens_screen.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

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
    super.onBlocCreated(context, bloc);
  }

  void _onSingleResult(
      BuildContext context, ModifyProjectScreenSR singleResult) {
    singleResult.when(
      loadFinished: () {},
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
                    config: state.config,
                    onChange: (screens) {
                      blocOf(context).add(
                        ModifyProjectScreenEventOnScreensChange(
                          screens: screens,
                        ),
                      );
                    },
                  )
                : DataComponentsScreen(
                    config: state.config,
                  ),
          ),
        ],
      ),
    );
  }
}
