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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Delimiter.height(20),
            Expanded(
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
                      variable: 'Project path',
                      value: widget.config.projectPath,
                    ),
                    SummaryCell(
                      variable: 'Project name',
                      value: widget.config.projectName,
                    ),
                    SummaryCell(
                      variable: 'Organization',
                      value: widget.config.organization,
                    ),
                    SummaryCell(
                      variable: 'Platforms',
                      value: widget.config.platformsList.toString(),
                    ),
                    SummaryCell(
                      variable: 'Flavorize',
                      value: widget.config.flavorize.toString(),
                    ),
                    if (widget.config.flavors.isNotEmpty)
                      SummaryCell(
                        variable: 'Flavors',
                        value:
                            'dev, prod, ${widget.config.flavors.split(' ').join(', ')}',
                      ),
                    SummaryCell(
                      variable: 'Generate signing key',
                      value: widget.config.generateSigningKey.toString(),
                    ),
                    SummaryCell(
                      variable: 'Generate sonar config',
                      value: widget.config.useSonar.toString(),
                    ),
                    SummaryCell(
                      variable: 'Navigation router',
                      value: widget.config.router.name,
                    ),
                    SummaryCell(
                      variable: 'Localization method',
                      value: widget.config.localization.name,
                    ),
                    SummaryCell(
                      variable: 'Theming',
                      value: widget.config.theming.name,
                    ),
                    SummaryCell(
                      variable: 'Integrate device preview',
                      value: widget.config.integrateDevicePreview.toString(),
                    ),
                    SummaryCell(
                        variable: 'Generate screens',
                        value: widget.config.screens
                            .map((e) => '{name: ${e.name}, bloc: ${e.bloc}}')
                            .join(', ')),
                    SummaryCell(
                      variable: 'Swagger URL',
                      value: widget.config.swaggerUrl,
                    ),
                    SummaryCell(
                      variable: 'Sources',
                      value: widget.config.sources
                          .map((e) =>
                              '${e.name}(${e.dataComponents.map((e) => e.name).join(', ')})')
                          .join('\n\n'),
                    ),
                    SummaryCell(
                        variable: 'Data components',
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
                  label: 'Generate project',
                  icon: Icons.task_alt,
                  iconLeft: false,
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
