import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/data/model/local/colored_line.dart';
import 'package:onix_flutter_bricks/data/model/local/entity_entity.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/add_entity_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/entity_table.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_checkbox.dart';
import 'package:onix_flutter_bricks/presentation/widgets/text_field_with_label.dart';

class BuildEntity extends StatelessWidget {
  const BuildEntity({
    required this.state,
    required this.projectNameController,
    required this.onGenerate,
    required this.outputStream,
    required this.outputText,
    Key? key,
  }) : super(key: key);

  final AppState state;
  final TextEditingController projectNameController;
  final VoidCallback onGenerate;

  final Stream<ColoredLine> outputStream;
  final List<ColoredLine> outputText;

  @override
  Widget build(BuildContext context) {
    if (state.entityError.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showCupertinoModalPopup(
          context: context,
          barrierDismissible: false,
          builder: (context) => CupertinoAlertDialog(
            title: Text(
              state.entityError,
              style: TextStyle(color: CupertinoColors.destructiveRed),
            ),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ).then((value) {
          context.read<AppBloc>().add(const ErrorClear());
        });
      });
    }
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFieldWithLabel(
                      label: 'Project name:',
                      textController: projectNameController,
                      value: state.projectName,
                      centered: true,
                      error: !state.projectExists,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9_]')),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 30,
                      width: 50,
                      child: CupertinoButton(
                        color: CupertinoColors.activeOrange,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          getDirectoryPath().then((value) {
                            if (value != null) {
                              context.read<AppBloc>().add(
                                    EntityProjectChange(
                                      entityProjectPath: value,
                                    ),
                                  );
                            }
                          });
                        },
                        child: const Text('...'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20)
              ],
              if ((state.projectExists && state.projectIsClean) ||
                  state.generateEntitiesWithProject) ...[
                CupertinoButton(
                  onPressed: () {
                    showCupertinoModalPopup<EntityEntity>(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AddEntityDialog(),
                    ).then((entity) {
                      if (entity != null) {
                        context.read<AppBloc>().add(
                              EntityAdd(entity: entity),
                            );
                      }
                    });
                  },
                  color: CupertinoColors.activeOrange,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(CupertinoIcons.add),
                      SizedBox(width: 10),
                      Text('Add entity'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: state.entities.isNotEmpty
                      ? SingleChildScrollView(
                          child: EntityTable(
                            entities: state.entities,
                          ),
                        )
                      : const SizedBox(),
                ),
                if (state.entities.isNotEmpty &&
                    (!state.generateEntitiesWithProject || state.projectExists))
                  CupertinoButton(
                    color: CupertinoColors.activeOrange,
                    onPressed: () {
                      onGenerate();
                    },
                    child: const Text('Generate entities'),
                  ),
              ] else ...[
                if (state.projectExists)
                  const Text(
                      'Project is not build with Onix Flutter Clean Architecture',
                      style: TextStyle(color: CupertinoColors.destructiveRed))
                else
                  const Text('Project does not exist',
                      style: TextStyle(color: CupertinoColors.destructiveRed)),
                const Spacer(),
              ],
              if (!state.projectExists)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabeledCheckbox(
                        label: 'Generate with project?',
                        initialValue: state.generateEntitiesWithProject,
                        onAction: () {
                          context.read<AppBloc>().add(
                              OnGenerateRepositoriesWithProject(
                                  generateRepositoriesWithProject:
                                      !state.generateEntitiesWithProject));
                        }),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
