import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/screen_entity.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/screen_body/add_screen_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/screen_body/screen_table.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_checkbox.dart';
import 'package:onix_flutter_bricks/presentation/widgets/text_field_with_label.dart';

class BuildScreen extends StatelessWidget {
  const BuildScreen(
      {required this.state, required this.projectNameController, Key? key})
      : super(key: key);

  final AppState state;
  final TextEditingController projectNameController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
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
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_]')),
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
                              ScreenProjectChange(
                                screenProjectPath: value,
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
          const SizedBox(height: 20),
          if (state.projectExists && state.projectIsClean) ...[
            CupertinoButton(
              onPressed: () {
                showCupertinoModalPopup<ScreenEntity>(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AddScreenDialog(),
                ).then((screen) {
                  if (screen != null) {
                    context.read<AppBloc>().add(
                          ScreenAdd(screen: screen),
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
                  Text('Add screen'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: state.screens.isNotEmpty
                  ? SingleChildScrollView(
                      child: ScreenTable(
                        screens: state.screens,
                      ),
                    )
                  : const SizedBox(),
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
        ],
      ),
    );
  }
}
