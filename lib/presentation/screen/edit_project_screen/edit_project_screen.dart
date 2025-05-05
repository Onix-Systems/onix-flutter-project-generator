import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/service/config_service/config_service.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/data_components_screen_v2.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/screens_screen.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/navigation_button_bar.dart';

class EditProjectScreen extends StatefulWidget {
  const EditProjectScreen({
    super.key,
  });

  @override
  State<EditProjectScreen> createState() => _EditProjectScreenState();
}

class _EditProjectScreenState extends State<EditProjectScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final ConfigService _configService = GetIt.I.get<ConfigService>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      animationDuration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ScreensScreen(),
                DataComponentsScreenV2(),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 16, right: 16, left: 16),
            child: Row(
              children: [
                AppFilledButton(
                  label: S.of(context).screens,
                  onPressed: () => _tabController.animateTo(0),
                ),
                const Gap(10),
                AppFilledButton(
                  label: S.of(context).dataComponents,
                  onPressed: () => _tabController.animateTo(1),
                ),
                const Spacer(),
                ValueListenableBuilder(
                  valueListenable: _configService.projectModified,
                  builder: (context, value, _) => NavigationButtonBar(
                    nextText: S.of(context).continueLabel,
                    prevText: S.of(context).goBack,
                    isActive: value,
                    onNextPressed: () {
                      context.go(
                        AppRouter.generationScreen,
                      );
                    },
                    onPrevPressed: () {
                      context.go(
                        AppRouter.procedureSelectionScreen,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
