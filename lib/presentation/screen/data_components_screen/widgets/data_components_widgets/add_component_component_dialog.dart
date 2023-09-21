import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/add_component_component_search_field.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_action_button.dart';
import 'package:onix_flutter_bricks/presentation/widgets/inputs/labeled_checkbox.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class AddComponentComponentDialog extends StatefulWidget {
  final Property? property;

  const AddComponentComponentDialog({
    this.property,
    super.key,
  });

  @override
  State<AddComponentComponentDialog> createState() =>
      _AddComponentComponentDialogState();
}

class _AddComponentComponentDialogState
    extends State<AddComponentComponentDialog> {
  final TextEditingController _propertyNameController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _propertyNameFocusNode = FocusNode();
  final FocusNode _searchFieldFocusNode = FocusNode();
  final components = <DataComponent>[];

  late Property _property;

  bool _isList = false;

  @override
  void initState() {
    components.addAll(dataComponentRepository.dataComponents);

    components.addAll(sourceRepository.sources
        .map((e) => e.dataComponents)
        .expand((element) => element));

    components.sort((a, b) => a.name.compareTo(b.name));

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
                  const SizedBox(width: 10),
                  Flexible(
                    child: Material(
                      color: Colors.transparent,
                      child: AddComponentComponentSearchField(
                        searchController: _searchController,
                        searchFieldFocusNode: _searchFieldFocusNode,
                        components: components,
                        property: _property,
                        onSelect: (value) {
                          setState(() {
                            _property.type = value.name;
                            _propertyNameFocusNode.requestFocus();
                            if (_propertyNameController.text.isEmpty) {
                              _propertyNameController.text =
                                  value.name.camelCase;
                            }
                          });
                        },
                        onClear: () {
                          setState(() {
                            _property.type = '';
                            _searchController.clear();

                            _searchFieldFocusNode.requestFocus();
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
                        });
                      }),
                  const SizedBox(width: 10),
                  Flexible(
                    child: CupertinoTextField(
                      focusNode: _propertyNameFocusNode,
                      controller: _propertyNameController,
                      style: context.appTextStyles.fs18,
                      onChanged: (value) {
                        setState(() {
                          _property.name = value;
                        });
                      },
                      onSubmitted: (value) {
                        _property.name = value;
                        _onOK(context);
                      },
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
                    active: _propertyNameController.text.isNotEmpty &&
                        _property.type.isNotEmpty,
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
    if (_propertyNameController.text.isNotEmpty && _property.type.isNotEmpty) {
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
            } else {
              _property.type = TypeMatcher.getJsonType(_property.type);
            }
            break;
        }

        logger.f(_property.type);

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
