import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/app_consts.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/generation_screen/generation_screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/summary_screen/bloc/summary_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/summary_screen/widgets/summary_cell.dart';
import 'package:onix_flutter_bricks/presentation/screen/summary_screen/widgets/summary_styles_cell.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';
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
  Widget buildWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: TitleBar(
        title: S.of(context).summary,
      ),
      child: blocConsumer(
        stateListener: (state) => _buildMainContainer(context, state),
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
        padding: const EdgeInsets.only(
          bottom: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Delimiter.height(100),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
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
                      variable: S.of(context).generateScreens,
                      value: state.config.screens
                          .toList()
                          .sorted((a, b) => a.name.compareTo(b.name))
                          .map((e) =>
                              '{name: ${e.name.pascalCase}Screen, bloc: ${e.stateManager}, initial: ${e.initial}}')
                          .join(',\n')),
                  if (state.config.swaggerUrl.isNotEmpty)
                    SummaryCell(
                      variable: S.of(context).swaggerURL,
                      value: state.config.swaggerUrl,
                    ),
                  if (state.config.sources.isNotEmpty)
                    SummaryCell(
                      variable: S.of(context).sources,
                      value: state.config.sources
                          .toList()
                          .sorted((a, b) => a.name.compareTo(b.name))
                          .map((e) =>
                              '${e.name.pascalCase}(${e.dataComponentsNames.sorted((a, b) => a.compareTo(b)).map((e) => e.pascalCase).join(', ')})')
                          .join('\n\n'),
                    ),
                  if (state.config.dataComponents.isNotEmpty)
                    SummaryCell(
                        variable: S.of(context).dataComponents,
                        value: state.config.dataComponents
                            .toList()
                            .sorted((a, b) => a.name.compareTo(b.name))
                            .map((e) => e.name.pascalCase)
                            .join(', ')),
                  if (state.config.styles.isNotEmpty)
                    SummaryStylesCell(
                      variable: 'Styles',
                      value: state.config.styles,
                    ),
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
