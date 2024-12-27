import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/objects/object_item.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/objects/object_view.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/section_header.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/sources/source_item_section.dart';

class DataComponentsContent extends StatelessWidget {
  final Components components;
  final List<ObjectView> Function(SourceComponent) objectViews;

  const DataComponentsContent({
    required this.components,
    required this.objectViews,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: Delimiter.height(100)),
        const SliverToBoxAdapter(child: SectionHeader(title: 'Sources')),
        SliverList.builder(
          itemCount: components.sources.length,
          itemBuilder: (context, index) {
            return SourceItem(
              source: components.sources[index],
              objects: objectViews(components.sources[index]),
            );
          },
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        const SliverToBoxAdapter(child: SectionHeader(title: 'Objects')),
        SliverList.builder(
          itemCount: components.dataObjects.length,
          itemBuilder: (context, index) {
            return ObjectItem(object: components.dataObjects[index]);
          },
        ),
      ],
    );
  }
}
