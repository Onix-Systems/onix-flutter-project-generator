import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/sources/request_item.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class RequestsSection extends StatelessWidget {
  final List<RequestComponent> requests;

  const RequestsSection({
    required this.requests,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.darkContrastColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: requests
            .map(
              (e) => RequestItem(request: e),
            )
            .toList(),
      ),
    );
  }
}
