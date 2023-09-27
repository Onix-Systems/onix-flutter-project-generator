import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/fields_dialog/add_fields_tile_dropdown.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widgets/inputs/labeled_checkbox.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class AddFieldTile extends StatefulWidget {
  final Property? property;
  final ValueChanged<Property> onChanged;
  final bool error;

  const AddFieldTile({
    required this.onChanged,
    required this.error,
    this.property,
    super.key,
  });

  @override
  State<AddFieldTile> createState() => _AddFieldTileState();
}

class _AddFieldTileState extends State<AddFieldTile> {
  final TextEditingController _propertyNameController = TextEditingController();

  late Property _property;

  bool _isList = false;

  final values = [
    'String',
    'int',
    'double',
    'bool',
  ];

  void init() {
    if (widget.property != null) {
      _propertyNameController.text = widget.property!.name;
      _property = Property.copyOf(widget.property!);
      if (_property.isList) {
        _isList = true;
      }
    } else {
      _property = Property.empty();
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LabeledCheckbox(
                    initialValue: _isList,
                    label: 'List',
                    onAction: () {
                      setState(() {
                        _isList = !_isList;
                        _onChanged();
                      });
                    }),
                AddFieldsTileDropDown(
                  property: _property,
                  values: values,
                  onChanged: (value) => setState(() {
                    _property.type = value;
                    _onChanged();
                  }),
                ),
                const SizedBox(width: 10),
                LabeledCheckbox(
                    initialValue: _property.nullable,
                    label: 'nullable',
                    onAction: () {
                      setState(() {
                        _property.nullable = !_property.nullable;
                        _onChanged();
                      });
                    }),
                const SizedBox(width: 10),
                Flexible(
                  child: CupertinoTextField(
                    decoration: BoxDecoration(
                      color: AppColors.bgDark,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: widget.error
                            ? AppColors.red
                            : AppColors.inactiveText,
                      ),
                    ),
                    controller: _propertyNameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                    ],
                    style: context.appTextStyles.fs18,
                    onChanged: (value) {
                      _property.name = value.camelCase;
                      _onChanged();
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

  void _onChanged() {
    final property = Property.copyOf(_property);
    property.isList = _isList;
    property.type = TypeMatcher.getJsonType(_property.type);

    widget.onChanged(property);
  }
}
