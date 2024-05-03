import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/di/services.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/config/output_line.dart';
import 'package:onix_flutter_bricks/presentation/screen/generation_screen/bloc/generation_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/widget/colored_line.dart';

class GenerationScreen extends StatefulWidget {
  final Config config;

  const GenerationScreen({
    required this.config,
    super.key,
  });

  @override
  State<GenerationScreen> createState() => _GenerationScreenState();
}

class _GenerationScreenState extends BaseState<GenerationScreenState,
    GenerationScreenBloc, GenerationScreenSR, GenerationScreen> {
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
  void onBlocCreated(BuildContext context, GenerationScreenBloc bloc) {
    bloc.add(GenerationScreenEvent.init(config: widget.config));
    super.onBlocCreated(context, bloc);
  }

  void _onSingleResult(BuildContext context, GenerationScreenSR singleResult) {
    singleResult.when(
      loadFinished: () {},
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    GenerationScreenState state,
  ) {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20),
                child: Stack(children: [
                  SizedBox.expand(
                    child: StreamBuilder<OutputLine>(
                      stream: outputService.outputStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (outputService.outputLines.last.tag ==
                              '{#progress}') {
                            Future.delayed(const Duration(microseconds: 10),
                                () {
                              outputService.outputLines.removeLast();
                            });
                          }
                          var output = SingleChildScrollView(
                            reverse: true,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: outputService.outputLines
                                  .map(
                                    (e) => ColoredLine(line: e),
                                  )
                                  .toList(),
                            ),
                          );
                          return output;
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  if (blocOf(context).state.generatingState ==
                      GeneratingState.waiting)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Row(
                        children: [
                          CupertinoButton(
                            color: CupertinoColors.activeOrange,
                            child: Text(
                              S.of(context).openInAndroidStudio,
                              style:
                                  const TextStyle(color: CupertinoColors.white),
                            ),
                            onPressed: () {
                              blocOf(context).add(
                                  const GenerationScreenEventOpenProject());
                            },
                          ),
                          const SizedBox(width: 10),
                          CupertinoButton(
                            color: CupertinoColors.activeOrange,
                            padding: EdgeInsets.zero,
                            child: const Icon(
                              CupertinoIcons.clear,
                              color: CupertinoColors.white,
                            ),
                            onPressed: () {
                              state.config.projectExists
                                  ? context.go(AppRouter.modifyProjectScreen,
                                      extra: state.config.copyWith(
                                        projectExists: true,
                                      ))
                                  : context.go(
                                      AppRouter.procedureSelectionScreen,
                                      extra: state.config.copyWith(
                                        projectExists: true,
                                      ),
                                    );
                            },
                          ),
                        ],
                      ),
                    ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
