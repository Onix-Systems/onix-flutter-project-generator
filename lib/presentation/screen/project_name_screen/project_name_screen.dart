import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/bloc/project_name_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widgets/dialogs/dialog.dart';
import 'package:onix_flutter_bricks/presentation/widgets/inputs/text_field_with_label.dart';

class ProjectNameScreen extends StatefulWidget {
  final Config config;

  const ProjectNameScreen({
    required this.config,
    super.key,
  });

  @override
  State<ProjectNameScreen> createState() => _ProjectNameScreenState();
}

class _ProjectNameScreenState extends BaseState<ProjectNameScreenState,
    ProjectNameScreenBloc, ProjectNameScreenSR, ProjectNameScreen> {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController organizationController = TextEditingController();

  @override
  void onBlocCreated(BuildContext context, ProjectNameScreenBloc bloc) {
    bloc.add(
      ProjectNameScreenEvent.init(
        projectPath: widget.config.projectPath,
      ),
    );
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

  void _onSingleResult(BuildContext context, ProjectNameScreenSR singleResult) {
    singleResult.when(
      checkNames: () => _onCheckNames(context),
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    ProjectNameScreenState state,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldWithLabel(
            label: S.of(context).projectName,
            centered: true,
            textController: projectNameController,
            error: state.projectExists,
            onChanged: () => blocOf(context).add(
              ProjectNameScreenEvent.projectNameChanged(
                projectName: projectNameController.text,
              ),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9 ]')),
            ],
          ),
          const Delimiter.height(20),
          TextFieldWithLabel(
            label: S.of(context).organization,
            centered: true,
            textController: organizationController,
            onChanged: () => blocOf(context).add(
              ProjectNameScreenEvent.organizationChanged(
                organization: organizationController.text,
              ),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9-.]')),
            ],
          ),
          const Delimiter.height(40),
          if (state.projectName.isNotEmpty &&
              state.organization.isNotEmpty &&
              !state.projectExists)
            AppFilledButton(
              label: S.of(context).continueLabel,
              onPressed: () =>
                  blocOf(context).addSr(const ProjectNameScreenSRCheckNames()),
            )
          else
            SizedBox(
              height: 52,
              child: state.projectExists
                  ? Text(
                      S.of(context).projectExistsError,
                      style: context.appTextStyles.fs18?.copyWith(
                        color: AppColors.red,
                      ),
                    )
                  : null,
            ),
        ],
      ),
    );
  }

  _onCheckNames(BuildContext context) {
    Dialogs.showOkCancelDialog(
      context: context,
      isError: true,
      title: S.of(context).checkNamesTitle,
      content: RichText(
        textAlign: TextAlign.center,
        softWrap: false,
        text: TextSpan(
          text: S.of(context).checkNamesContentFirstPart,
          style: context.appTextStyles.fs18?.copyWith(
            fontSize: 16,
          ),
          children: <TextSpan>[
            TextSpan(
              text: blocOf(context).state.projectName,
              style: context.appTextStyles.fs18?.copyWith(
                color: AppColors.orange,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: S.of(context).checkNamesContentSecondPart,
              style: context.appTextStyles.fs18?.copyWith(
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: blocOf(context).state.organization,
              style: context.appTextStyles.fs18?.copyWith(
                color: AppColors.orange,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: S.of(context).checkNamesContentLastPart,
              style: context.appTextStyles.fs18?.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      onOk: () {
        context.go(
          AppRouter.platformsScreen,
          extra: widget.config.copyWith(
            projectName: blocOf(context).state.projectName,
            organization: blocOf(context).state.organization,
          ),
        );
      },
    );
  }
}
