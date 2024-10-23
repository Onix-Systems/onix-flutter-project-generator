import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/router/app_router.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/widgets/left_part.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/widgets/right_part.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/navigation_button_bar.dart';
import 'package:onix_flutter_bricks/presentation/widget/title_bar.dart';

class ProjectSettingsScreen extends StatefulWidget {
  final Config config;

  const ProjectSettingsScreen({
    required this.config,
    super.key,
  });

  @override
  State<ProjectSettingsScreen> createState() => _ProjectSettingsScreenState();
}

class _ProjectSettingsScreenState extends BaseState<ProjectSettingsScreenState,
    ProjectSettingsScreenBloc, ProjectSettingsScreenSR, ProjectSettingsScreen> {
  final TextEditingController _flavorsController = TextEditingController();

  @override
  ProjectSettingsScreenBloc createBloc() =>
      GetIt.I.get<ProjectSettingsScreenBloc>();

  @override
  Widget buildWidget(BuildContext context) {
    return srObserver(
      context: context,
      child: CupertinoPageScaffold(
        navigationBar: TitleBar(
          title: S.of(context).selectProjectSetting,
        ),
        child: SizedBox.expand(
          child: blocBuilder(
            builder: _buildMainContainer,
          ),
        ),
      ),
      onSR: _onSingleResult,
    );
  }

  @override
  void onBlocCreated(BuildContext context, ProjectSettingsScreenBloc bloc) {
    bloc.add(ProjectSettingsScreenEvent.init(config: widget.config));
    _flavorsController.text = widget.config.flavors;
    super.onBlocCreated(context, bloc);
  }

  void _onSingleResult(
    BuildContext context,
    ProjectSettingsScreenSR singleResult,
  ) {
    singleResult.when(
      loadFinished: () {},
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    ProjectSettingsScreenState state,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Gap(140),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: LeftPart(
                    bloc: blocOf(context),
                    flavorsController: _flavorsController,
                    //height: _height,
                  ),
                ),
                const Delimiter.width(20),
                Expanded(
                  child: RightPart(
                    bloc: blocOf(context),
                    //height: _height,
                  ),
                ),
              ],
            ),
            const Spacer(),
            NavigationButtonBar(
              nextText: S.of(context).continueLabel,
              prevText: S.of(context).goBack,
              onNextPressed: () {
                _goNext(state);
              },
              onPrevPressed: () {
                _goBack(state);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _goBack(ProjectSettingsScreenState state) => context.go(
        AppRouter.platformsScreen,
        extra: state.config,
      );

  void _goNext(ProjectSettingsScreenState state) => context.go(
        AppRouter.screensScreen,
        extra: state.config,
      );
}
