import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/data/model/local/source_wrapper/source_wrapper.dart';
import 'package:onix_flutter_bricks/domain/entity/entity.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/entity_widgets/add_entity_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/entity_widgets/swagger_file_parse_widget.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/source_widgets/add_source_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/entity_widgets/entity_table_expansion_tile.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/source_widgets/source_table_expansion_title.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_checkbox.dart';
import 'package:onix_flutter_bricks/presentation/widgets/text_field_with_label.dart';

class BuildEntity extends StatelessWidget {
  BuildEntity({
    required this.state,
    required this.projectNameController,
    required this.onGenerate,
    Key? key,
  }) : super(key: key);

  final AppState state;
  final TextEditingController projectNameController;
  final urlController = TextEditingController();
  final VoidCallback onGenerate;

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
                                    ProjectChange(
                                      projectPath: value,
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
                        showCupertinoModalPopup<Entity>(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => const AddEntityDialog(),
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
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(CupertinoIcons.add),
                          SizedBox(width: 10),
                          Text('Add standalone entity'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    CupertinoButton(
                      onPressed: () {
                        showCupertinoModalPopup<SourceWrapper>(
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
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                if ((state.entities
                            .where((element) => !element.exists)
                            .isNotEmpty ||
                        _needToGenerateSource(state)) &&
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
              SwaggerFileParseWidget(
                onParse: () => context.read<AppBloc>().add(
                      SwaggerParse(url: urlController.text),
                    ),
                urlController: urlController,
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool _needToGenerateSource(AppState state) {
    var needToGenerateSources =
        state.sources.where((source) => !source.exists).isNotEmpty;

    if (!needToGenerateSources) {
      for (var source in state.sources) {
        if (source.entities.where((entity) => !entity.exists).isNotEmpty) {
          needToGenerateSources = true;
          break;
        }
      }
    }

    return needToGenerateSources;
  }
}
