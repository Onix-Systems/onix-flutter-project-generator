import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_action_button.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/labeled_checkbox.dart';

class DeleteSourceDialog extends StatefulWidget {
  final String sourceName;

  const DeleteSourceDialog({required this.sourceName, super.key});

  @override
  State<DeleteSourceDialog> createState() => _DeleteSourceDialogState();
}

class _DeleteSourceDialogState extends State<DeleteSourceDialog> {
  bool _withDataComponents = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.appColors.darkColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                  S.of(context).sourceDeletingDialogTitle(widget.sourceName),
                  textAlign: TextAlign.center,
                  style: context.appTextStyles.fs18?.copyWith(
                    color: context.appColors.alarmColor,
                  ),
                ),
              ),
              SizedBox(
                height: 1,
                width: double.infinity,
                child: ColoredBox(
                  color: context.appColors.fadedColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabeledCheckbox(
                        label: S.of(context).withComponents,
                        initialValue: _withDataComponents,
                        onAction: () {
                          setState(() {
                            _withDataComponents = !_withDataComponents;
                          });
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 1,
                width: double.infinity,
                child: ColoredBox(
                  color: context.appColors.fadedColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: AppActionButton(
                      label: S.of(context).ok,
                      onPressed: () {
                        Navigator.pop(context, _withDataComponents);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: 1,
                    child: ColoredBox(
                      color: context.appColors.fadedColor,
                    ),
                  ),
                  Expanded(
                    child: AppActionButton(
                      label: S.of(context).cancel,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
