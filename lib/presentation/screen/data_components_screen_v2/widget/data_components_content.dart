import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/objects/object_item.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/objects/object_view.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/section_header.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/sources/source_item_section.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class DataComponentsContent extends StatelessWidget {
  final Components components;
  final List<ObjectView> Function(SourceComponent) objectViews;
  final ValueChanged<String> onSourceEdit;
  final ValueChanged<String> onSourceDelete;
  final ValueChanged<Component> onComponentEdit;
  final ValueChanged<Component> onComponentDelete;
  final Function(String, RequestComponent) onRequestDelete;
  final VoidCallback refresh;

  const DataComponentsContent({
    required this.components,
    required this.objectViews,
    required this.onSourceEdit,
    required this.onSourceDelete,
    required this.onComponentEdit,
    required this.onComponentDelete,
    required this.onRequestDelete,
    required this.refresh,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dataComponents = [
      ...components.enums,
      ...components.dataObjects,
    ];

    final dataComponentNames = dataComponents
        .map((e) {
          if (e is DataObjectComponent) {
            return e.name;
          }
          if (e is EnumParamComponent) {
            return e.name;
          }
          return '';
        })
        .sorted((a, b) => a.compareTo(b))
        .toList();
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: Delimiter.height(100)),
        const SliverToBoxAdapter(child: SectionHeader(title: 'Sources')),
        SliverList.builder(
          itemCount: components.sources.length,
          itemBuilder: (context, index) {
            final source = components.sources[index];
            return SourceItem(
              source: source,
              objects: objectViews(source),
              onNameEdit: () => onSourceEdit(source.name),
              onSourceDelete: () => onSourceDelete(source.name),
              onRequestDelete: (request) =>
                  onRequestDelete(source.name, request),
              refresh: refresh,
            );
          },
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        const SliverToBoxAdapter(child: SectionHeader(title: 'Objects')),
        if (dataComponents.isNotEmpty)
          SliverList.builder(
            itemCount: dataComponents.length,
            itemBuilder: (context, index) {
              return ObjectItem(
                component: dataComponents
                    .firstWhere((e) => e.name == dataComponentNames[index]),
                onEdit: onComponentEdit,
                onDelete: onComponentDelete,
              );
            },
          )
        else
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                S.of(context).noDataComponents,
                style: context.appTextStyles.fs22,
              ),
            ),
          ),
      ],
    );
  }
}
