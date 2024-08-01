import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/objects/object_item.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/section_header.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/sources/source_item_section.dart';

class DataComponentsContent extends StatefulWidget {
  final Components components;

  const DataComponentsContent({
    required this.components,
    super.key,
  });

  @override
  State<DataComponentsContent> createState() => _DataComponentsContentState();
}

class _DataComponentsContentState extends State<DataComponentsContent> {
  @override
  Widget build(BuildContext context) {
    final components = widget.components;
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: Delimiter.height(100)),
        const SliverToBoxAdapter(child: SectionHeader(title: 'Sources')),
        SliverList.builder(
          itemCount: components.sources.length,
          itemBuilder: (context, index) {
            return SourceItem(
              source: components.sources[index],
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

//  ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         const SectionHeader(
//           title: 'Sources',
//         ),
//         Column(
//           children: components.sources
//               .map(
//                 (e) => SourceItem(
//                   source: e,
//                 ),
//               )
//               .toList(),
//         ),
//         const SizedBox(height: 32),
//         const SectionHeader(
//           title: 'Objects',
//         ),
//         Column(
//           children: components.dataObjects
//               .map(
//                 (e) => ObjectItem(
//                   object: e,
//                 ),
//               )
//               .toList(),
//         ),
//       ],
//     );
