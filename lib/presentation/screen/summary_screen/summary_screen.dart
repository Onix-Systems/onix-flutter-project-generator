import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/app_consts.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/router/app_router.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/generation_screen/generation_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/summary_screen/bloc/summary_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/summary_screen/widgets/summary_cell.dart';
import 'package:onix_flutter_bricks/presentation/screen/summary_screen/widgets/summary_styles_cell.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/navigation_button_bar.dart';
import 'package:onix_flutter_bricks/presentation/widget/title_bar.dart';
import 'package:recase/recase.dart';

class SummaryScreen extends StatefulWidget {
  final Config config;

  const SummaryScreen({
    required this.config,
    super.key,
  });

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends BaseState<SummaryScreenState,
    SummaryScreenBloc, SummaryScreenSR, SummaryScreen> {
  @override
  SummaryScreenBloc createBloc() => GetIt.I.get<SummaryScreenBloc>();

  @override
  Widget buildWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: TitleBar(
        title: S.of(context).summary,
      ),
      child: blocBuilder(
        builder: _buildMainContainer,
      ),
    );
  }

  @override
  void onBlocCreated(BuildContext context, SummaryScreenBloc bloc) {
    bloc.add(SummaryScreenEventInit(config: widget.config));
    super.onBlocCreated(context, bloc);
  }

  Widget _buildMainContainer(
    BuildContext context,
    SummaryScreenState state,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  const Delimiter.height(100),
                  SummaryCell(
                    variable: S.of(context).projectPath,
                    value: state.config.projectPath,
                  ),
                  SummaryCell(
                    variable: S.of(context).projectName,
                    value: state.config.projectName,
                  ),
                  SummaryCell(
                    variable: S.of(context).organization,
                    value: state.config.organization,
                  ),
                  SummaryCell(
                    variable: S.of(context).masonBrickSource,
                    value: state.config.branch,
                  ),
                  SummaryCell(
                    variable: S.of(context).platforms,
                    value: state.config.platformsList.toString(),
                  ),
                  SummaryCell(
                    variable: S.of(context).flavorize,
                    value: state.config.flavorize.toString(),
                  ),
                  if (state.config.flavorize)
                    SummaryCell(
                      variable: S.of(context).flavors,
                      value: _getFlavors(state.config.flavors),
                    ),
                  SummaryCell(
                    variable: S.of(context).generateSigningKey,
                    value: state.config.generateSigningKey.toString(),
                  ),
                  SummaryCell(
                    variable: S.of(context).generateSonarConfig,
                    value: state.config.useSonar.toString(),
                  ),
                  SummaryCell(
                    variable: S.of(context).firebaseAuth,
                    value: state.config.firebaseAuth.toString(),
                  ),
                  SummaryCell(
                    variable: S.of(context).integrateGraphQl,
                    value: state.config.graphql.toString(),
                  ),
                  SummaryCell(
                    variable: S.of(context).navigationRouter,
                    value: state.config.router.name,
                  ),
                  SummaryCell(
                    variable: S.of(context).localizationMethod,
                    value: state.config.localization.name,
                  ),
                  SummaryCell(
                    variable: S.of(context).theming,
                    value: state.config.theming.name,
                  ),
                  SummaryCell(
                    variable: S.of(context).stateManager,
                    value: state.config.stateManager.name.titleCase,
                  ),
                  if (state.config.screens.isNotEmpty)
                    SummaryCell(
                      variable: S.of(context).generateScreens,
                      value: state.config.screens
                          .toList()
                          .sorted((a, b) => a.name.compareTo(b.name))
                          .map(
                            (e) => 'name: ${e.name.pascalCase}Screen, type:'
                                ' ${e.stateVariant.name},'
                                ' initial: ${e.initial}',
                          )
                          .join(',\n'),
                    ),
                  if (state.config.swaggerUrl.isNotEmpty)
                    SummaryCell(
                      variable: S.of(context).swaggerURL,
                      value: state.config.swaggerUrl,
                    ),
                  if (!state.config.platformsList.webOnly)
                    SummaryCell(
                      variable: S.of(context).useScreenUtil,
                      value: state.config.screenUtil.toString(),
                    ),
                  SummaryCell(
                    variable: S.of(context).integrateSentry,
                    value: state.config.sentry.toString(),
                  ),
                  if (state.config.styles.isNotEmpty)
                    SummaryStylesCell(
                      variable: 'Styles',
                      value: state.config.styles,
                    ),
                  const Delimiter.height(10),
                ],
              ),
            ),
            const Delimiter.height(20),
            NavigationButtonBar(
              prevText: S.of(context).goBack,
              nextText: S.of(context).generateProject,
              nextIcon: Icons.local_fire_department,
              onNextPressed: () {
                context.go(
                  AppRouter.generationScreen,
                  extra: GenerationScreenExtra(
                    config: state.config,
                  ),
                );
              },
              onPrevPressed: () {
                context.go(
                  AppRouter.dataComponentsScreen,
                  extra: state.config,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getFlavors(String flavors) {
    var allFlavors = AppConsts.defaultFlavors.join(', ');

    if (flavors.isNotEmpty) {
      allFlavors += ', ${flavors.split(' ').join(', ')}';
    }

    return allFlavors;
  }
}
