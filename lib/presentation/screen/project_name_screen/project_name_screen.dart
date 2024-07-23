import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/bloc/project_name_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/widget/branch_selector_widget.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/navigation_button_bar.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/text_field_with_label.dart';
import 'package:onix_flutter_bricks/presentation/widget/title_bar.dart';

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
  FocusNode projectNameFocusNode = FocusNode();
  FocusNode organizationFocusNode = FocusNode();
  FocusNode nextFocusNode = FocusNode();

  @override
  void onBlocCreated(BuildContext context, ProjectNameScreenBloc bloc) {
    bloc.add(
      ProjectNameScreenEvent.init(
        config: widget.config,
      ),
    );

    projectNameController.text = widget.config.projectName;
    organizationController.text = widget.config.organization;

    super.onBlocCreated(context, bloc);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: TitleBar(
        title: S.of(context).enterProjectName,
      ),
      child: SizedBox.expand(
        child: blocConsumer(
          stateListener: (state) => _buildMainContainer(context, state),
        ),
      ),
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    ProjectNameScreenState state,
  ) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              TextFieldWithLabel(
                label: S.of(context).projectName,
                focusNode: projectNameFocusNode,
                autofocus: true,
                centered: true,
                textController: projectNameController,
                error: state.projectExists,
                onChanged: () => blocOf(context).add(
                  ProjectNameScreenEvent.projectNameChanged(
                    projectName: projectNameController.text,
                  ),
                ),
                onEditingComplete: () => _nextFocus(state),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9_]')),
                ],
              ),
              const Delimiter.height(20),
              TextFieldWithLabel(
                focusNode: organizationFocusNode,
                label: S.of(context).organization,
                centered: true,
                textController: organizationController,
                onChanged: () => blocOf(context).add(
                  ProjectNameScreenEvent.organizationChanged(
                    organization: organizationController.text,
                  ),
                ),
                onEditingComplete: () => _nextFocus(state),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9-.]')),
                ],
              ),
              const Spacer(),
              NavigationButtonBar(
                focusNode: nextFocusNode,
                isActive: state.config.projectName.isNotEmpty &&
                    state.config.organization.isNotEmpty &&
                    !state.projectExists,
                nextText: S.of(context).continueLabel,
                prevText: S.of(context).goBack,
                onNextPressed: () {
                  _onCheckNames(context, state.config);
                },
                onPrevPressed: () {
                  context.go(
                    AppRouter.procedureSelectionScreen,
                    extra: widget.config.copyWith(
                      projectName: projectNameController.text,
                      organization: organizationController.text,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: (state.branches.isEmpty && kDebugMode)
              ? const SizedBox.shrink()
              : BranchSelectorWidget(
                  branches: state.branches,
                  selectedBranch: state.config.branch,
                  onSelected: (newBranch) {
                    blocOf(context).add(
                      ProjectNameScreenEvent.branchChanged(
                        newBranch: newBranch,
                      ),
                    );
                  },
                ),
        )
      ],
    );
  }

  void _nextFocus(ProjectNameScreenState state) {
    if (state.config.projectName.isNotEmpty &&
        state.config.organization.isNotEmpty) {
      nextFocusNode.requestFocus();
    } else if (state.config.projectName.isEmpty) {
      projectNameFocusNode.requestFocus();
    } else {
      organizationFocusNode.requestFocus();
    }
  }

  void _onCheckNames(
    BuildContext context,
    Config config,
  ) {
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
              text: blocOf(context).state.config.projectName,
              style: context.appTextStyles.fs18?.copyWith(
                color: context.appColors.textColor,
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
              text: blocOf(context).state.config.organization,
              style: context.appTextStyles.fs18?.copyWith(
                color: context.appColors.textColor,
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
          extra: config,
        );
      },
    );
  }
}
