import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/app_consts.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/router/app_router.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/bloc/project_name_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/widget/branch_selector_widget.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/navigation_button_bar.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/text_field_with_label.dart';
import 'package:onix_flutter_bricks/presentation/widget/title_bar.dart';
import 'package:onix_flutter_bricks/presentation/widget/tooltip_wrapper.dart';

class ProjectNameScreen extends StatefulWidget {
  const ProjectNameScreen({
    super.key,
  });

  @override
  State<ProjectNameScreen> createState() => _ProjectNameScreenState();
}

class _ProjectNameScreenState extends BaseState<ProjectNameScreenState,
    ProjectNameScreenBloc, ProjectNameScreenSR, ProjectNameScreen> {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController organizationController = TextEditingController();
  final FocusNode projectNameFocusNode = FocusNode();
  final FocusNode organizationFocusNode = FocusNode();
  final FocusNode nextFocusNode = FocusNode();

  @override
  ProjectNameScreenBloc createBloc() => GetIt.I.get<ProjectNameScreenBloc>();

  @override
  void onBlocCreated(BuildContext context, ProjectNameScreenBloc bloc) {
    bloc.add(const ProjectNameScreenEvent.init());
    super.onBlocCreated(context, bloc);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return srObserver(
      context: context,
      child: CupertinoPageScaffold(
        navigationBar: TitleBar(title: S.of(context).enterProjectName),
        child: SizedBox.expand(
          child: blocBuilder(builder: _buildMainContainer),
        ),
      ),
      onSR: _onSR,
    );
  }

  void _onSR(
    BuildContext context,
    ProjectNameScreenSR sr,
  ) {
    sr.when(
      init: () {
        projectNameController.text = blocOf(context).state.config.projectName;
        organizationController.text = blocOf(context).state.config.organization;
      },
      onNext: () {
        context.go(
          AppRouter.platformsScreen,
        );
      },
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    ProjectNameScreenState state,
  ) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFieldWithLabel(
                    label: S.of(context).projectName,
                    focusNode: projectNameFocusNode,
                    autofocus: true,
                    textController: projectNameController,
                    error: !state.isValidProjectName,
                    onChanged: () => blocOf(context).add(
                      ProjectNameScreenEvent.projectNameChanged(
                        projectName: projectNameController.text,
                      ),
                    ),
                    onEditingComplete: () => _nextFocus(state.config),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        AppConsts.projectNameInputRegExp,
                      ),
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                  const SizedBox(width: 12),
                  TooltipWrapper(
                    message: S.of(context).projectNameHelperText,
                  ),
                ],
              ),
              const Delimiter.height(20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFieldWithLabel(
                    focusNode: organizationFocusNode,
                    label: S.of(context).organization,
                    textController: organizationController,
                    error: !state.isValidOrganizationName,
                    onChanged: () => blocOf(context).add(
                      ProjectNameScreenEvent.organizationChanged(
                        organization: organizationController.text,
                      ),
                    ),
                    onEditingComplete: () => _nextFocus(state.config),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        AppConsts.organizationInputRegExp,
                      ),
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                  const SizedBox(width: 12),
                  TooltipWrapper(
                    message: S.of(context).organizationNameHelperText,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: (state.branches.isNotEmpty && kDebugMode)
              ? BranchSelectorWidget(
                  branches: state.branches,
                  selectedBranch: state.config.branchConfig.branch,
                  onSelected: (newBranch) {
                    blocOf(context).add(
                      ProjectNameScreenEvent.branchChanged(
                        newBranch: newBranch,
                      ),
                    );
                  },
                )
              : const SizedBox.shrink(),
        ),
        Positioned(
          bottom: 0,
          right: 1,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16, right: 16),
            child: NavigationButtonBar(
              focusNode: nextFocusNode,
              isActive: state.config.projectName.isNotEmpty &&
                  state.config.organization.isNotEmpty &&
                  state.isValid,
              nextText: S.of(context).continueLabel,
              prevText: S.of(context).goBack,
              onNextPressed: () {
                _onCheckNames(context, state.config);
              },
              onPrevPressed: () {
                context.go(
                  AppRouter.procedureSelectionScreen,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void _nextFocus(Config config) {
    if (config.projectName.isNotEmpty && config.organization.isNotEmpty) {
      nextFocusNode.requestFocus();
    } else if (config.projectName.isEmpty) {
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
              text: config.projectName,
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
              text: config.organization,
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
        blocOf(context).add(
          const ProjectNameScreenEvent.onNext(),
        );
      },
    );
  }
}
