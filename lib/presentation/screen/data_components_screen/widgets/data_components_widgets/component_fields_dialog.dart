import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/add_component_component_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/add_component_field_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/edit_remove_button.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_action_button.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class ComponentFieldsDialog extends StatefulWidget {
  final DataComponent dataComponent;

  const ComponentFieldsDialog({required this.dataComponent, super.key});

  @override
  State<ComponentFieldsDialog> createState() => _ComponentFieldsDialogState();
}

class _ComponentFieldsDialogState extends State<ComponentFieldsDialog> {
  final List<Property> _properties = [];

  @override
  void initState() {
    _properties
        .addAll(widget.dataComponent.properties.map((e) => Property.copyOf(e)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.bgDark,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${widget.dataComponent.name.pascalCase} fields',
                style: context.appTextStyles.fs18,
              ),
              const Divider(
                color: AppColors.white,
                thickness: 0.25,
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text('class ${widget.dataComponent.name.pascalCase} {',
                        style: context.appTextStyles.fs18),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _properties.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text(
                              '${_properties[index].nullable ? '' : 'required '}${TypeMatcher.getDartType(_properties[index].type)}${_properties[index].nullable ? '?' : ''} ${_properties[index].name},',
                              style: context.appTextStyles.fs18,
                            ),
                            const SizedBox(width: 15),
                            EditRemoveButton(onPressed: () {
                              if (TypeMatcher.isStandardType(
                                  TypeMatcher.getDartType(_properties[index]
                                      .type
                                      .replaceAll('List<', '')
                                      .replaceAll('>', '')))) {
                                _showAddComponentFieldDialog(
                                    context: context,
                                    property: _properties[index]);
                              } else {
                                _showAddComponentComponentDialog(
                                    context: context,
                                    property: _properties[index]);
                              }
                            }),
                            EditRemoveButton(
                              onPressed: () {
                                setState(() {
                                  _properties.removeAt(index);
                                });
                              },
                              isEdit: false,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text('}', style: context.appTextStyles.fs18),
                  ],
                ),
              ),
              const Delimiter.height(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppFilledButton(
                    label: 'Add field',
                    icon: CupertinoIcons.plus,
                    onPressed: () =>
                        _showAddComponentFieldDialog(context: context),
                  ),
                  const SizedBox(width: 20),
                  AppFilledButton(
                    label: 'Add component',
                    icon: CupertinoIcons.plus,
                    onPressed: () {
                      _showAddComponentComponentDialog(context: context);
                    },
                  ),
                ],
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
                      onPressed: () {
                        widget.dataComponent.properties = _properties;
                        Navigator.of(context).pop();
                      },
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
      ),
    );
  }

  void _showAddComponentFieldDialog(
      {required BuildContext context, Property? property}) {
    showCupertinoModalPopup<Property>(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: AddComponentFieldDialog(
                property: property,
              ),
            )).then((value) {
      if (value != null) {
        setState(() {
          if (property != null) {
            final index = _properties.indexOf(property);
            _properties.remove(property);
            _properties.insert(index, value);
          } else {
            _properties.add(value);
          }
        });
      }
    });
  }

  void _showAddComponentComponentDialog(
      {required BuildContext context, Property? property}) {
    showCupertinoModalPopup<Property>(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: AddComponentComponentDialog(
                property: property,
              ),
            )).then((value) {
      if (value != null) {
        setState(() {
          if (property != null) {
            final index = _properties.indexOf(property);
            _properties.remove(property);
            _properties.insert(index, value);
          } else {
            _properties.add(value);
          }
          widget.dataComponent.addImports([value.type]);
          widget.dataComponent.addComponentImports([value.type]);
        });
        logger.f('properties: $_properties');
      }
    });
  }
}
