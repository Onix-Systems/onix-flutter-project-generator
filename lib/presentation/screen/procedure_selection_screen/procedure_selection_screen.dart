import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/app_consts.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/router/app_router.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/signing_failure.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/bloc/procedure_selection_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/widget/fingerprint_dialog_body.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/widget/tools_popup_button.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/widgets/signing_dialog.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';
import 'package:onix_flutter_bricks/presentation/widget/title_bar.dart';
import 'package:onix_flutter_bricks/util/enum/tool_type.dart';
import 'package:onix_flutter_bricks/util/extension/directory_extension.dart';
import 'package:onix_flutter_bricks/util/extension/failure_dialog_extension.dart';
import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';

class ProcedureSelectionScreen extends StatefulWidget {
  final Config config;

  const ProcedureSelectionScreen({
    required this.config,
    super.key,
  });

  @override
  State<ProcedureSelectionScreen> createState() =>
      _ProcedureSelectionScreenState();
}

class _ProcedureSelectionScreenState extends BaseState<
    ProcedureSelectionScreenState,
    ProcedureSelectionScreenBloc,
    ProcedureSelectionScreenSR,
    ProcedureSelectionScreen> {
  @override
  ProcedureSelectionScreenBloc createBloc() =>
      GetIt.I.get<ProcedureSelectionScreenBloc>();

  @override
  void onBlocCreated(BuildContext context, ProcedureSelectionScreenBloc bloc) {
    bloc.add(ProcedureSelectionScreenEventInit(config: widget.config));
    super.onBlocCreated(context, bloc);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return blocBuilder(
      builder: (context, state) {
        return CupertinoPageScaffold(
          navigationBar: TitleBar(
            title: S.of(context).selectProjectFolder,
            actions: [
              Material(
                color: Colors.transparent,
                child: SizedBox(
                  width: 100,
                  child: CupertinoSegmentedControl<String>(
                    padding: EdgeInsets.zero,
                    groupValue: state.language,
                    selectedColor: context.appColors.controlColor,
                    unselectedColor: context.appColors.darkColor,
                    borderColor: context.appColors.controlColor,
                    children: _mapValues(context),
                    onValueChanged: (value) {
                      blocOf(context).add(
                        ProcedureSelectionScreenEventOnLocaleChange(
                          language: value,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Delimiter.width(20),
              ToolsPopupButton(
                onSelected: (value) {
                  switch (value) {
                    case ToolType.generateAndroidSigning:
                      _onGenerateSigningSelected(context);
                  }
                },
              ),
            ],
          ),
          child: SizedBox.expand(child: _buildMainContainer(context, state)),
        );
      },
    );
  }

  @override
  void onFailure(BuildContext context, Failure failure) {
    if (failure is SigningFailure) {
      context.onSigningFailure(failure);
    }
  }

  Widget _buildMainContainer(
    BuildContext context,
    ProcedureSelectionScreenState state,
  ) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SizedBox(
              height: 125,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AppFilledButton(
                  label: S.of(context).generateNewProject,
                  big: true,
                  onPressed: () {
                    getDirectoryPath().then(
                      (value) {
                        if (!context.mounted) return;
                        if (value != null) {
                          blocOf(context).add(
                            ProcedureSelectionScreenEventOnNewProject(
                              projectPath: value,
                            ),
                          );
                        } else {
                          Dialogs.showOkDialog(
                            context: context,
                            isError: true,
                            title: S.of(context).pathNotSelectedTitle,
                            content: Text(
                              S.of(context).pathNotSelectedContent,
                              style: context.appTextStyles.fs18?.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            onOk: () {},
                          );
                        }
                      },
                    );
                  },
                  icon: Icons.create_new_folder_outlined,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Text(
            (state.config.localVersion.isNotEmpty &&
                    state.config.remoteVersion.isNotEmpty)
                ? 'v${state.config.localVersion} '
                    '(Remote: v${state.config.remoteVersion})'
                : '',
            style: context.appTextStyles.fs18?.copyWith(
              decoration: TextDecoration.none,
              color: context.appColors.fadedColor,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onSR(
    BuildContext context,
    ProcedureSelectionScreenSR singleResult,
  ) {
    singleResult.whenOrNull(
      emptyConfig: () => Dialogs.showOkDialog(
        context: context,
        isError: true,
        title: S.of(context).emptyConfigTitle,
        content: Text(
          S.of(context).emptyConfigContent,
          style: context.appTextStyles.fs18?.copyWith(
            fontSize: 16,
          ),
        ),
      ),
      onNewProject: () => context.go(
        AppRouter.projectNameScreen,
        extra: blocOf(context)
            .state
            .config
            .copyWith(projectPath: blocOf(context).state.config.projectPath),
      ),
      onAndroidSigningCreated: (fingerprints) {
        showCupertinoDialog(
          context: context,
          builder: (ctx) => FingerprintDialogBody(
            fingerprints: fingerprints,
          ),
        );
      },
    );
  }

  Map<String, Widget> _mapValues(BuildContext context) {
    final result = <String, Widget>{};
    for (final value
        in S.delegate.supportedLocales.map((e) => e.languageCode)) {
      result.addAll(
        {
          value: Text(
            value.toUpperCase(),
            style: context.appTextStyles.fs18?.copyWith(
              color: blocOf(context).state.language == value
                  ? context.appColors.darkColor
                  : context.appColors.fadedColor,
            ),
          ),
        },
      );
    }
    return result;
  }

  Future<void> _onGenerateSigningSelected(BuildContext context) async {
    final directoryPath = await getDirectoryPath();
    if (!context.mounted) {
      return;
    }
    if (directoryPath == null) {
      Dialogs.showOkDialog(
        context: context,
        isError: true,
        title: S.of(context).pathNotSelectedTitle,
        content: Text(
          S.of(context).pathNotSelectedContent,
          style: context.appTextStyles.fs18?.copyWith(
            fontSize: 16,
          ),
        ),
      );
      return;
    }
    final directory = Directory(directoryPath);
    final isFlutterProject = directory.isFlutterProjectDirectory();
    if (!isFlutterProject) {
      Dialogs.showOkDialog(
        context: context,
        isError: true,
        title: S.of(context).projectSelectErrorTitle,
        content: Text(
          S.of(context).projectSelectErrorMessage,
          style: context.appTextStyles.fs18?.copyWith(
            fontSize: 16,
          ),
        ),
      );
      return;
    }
    final signingVars = await showCupertinoModalPopup<List<String>>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => const SigningDialog(
        signingVars: AppConsts.defaultSigningVars,
      ),
    );
    if (!context.mounted) {
      return;
    }
    if (signingVars != null) {
      blocOf(context).add(
        ProcedureSelectionScreenEvent.onGenerateAndroidSigning(
          directory: directory,
          signingVars: signingVars,
        ),
      );
    }
  }
}
