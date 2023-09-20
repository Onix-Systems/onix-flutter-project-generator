import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/component_fields_dialog_dropdown.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_action_button.dart';
import 'package:onix_flutter_bricks/presentation/widgets/inputs/labeled_checkbox.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class AddComponentFieldDialog extends StatefulWidget {
  final Property? property;

  const AddComponentFieldDialog({
    this.property,
    super.key,
  });

  @override
  State<AddComponentFieldDialog> createState() =>
      _AddComponentFieldDialogState();
}

class _AddComponentFieldDialogState extends State<AddComponentFieldDialog> {
  final TextEditingController _propertyNameController = TextEditingController();

  late Property _property;

  bool _isList = false;

  final values = [
    'String',
    'int',
    'double',
    'bool',
  ];

  @override
  void initState() {
    if (widget.property != null) {
      _propertyNameController.text = widget.property!.name;
      _property = Property.copyOf(widget.property!);
      _isList = _property.type.contains('List');
    } else {
      _property = Property(
        name: '',
        type: '',
        nullable: false,
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.bgDark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 600,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LabeledCheckbox(
                      initialValue: _isList,
                      label: 'List',
                      onAction: () {
                        setState(() {
                          _isList = !_isList;
                        });
                      }),
                  ComponentFieldsDialogDropDown(
                    property: _property,
                    values: values,
                    onChanged: (value) => setState(() {
                      _property.type = TypeMatcher.getJsonType(value);
                    }),
                  ),
                  const SizedBox(width: 10),
                  LabeledCheckbox(
                      initialValue: _property.nullable,
                      label: 'nullable',
                      onAction: () {
                        setState(() {
                          _property.nullable = !_property.nullable;
                        });
                      }),
                  const SizedBox(width: 10),
                  Flexible(
                    child: CupertinoTextField(
                      controller: _propertyNameController,
                      style: context.appTextStyles.fs18,
                      onChanged: (value) => _property.name = value,
                    ),
                  ),
                ],
              ),
            ),
            const Delimiter.height(20),
            const Divider(
              color: AppColors.white,
              thickness: 0.25,
              height: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: AppActionButton(
                    label: S.of(context).ok,
                    onPressed: () => _onOK(context),
                  ),
                ),
                const SizedBox(
                    height: 56,
                    width: 0.3,
                    child: VerticalDivider(
                      color: AppColors.white,
                      thickness: 0.3,
                    )),
                Expanded(
                  child: AppActionButton(
                    label: S.of(context).cancel,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onOK(BuildContext context) async {
    if (_propertyNameController.text.isNotEmpty) {
      if (widget.property != null) {
        widget.property!.name = _propertyNameController.text.snakeCase;

        switch (_isList) {
          case true:
            if (!_property.type.contains('List')) {
              _property.type =
                  'List<${TypeMatcher.getDartType(_property.type)}>';
            }
            break;
          case false:
            if (_property.type.contains('List')) {
              _property.type =
                  _property.type.replaceAll('List<', '').replaceAll('>', '');
            }
            break;
        }

        widget.property!.type = _property.type;
        widget.property!.nullable = _property.nullable;

        Navigator.pop(context, widget.property);
      } else {
        _property.name = widget.property != null
            ? _propertyNameController.text.snakeCase
            : _propertyNameController.text;

        Navigator.pop(context, _property);
      }
    } else {
      Navigator.pop(context);
    }
  }
}
