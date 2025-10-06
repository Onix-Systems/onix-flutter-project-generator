import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/generation_screen/bloc/generation_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/generation_screen/widget/generation_controls.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/output_console.dart';
import 'package:onix_flutter_bricks/util/stream_util.dart';

class GenerationScreen extends StatefulWidget {
  const GenerationScreen({
    super.key,
  });

  @override
  State<GenerationScreen> createState() => _GenerationScreenState();
}

class _GenerationScreenState extends State<GenerationScreen>
    with
        BaseBlocState<GenerationScreenState, GenerationScreenBloc,
            GenerationScreenSR, GenerationScreen> {
  @override
  GenerationScreenBloc createBloc() => GetIt.I.get<GenerationScreenBloc>();

  @override
  Widget buildWidget(BuildContext context) {
    return CupertinoPageScaffold(
      child: SizedBox.expand(
        child: blocBuilder(
          builder: (_, state) => _buildMainContainer(context, state),
        ),
      ),
    );
  }

  @override
  void onBlocReady(BuildContext context, GenerationScreenBloc bloc) {
    bloc.add(const GenerationScreenEvent.init());
    super.onBlocReady(context, bloc);
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: context.appColors.darkContrastColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: OutputConsole(
                        outputStream:
                            state.outputStream ?? StreamUtil.emptyStream(),
                      ),
                    ),
                    if (blocOf(context).state.generatingState ==
                        GeneratingState.waiting)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GenerationControls(
                          onOpenAndroidStudio: () {
                            blocOf(context)
                                .add(const GenerationScreenEventOpenProject());
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
