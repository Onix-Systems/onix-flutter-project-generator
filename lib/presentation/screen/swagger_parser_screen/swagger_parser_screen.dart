import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/swagger_parser_screen/bloc/swagger_parser_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widgets/dialogs/dialog.dart';
import 'package:onix_flutter_bricks/presentation/widgets/inputs/text_field_with_label.dart';

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
        child: SizedBox.expand(
          child: blocConsumer(
            stateListener: (state) => _buildMainContainer(context, state),
          ),
        ),
      ),
      onSR: _onSingleResult,
    );
  }

  void _onSingleResult(
      BuildContext context, SwaggerParserScreenSR singleResult) {
    singleResult.when(
      onError: (error) => Dialogs.showOkDialog(
        context: context,
        isError: true,
        title: S.of(context).error,
        content: error,
      ),
      onConflicting: () => Dialogs.showOkCancelDialog(
        context: context,
        isError: true,
        okLabel: 'Replace',
        cancelLabel: 'Ignore',
        title: S.of(context).error,
        content: Text(
          'Swagger file contains components conflicting with existing. Replace with parsed components or ignore conflicting parsed data?',
          style: context.appTextStyles.fs18,
        ),
        onOk: () =>
            blocOf(context).add(const SwaggerParserScreenEventOnReplace()),
        onCancel: () => _onContinue(context, blocOf(context).state),
      ),
      onContinue: () => _onContinue(context, blocOf(context).state),
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    SwaggerParserScreenState state,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).swaggerParserPrompt,
            textAlign: TextAlign.center,
            style: context.appTextStyles.fs18,
          ),
          const Delimiter.height(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFieldWithLabel(
              label: '${S.of(context).url}: ',
              textController: _urlController,
              onChanged: () => blocOf(context).add(
                  SwaggerParserScreenEventOnUrlChanged(
                      url: _urlController.text)),
              expanded: true,
            ),
          ),
          const Delimiter.height(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppFilledButton(
                  label: S.of(context).goBack,
                  icon: Icons.arrow_back_ios_rounded,
                  onPressed: () => _onBack(context, state)),
              const Delimiter.width(10),
              AppFilledButton(
                  label: S.of(context).continueLabel,
                  icon: Icons.arrow_forward_ios_rounded,
                  iconLeft: false,
                  onPressed: () {
                    if (state.config.swaggerUrl.isNotEmpty) {
                      blocOf(context).add(SwaggerParserScreenEventParse(
                          url: state.config.swaggerUrl));
                    } else {
                      _onContinue(context, state);
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }

  _onContinue(BuildContext context, SwaggerParserScreenState state) =>
      context.go(
        AppRouter.dataComponentsScreen,
        extra: widget.config.copyWith(
          dataComponents: state.config.dataComponents,
          sources: state.config.sources,
          swaggerUrl: state.config.swaggerUrl,
        ),
      );

  _onBack(BuildContext context, SwaggerParserScreenState state) => context.go(
        AppRouter.screensScreen,
        extra: widget.config.copyWith(
          dataComponents: state.config.dataComponents,
          sources: state.config.sources,
          swaggerUrl: state.config.swaggerUrl,
        ),
      );
}
