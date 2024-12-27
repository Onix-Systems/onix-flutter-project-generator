import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/objects/object_view.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/sources/request_item.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class RequestsSection extends StatelessWidget {
  final List<RequestComponent> requests;
  final List<ObjectView> objects;

  const RequestsSection({
    required this.requests,
    required this.objects,
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
              (e) => RequestItem(
                request: e,
                requestObject: findObject(e.requestBody?.type),
                responseObject: findObject(e.response.type),
              ),
            )
            .toList(),
      ),
    );
  }

  ObjectView? findObject(SwaggerType? type) {
    if (type is SwaggerArray) {
      final object = objects.firstWhereOrNull(
        (element) => element.name == type.from,
      );

      return object;
    }

    final object = objects.firstWhereOrNull(
      (element) => element.name == type.toString(),
    );

    return object;
  }
}
