import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/data/model/local/screen/screen_entity.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/screen_body/add_screen_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/screen_body/screen_table_cell.dart';
import 'package:recase/recase.dart';

class ScreenTable extends StatelessWidget {
  const ScreenTable({required this.screens, Key? key}) : super(key: key);

  final Set<ScreenEntity> screens;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: CupertinoColors.systemGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: CupertinoColors.systemGrey,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: const [
                Cell(
                  value: Text('Screen name', textAlign: TextAlign.center),
                  decorated: true,
                ),
                Cell(
                  value: Text('Using BLoC', textAlign: TextAlign.center),
                  decorated: true,
                ),
                Cell(
                  value: Text('Actions', textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
          ...screens.map(
            (screen) => Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: screen != screens.last
                      ? const BorderSide(
                          color: CupertinoColors.systemGrey,
                          width: 1,
                        )
                      : BorderSide.none,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Cell(
                    value: Text(
                      '${screen.name.pascalCase}Screen',
                      style: TextStyle(
                          color: screen.exists
                              ? CupertinoColors.inactiveGray
                              : CupertinoColors.white),
                    ),
                    decorated: true,
                  ),
                  Cell(
                    value: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MSHCheckbox(
                          value: screen.bloc,
                          onChanged: (_) {},
                          isDisabled: true,
                          duration: const Duration(milliseconds: 200),
                          colorConfig: screen.exists
                              ? MSHColorConfig.fromCheckedUncheckedDisabled(
                                  checkedColor: CupertinoColors.inactiveGray,
                                  uncheckedColor: CupertinoColors.inactiveGray,
                                  disabledColor: CupertinoColors.inactiveGray,
                                )
                              : MSHColorConfig.fromCheckedUncheckedDisabled(
                                  checkedColor: CupertinoColors.activeOrange,
                                  uncheckedColor: CupertinoColors.activeOrange,
                                  disabledColor: CupertinoColors.activeOrange,
                                ),
                        ),
                      ],
                    ),
                    decorated: true,
                  ),
                  Cell(
                    value: SizedBox(
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CupertinoButton(
                              color: screen.exists
                                  ? CupertinoColors.inactiveGray
                                  : CupertinoColors.activeOrange,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              onPressed: () {
                                if (!screen.exists) {
                                  showCupertinoModalPopup<ScreenEntity>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) =>
                                        AddScreenDialog(screen: screen),
                                  ).then((screen) {
                                    if (screen != null) {
                                      context.read<AppBloc>().add(
                                            const StateUpdate(),
                                          );
                                    }
                                  });
                                }
                              },
                              child: const Text('Modify'),
                            ),
                            const SizedBox(width: 10),
                            CupertinoButton(
                              color: screen.exists
                                  ? CupertinoColors.inactiveGray
                                  : CupertinoColors.activeOrange,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              onPressed: () {
                                if (!screen.exists) {
                                  context.read<AppBloc>().add(
                                        ScreenDelete(screen: screen),
                                      );
                                }
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
