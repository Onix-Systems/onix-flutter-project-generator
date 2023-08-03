import 'package:flutter/cupertino.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/add_screen_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/screen_table_cell.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';
import 'package:recase/recase.dart';

class ScreenTable extends StatelessWidget {
  final Set<Screen> screens;
  final Function(Screen) onModifyScreen;
  final Function(Screen) onDeleteScreen;

  const ScreenTable({
    required this.screens,
    required this.onModifyScreen,
    required this.onDeleteScreen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: CupertinoColors.systemGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
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
              children: [
                Cell(
                  value: Text(
                    S.of(context).screenName,
                    textAlign: TextAlign.center,
                    style: context.appTextStyles.fs18?.copyWith(
                      color: AppColors.orange,
                    ),
                  ),
                  decorated: true,
                ),
                Cell(
                  value: Text(
                    S.of(context).usingBloc,
                    textAlign: TextAlign.center,
                    style: context.appTextStyles.fs18?.copyWith(
                      color: AppColors.orange,
                    ),
                  ),
                  decorated: true,
                ),
                Cell(
                  value: Text(
                    S.of(context).actions,
                    textAlign: TextAlign.center,
                    style: context.appTextStyles.fs18?.copyWith(
                      color: AppColors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...screens.map(
                    (screen) => Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: CupertinoColors.systemGrey,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Cell(
                            value: Text(
                              '${screen.name.pascalCase}Screen',
                              style: context.appTextStyles.fs18?.copyWith(
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
                                      ? MSHColorConfig
                                          .fromCheckedUncheckedDisabled(
                                          checkedColor:
                                              CupertinoColors.inactiveGray,
                                          uncheckedColor:
                                              CupertinoColors.inactiveGray,
                                          disabledColor:
                                              CupertinoColors.inactiveGray,
                                        )
                                      : MSHColorConfig
                                          .fromCheckedUncheckedDisabled(
                                          checkedColor:
                                              CupertinoColors.activeOrange,
                                          uncheckedColor:
                                              CupertinoColors.activeOrange,
                                          disabledColor:
                                              CupertinoColors.activeOrange,
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CupertinoButton(
                                        color: screen.exists
                                            ? CupertinoColors.inactiveGray
                                            : CupertinoColors.activeOrange,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        onPressed: () {
                                          if (!screen.exists) {
                                            showCupertinoModalPopup<Screen>(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (context) =>
                                                  AddScreenDialog(
                                                      screen: screen),
                                            ).then((screen) {
                                              if (screen != null) {
                                                onModifyScreen(screen);
                                              }
                                            });
                                          }
                                        },
                                        child: Text(S.of(context).modify,
                                            style: context.appTextStyles.fs18
                                                ?.copyWith(
                                                    color: AppColors.bgDark))),
                                    const SizedBox(width: 10),
                                    CupertinoButton(
                                      color: screen.exists
                                          ? CupertinoColors.inactiveGray
                                          : CupertinoColors.activeOrange,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      onPressed: () {
                                        if (!screen.exists) {
                                          onDeleteScreen(screen);
                                        }
                                      },
                                      child: Text(S.of(context).delete,
                                          style: context.appTextStyles.fs18
                                              ?.copyWith(
                                                  color: AppColors.bgDark)),
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
            ),
          ),
        ],
      ),
    );
  }
}
