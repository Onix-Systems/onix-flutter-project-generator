import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
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
  final List<DataComponent> _components = [];
  final List<bool> _isPropertyList = [];

  @override
  void initState() {
    _properties
        .addAll(widget.dataComponent.properties.map((e) => Property.copyOf(e)));

    _components.addAll(dataComponentRepository.dataComponents);
    _components.addAll(sourceRepository.sources
        .map((e) => e.dataComponents)
        .expand((e) => e)
        .toList());

    for (int i = 0; i < _properties.length; i++) {
      _isPropertyList.add(_properties[i].type.contains('List'));
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
                            EditRemoveButton(onPressed: () {}),
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
                    onPressed: () {
                      showCupertinoModalPopup<Property>(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => Center(
                                child: AddComponentFieldDialog(
                                  property: Property(
                                    name: '',
                                    type: 'String',
                                    nullable: false,
                                  ),
                                ),
                              )).then((value) {
                        setState(() {
                          _properties.add(value!);
                        });
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  AppFilledButton(
                    label: 'Add component',
                    icon: CupertinoIcons.plus,
                    onPressed: () {
                      setState(() {
                        _properties.add(
                          Property(
                            name: '',
                            type: 'string',
                          ),
                        );
                        _isPropertyList.add(false);
                      });
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
}
