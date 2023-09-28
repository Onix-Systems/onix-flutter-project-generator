import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_action_button.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class ComponentPreviewModal extends StatelessWidget {
  final DataComponent dataComponent;

  const ComponentPreviewModal({required this.dataComponent, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.bgDark,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Delimiter.height(20),
              Text(
                '${dataComponent.name.pascalCase} component preview',
                textAlign: TextAlign.center,
                style: context.appTextStyles.fs18,
              ),
              const Delimiter.height(20),
              const SizedBox(
                height: 1,
                width: double.infinity,
                child: ColoredBox(
                  color: AppColors.inactiveText,
                ),
              ),
              const Delimiter.height(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Text(
                        'class ${dataComponent.name.pascalCase} {',
                        textAlign: TextAlign.left,
                        style: context.appTextStyles.fs18,
                      ),
                    ),
                    SliverList.builder(
                        itemCount: dataComponent.properties.length,
                        itemBuilder: (context, index) {
                          return Text(
                            '      ${dataComponent.properties[index].nullable ? '' : 'required '}${dataComponent.properties[index].isList ? 'List<' : ''}${TypeMatcher.getDartType(dataComponent.properties[index].type)}${dataComponent.properties[index].isList ? '>' : ''}${dataComponent.properties[index].nullable ? '?' : ''} ${dataComponent.properties[index].name.camelCase};',
                            textAlign: TextAlign.left,
                            style: context.appTextStyles.fs18,
                          );
                        }),
                    SliverToBoxAdapter(
                      child: Text(
                        '}',
                        textAlign: TextAlign.left,
                        style: context.appTextStyles.fs18,
                      ),
                    ),
                  ],
                ),
              ),
              const Delimiter.height(20),
              const SizedBox(
                height: 1,
                width: double.infinity,
                child: ColoredBox(
                  color: AppColors.inactiveText,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: AppActionButton(
                        onPressed: () => Navigator.pop(context),
                        label: S.of(context).ok),
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
