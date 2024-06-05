import 'package:flutter/cupertino.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/add_screen_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/screen_table_cell.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:recase/recase.dart';

class ScreenTable extends StatelessWidget {
  final Set<Screen> screens;
  final Function(Screen, String) onModifyScreen;
  final Function(Screen) onDeleteScreen;
  final Function(Screen) onChangeInitial;

  const ScreenTable({
    required this.screens,
    required this.onModifyScreen,
    required this.onDeleteScreen,
    required this.onChangeInitial,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: context.appColors.fadedColor,
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
                  S.of(context).initial,
                  textAlign: TextAlign.center,
                  style: context.appTextStyles.fs18?.copyWith(
                    color: context.appColors.textColor,
                  ),
                ),
                decorated: true,
              ),
              Cell(
                value: Text(
                  S.of(context).screenName,
                  textAlign: TextAlign.center,
                  style: context.appTextStyles.fs18?.copyWith(
                    color: context.appColors.textColor,
                  ),
                ),
                decorated: true,
              ),
              Cell(
                value: Text(
                  S.of(context).stateManager,
                  textAlign: TextAlign.center,
                  style: context.appTextStyles.fs18?.copyWith(
                    color: context.appColors.textColor,
                  ),
                ),
                decorated: true,
              ),
              Cell(
                value: Text(
                  S.of(context).actions,
                  textAlign: TextAlign.center,
                  style: context.appTextStyles.fs18?.copyWith(
                    color: context.appColors.textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            ...screens.map(
              (screen) => Container(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: context.appColors.fadedColor,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Cell(
                      value: MSHCheckbox(
                        value: screen.initial,
                        duration: const Duration(milliseconds: 200),
                        colorConfig:
                            MSHColorConfig.fromCheckedUncheckedDisabled(
                          checkedColor: context.appColors.controlColor,
                          uncheckedColor: context.appColors.controlColor,
                          disabledColor: context.appColors.controlColor,
                        ),
                        onChanged: (value) {
                          onChangeInitial(screen);
                        },
                        size: 20,
                      ),
                      decorated: true,
                    ),
                    Cell(
                      value: Text(
                        '${screen.name.pascalCase}Screen',
                        style: context.appTextStyles.fs18?.copyWith(
                            color: screen.exists
                                ? context.appColors.fadedColor
                                : context.appColors.textColor),
                      ),
                      decorated: true,
                    ),
                    Cell(
                      value: Text(
                        screen.stateManager.name.pascalCase,
                        style: context.appTextStyles.fs18?.copyWith(
                            color: screen.exists
                                ? context.appColors.fadedColor
                                : context.appColors.textColor),
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
                                    ? context.appColors.fadedColor
                                    : context.appColors.textColor,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                onPressed: () {
                                  if (!screen.exists) {
                                    showCupertinoModalPopup<Screen>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) => AddScreenDialog(
                                          screen: Screen.copyOf(screen)),
                                    ).then((modifiedScreen) {
                                      if (modifiedScreen != null) {
                                        onModifyScreen(
                                            modifiedScreen, screen.name);
                                      }
                                    });
                                  }
                                },
                                child: Text(
                                  S.of(context).modify,
                                  style: context.appTextStyles.fs18?.copyWith(
                                      color: context.appColors.darkColor),
                                ),
                              ),
                              const SizedBox(width: 10),
                              CupertinoButton(
                                color: screen.exists
                                    ? context.appColors.fadedColor
                                    : context.appColors.textColor,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                onPressed: () {
                                  if (!screen.exists) {
                                    onDeleteScreen(screen);
                                  }
                                },
                                child: Text(
                                  S.of(context).delete,
                                  style: context.appTextStyles.fs18?.copyWith(
                                    color: context.appColors.darkColor,
                                  ),
                                ),
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
      ],
    );
  }
}
