import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/router/app_router.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/swagger_parser_screen/bloc/swagger_parser_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/navigation_button_bar.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/text_field_with_label.dart';
import 'package:onix_flutter_bricks/presentation/widget/title_bar.dart';

class SwaggerParserScreen extends StatefulWidget {
  final Config config;

  const SwaggerParserScreen({
    required this.config,
    super.key,
  });

  @override
  State<SwaggerParserScreen> createState() => _SwaggerParserScreenState();
}

class _SwaggerParserScreenState extends BaseState<SwaggerParserScreenState,
    SwaggerParserScreenBloc, SwaggerParserScreenSR, SwaggerParserScreen> {
  final TextEditingController _urlController = TextEditingController();

  @override
  SwaggerParserScreenBloc createBloc() =>
      GetIt.I.get<SwaggerParserScreenBloc>();

  @override
  void onBlocCreated(BuildContext context, SwaggerParserScreenBloc bloc) {
    bloc.add(SwaggerParserScreenEventInit(config: widget.config));
    _urlController.text = widget.config.swaggerUrl;
    super.onBlocCreated(context, bloc);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return srObserver(
      context: context,
      child: CupertinoPageScaffold(
        navigationBar: TitleBar(
          title: S.of(context).importApi,
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

  void _onSingleResult(
    BuildContext context,
    SwaggerParserScreenSR singleResult,
  ) {
    singleResult.when(
      onParseError: () => Dialogs.showOkDialog(
        context: context,
        isError: true,
        title: S.of(context).error,
        content: Text(
          S.of(context).parseErrorMessage,
          style: context.appTextStyles.fs18?.copyWith(
            fontSize: 16,
          ),
        ),
      ),
      onContinue: () {
        _urlController.clear();
        _onContinue(context, blocOf(context).state);
      },
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    SwaggerParserScreenState state,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              S.of(context).swaggerParserPrompt,
              textAlign: TextAlign.center,
              style: context.appTextStyles.fs18,
            ),
            const Delimiter.height(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFieldWithLabel(
                label: '${S.of(context).url}: ',
                textController: _urlController,
                onChanged: () {},
                autofocus: true,
                onEditingComplete: () => _onContinue(context, state),
                expanded: true,
              ),
            ),
            const Spacer(),
            NavigationButtonBar(
              nextText: S.of(context).continueLabel,
              prevText: S.of(context).goBack,
              onNextPressed: () {
                _onContinue(context, state);
              },
              onPrevPressed: () {
                _onBack(context, state);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onContinue(BuildContext context, SwaggerParserScreenState state) {
    if (_urlController.text.isNotEmpty) {
      blocOf(context)
          .add(SwaggerParserScreenEventParse(url: _urlController.text));
    } else {
      state.config.projectExists
          ? context.pop(
              widget.config.copyWith(
                swaggerUrl: state.config.swaggerUrl,
              ),
            )
          : context.go(
              AppRouter.dataComponentsScreen,
              extra: widget.config.copyWith(
                swaggerUrl: state.config.swaggerUrl,
              ),
            );
    }
  }

  void _onBack(BuildContext context, SwaggerParserScreenState state) =>
      state.config.projectExists
          ? context.pop(
              widget.config.copyWith(
                swaggerUrl: state.config.swaggerUrl,
              ),
            )
          : context.go(
              AppRouter.stylesScreen,
              extra: widget.config.copyWith(
                swaggerUrl: state.config.swaggerUrl,
              ),
            );
}
