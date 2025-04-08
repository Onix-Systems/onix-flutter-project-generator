import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/router/app_router.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/swagger_parser_failure.dart';
import 'package:onix_flutter_bricks/presentation/screen/swagger_parser_screen/bloc/swagger_parser_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/navigation_button_bar.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/text_field_with_label.dart';
import 'package:onix_flutter_bricks/presentation/widget/title_bar.dart';
import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';

class SwaggerParserScreen extends StatefulWidget {
  final bool modal;

  const SwaggerParserScreen({
    this.modal = false,
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
    bloc.add(const SwaggerParserScreenEvent.init());
    super.onBlocCreated(context, bloc);
  }

  @override
  void onFailure(BuildContext context, Failure failure) {
    super.onFailure(context, failure);

    if (failure is SwaggerParserFailureDuplicatesFound) {
      Dialogs.showYesNoCancelDialog(
        context: context,
        title: S.of(context).error,
        content: Text(
          '${failure.getTranslatedMessage(context)}\n${S.of(context).overwrite}?',
          style: context.appTextStyles.fs18,
        ),
        onYes: () {
          blocOf(context).add(
            SwaggerParserScreenEvent.parse(
              url: _urlController.text,
              overwrite: true,
            ),
          );
        },
        onNo: () {
          blocOf(context).add(
            SwaggerParserScreenEvent.parse(
              url: _urlController.text,
              overwrite: false,
            ),
          );
        },
        onCancel: () {
          blocOf(context).add(
            const SwaggerParserScreenEventOnCancel(),
          );
        },
      );
    } else {
      Dialogs.showOkDialog(
        context: context,
        isError: true,
        title: S.of(context).error,
        content: Text(
          S.of(context).parseErrorMessage,
          style: context.appTextStyles.fs18?.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: widget.modal
          ? null
          : TitleBar(
              title: S.of(context).importApi,
            ),
      child: widget.modal
          ? blocBuilder(
              builder: _buildMainContainer,
            )
          : SizedBox.expand(
              child: blocBuilder(
                builder: _buildMainContainer,
              ),
            ),
    );
  }

  @override
  void onSR(BuildContext context, SwaggerParserScreenSR sr) {
    super.onSR(context, sr);
    sr.when(
      init: () {
        _urlController.text = blocOf(context).state.config.swaggerUrl;
      },
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
          mainAxisSize: widget.modal ? MainAxisSize.min : MainAxisSize.max,
          children: [
            if (!widget.modal) const Spacer() else const Gap(20),
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
                onEditingComplete: () => _processSwaggerParser(context),
                expanded: true,
              ),
            ),
            const Spacer(),
            NavigationButtonBar(
              showIcons: !widget.modal,
              nextText:
                  widget.modal ? S.of(context).ok : S.of(context).continueLabel,
              prevText:
                  widget.modal ? S.of(context).cancel : S.of(context).goBack,
              onNextPressed: () => _processSwaggerParser(context),
              onPrevPressed: () => _onBack(context, state),
            ),
          ],
        ),
      ),
    );
  }

  void _processSwaggerParser(BuildContext context) {
    blocOf(context).add(
      SwaggerParserScreenEvent.parse(
        url: _urlController.text,
      ),
    );
  }

  void _onContinue(BuildContext context, SwaggerParserScreenState state) {
    widget.modal
        ? context.pop()
        : context.go(
            AppRouter.dataComponentsScreen,
          );
  }

  void _onBack(BuildContext context, SwaggerParserScreenState state) {
    widget.modal
        ? context.pop()
        : context.go(
            AppRouter.stylesScreen,
          );
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }
}
