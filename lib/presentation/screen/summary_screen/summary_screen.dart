import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/summary_screen/bloc/summary_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/summary_screen/widgets/summary_cell.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';
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

  void _onSingleResult(BuildContext context, SummaryScreenSR singleResult) {
    singleResult.when(
      loadFinished: () {},
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    SummaryScreenState state,
  ) {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.inactiveText,
                    width: 2,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SummaryCell(
                      variable: S.of(context).projectPath,
                      value: widget.config.projectPath,
                    ),
                    SummaryCell(
                      variable: S.of(context).projectName,
                      value: widget.config.projectName,
                    ),
                    SummaryCell(
                      variable: S.of(context).organization,
                      value: widget.config.organization,
                    ),
                    SummaryCell(
                      variable: S.of(context).platforms,
                      value: widget.config.platformsList.toString(),
                    ),
                    SummaryCell(
                      variable: S.of(context).flavorize,
                      value: widget.config.flavorize.toString(),
                    ),
                    if (widget.config.flavors.isNotEmpty)
                      SummaryCell(
                        variable: S.of(context).flavors,
                        value:
                            'dev, prod, ${widget.config.flavors.split(' ').join(', ')}',
                      ),
                    SummaryCell(
                      variable: S.of(context).generateSigningKey,
                      value: widget.config.generateSigningKey.toString(),
                    ),
                    SummaryCell(
                      variable: S.of(context).generateSonarConfig,
                      value: widget.config.useSonar.toString(),
                    ),
                    SummaryCell(
                      variable: S.of(context).navigationRouter,
                      value: widget.config.router.name,
                    ),
                    SummaryCell(
                      variable: S.of(context).localizationMethod,
                      value: widget.config.localization.name,
                    ),
                    SummaryCell(
                      variable: S.of(context).theming,
                      value: widget.config.theming.name,
                    ),
                    SummaryCell(
                      variable: S.of(context).integrateDevicePreview,
                      value: widget.config.integrateDevicePreview.toString(),
                    ),
                    SummaryCell(
                        variable: S.of(context).generateScreens,
                        value: widget.config.screens
                            .map((e) =>
                                '{name: ${e.name.pascalCase}Screen, bloc: ${e.bloc}}')
                            .join(', ')),
                    if (widget.config.swaggerUrl.isNotEmpty)
                      SummaryCell(
                        variable: S.of(context).swaggerURL,
                        value: widget.config.swaggerUrl,
                      ),
                    if (widget.config.sources.isNotEmpty)
                      SummaryCell(
                        variable: S.of(context).sources,
                        value: widget.config.sources
                            .map((e) =>
                                '${e.name}(${e.dataComponents.map((e) => e.name.pascalCase).join(', ')})')
                            .join('\n\n'),
                      ),
                    if (widget.config.dataComponents.isNotEmpty)
                      SummaryCell(
                          variable: S.of(context).dataComponents,
                          value: widget.config.dataComponents
                              .map((e) => e.name)
                              .join(', ')),
                  ],
                ),
              ),
            ),
            const Delimiter.height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppFilledButton(
                    label: S.of(context).goBack,
                    icon: Icons.arrow_back_ios_outlined,
                    onPressed: () => context.go(AppRouter.dataComponentsScreen,
                        extra: widget.config)),
                const Delimiter.width(10),
                AppFilledButton(
                  label: S.of(context).generateProject,
                  icon: Icons.local_fire_department,
                  iconLeft: false,
                  onPressed: () => context.go(AppRouter.generationScreen,
                      extra: widget.config),
                  color: CupertinoColors.destructiveRed,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
