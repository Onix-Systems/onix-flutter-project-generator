import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/fields_dialog/add_component_tile_search_field.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widgets/inputs/labeled_checkbox.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class AddComponentTile extends StatefulWidget {
  final Property? property;
  final List<DataComponent> components;
  final ValueChanged<Property> onChanged;
  final bool error;

  const AddComponentTile({
    required this.components,
    required this.onChanged,
    this.property,
    this.error = false,
    super.key,
  });

  @override
  State<AddComponentTile> createState() => _AddComponentTileState();
}

class _AddComponentTileState extends State<AddComponentTile> {
  final TextEditingController _propertyNameController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _propertyNameFocusNode = FocusNode();
  final FocusNode _searchFieldFocusNode = FocusNode();

  late Property _property;

  bool _isList = false;

  @override
  void initState() {
    if (widget.property != null) {
      _propertyNameController.text = widget.property!.name;
      _property = Property.copyOf(widget.property!);
      if (_property.type.contains('List')) {
        _isList = true;
        _property.type = TypeMatcher.getDartType(
            _property.type.replaceAll('List<', '').replaceAll('>', ''));
      }
    } else {
      _property = Property(
        name: '',
        type: '',
        nullable: false,
      );
    }
    _searchController.text = _property.type;

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
        width: 800,
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
                Flexible(
                  child: Material(
                    color: Colors.transparent,
                    child: AddComponentComponentSearchField(
                      searchController: _searchController,
                      searchFieldFocusNode: _searchFieldFocusNode,
                      components: widget.components,
                      property: _property,
                      onSelect: (value) {
                        setState(() {
                          _property.type = value.name;
                          _propertyNameFocusNode.requestFocus();
                          if (_propertyNameController.text.isEmpty) {
                            _propertyNameController.text = value.name.camelCase;
                          }
                          _onChanged();
                        });
                      },
                      onClear: () {
                        setState(() {
                          _property.type = '';
                          _searchController.clear();
                          _searchFieldFocusNode.requestFocus();

                          _onChanged();
                        });
                      },
                    ),
                  ),
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
                        color: widget.error && _property.type.isNotEmpty
                            ? AppColors.red
                            : AppColors.inactiveText,
                      ),
                    ),
                    focusNode: _propertyNameFocusNode,
                    controller: _propertyNameController,
                    style: context.appTextStyles.fs18,
                    onChanged: (value) {
                      setState(() {
                        _onChanged();
                      });
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
    _property.name = _propertyNameController.text;
    final property = Property.copyOf(_property);
    switch (_isList) {
      case true:
        if (!_property.type.contains('List')) {
          property.type = 'List<${_property.type}>';
        }
      case false:
        property.type =
            _property.type.replaceAll('List<', '').replaceAll('>', '');
    }

    widget.onChanged(property);
  }
}
