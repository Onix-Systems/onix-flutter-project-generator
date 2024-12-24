import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/sources/requests_section.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:recase/recase.dart';

class SourceItem extends StatelessWidget {
  final SourceComponent source;
  final List<DataObjectComponent> objects;
  final ValueChanged<DataObjectComponent?> onHover;

  const SourceItem({
    required this.source,
    required this.objects,
    required this.onHover,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: context.appColors.darkColor,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 48,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              source.name.titleCase,
              style: TextStyle(
                color: context.appColors.textColor,
                fontSize: 22,
              ),
            ),
          ),
        ),
        RequestsSection(
          requests: source.requests,
          objects: objects,
          onHover: onHover,
        ),
      ],
    );
  }
}
