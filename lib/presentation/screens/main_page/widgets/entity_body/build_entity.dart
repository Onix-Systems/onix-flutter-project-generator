import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/data/model/local/colored_line.dart';
import 'package:onix_flutter_bricks/data/model/local/entity_entity.dart';
import 'package:onix_flutter_bricks/data/model/local/source_entity.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/entity_widgets/add_entity_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/source_widgets/add_source_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/entity_widgets/entity_table_expansion_tile.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/source_widgets/source_table_expansion_title.dart';
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
              style: const TextStyle(color: CupertinoColors.destructiveRed),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                          Text('Add standalone entity'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    CupertinoButton(
                      onPressed: () {
                        showCupertinoModalPopup<SourceEntity>(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => AddSourceDialog(),
                        ).then((source) {
                          if (source != null) {
                            context.read<AppBloc>().add(
                                  SourceAdd(source: source),
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
                          Text('Add source'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        state.sources.isNotEmpty
                            ? SourceTableExpansionTile(
                                sources: state.sources.toList(),
                              )
                            : const SizedBox(),
                        const SizedBox(height: 20),
                        state.entities.isNotEmpty
                            ? EntityTableExpansionTile(
                                entities: state.entities.toList(),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
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
              if (!state.projectExists) ...[
                const SizedBox(height: 10),
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
            ],
          ),
        ),
      ],
    );
  }
}
