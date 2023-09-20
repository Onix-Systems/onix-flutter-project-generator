import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_action_button.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widgets/inputs/labeled_checkbox.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

import 'component_fileds_dialog_dropdown.dart';

class ComponentFieldsDialog extends StatefulWidget {
  final DataComponent dataComponent;

  const ComponentFieldsDialog({required this.dataComponent, super.key});

  @override
  State<ComponentFieldsDialog> createState() => _ComponentFieldsDialogState();
}

class _ComponentFieldsDialogState extends State<ComponentFieldsDialog> {
  final List<Property> _properties = [];
  final List<bool> _isList = [];

  @override
  void initState() {
    _properties
        .addAll(widget.dataComponent.properties.map((e) => Property.copyOf(e)));
    for (int i = 0; i < _properties.length; i++) {
      _isList.add(_properties[i].type.contains('List'));
      _properties[i].type =
          _properties[i].type.replaceAll('List<', '').replaceAll('>', '');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
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
                textAlign: TextAlign.center,
                style: context.appTextStyles.fs18,
              ),
              const Divider(
                color: AppColors.white,
                thickness: 0.25,
                height: 40,
              ),
              Flexible(
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    SliverList.separated(
                        itemCount: _properties.length,
                        separatorBuilder: (context, index) {
                          return Delimiter.height(
                              index < _properties.length - 1 ? 10 : 0);
                        },
                        itemBuilder: (context, index) {
                          final TextEditingController propertyNameController =
                              TextEditingController();
                          propertyNameController.text = _properties[index].name;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LabeledCheckbox(
                                    initialValue: _isList[index],
                                    label: 'List',
                                    onAction: () {
                                      setState(() {
                                        _isList[index] = !_isList[index];
                                      });
                                    }),
                                ComponentFieldsDialogDropDown(
                                  property: _properties[index],
                                  values: const [
                                    'String',
                                    'int',
                                    'double',
                                    'bool',
                                  ],
                                  onChanged: (value) => setState(() {
                                    _properties[index].type =
                                        TypeMatcher.getJsonType(value);
                                  }),
                                ),
                                const SizedBox(width: 10),
                                LabeledCheckbox(
                                    initialValue: _properties[index].nullable,
                                    label: 'nullable',
                                    onAction: () {
                                      setState(() {
                                        _properties[index].nullable =
                                            !_properties[index].nullable;
                                      });
                                    }),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: CupertinoTextField(
                                    controller: propertyNameController,
                                    style: context.appTextStyles.fs18,
                                    onChanged: (value) =>
                                        _properties[index].name = value,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Material(
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _properties.removeAt(index);
                                        });
                                      },
                                      icon: const Icon(Icons.close)),
                                ),
                              ],
                            ),
                          );
                        }),
                    const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
                    SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 20),
                          AppFilledButton(
                            label: 'Add field',
                            icon: CupertinoIcons.plus,
                            onPressed: () {
                              setState(() {
                                _properties.add(
                                  Property(
                                    name: '',
                                    type: 'string',
                                  ),
                                );
                                _isList.add(false);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
                  ],
                ),
              ),
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
                        for (int i = 0; i < _properties.length; i++) {
                          switch (_isList[i]) {
                            case true:
                              if (!_properties[i].type.contains('List')) {
                                _properties[i].type =
                                    'List<${TypeMatcher.getDartType(_properties[i].type)}>';
                              }
                              break;
                            case false:
                              if (_properties[i].type.contains('List')) {
                                _properties[i].type = _properties[i]
                                    .type
                                    .replaceAll('List<', '')
                                    .replaceAll('>', '');
                              }
                              break;
                          }
                        }
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
}
