import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/input_params/form_data.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/input_params/input_body.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/input_params/path_params.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/input_params/query_params.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/input_params/request_params_header.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/input_params/response_body.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class RequestItem extends StatelessWidget {
  final RequestComponent request;

  const RequestItem({
    required this.request,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.appColors.contrastColor,
      child: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  request.operationId,
                  style: TextStyle(
                    color: context.appColors.textColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  '(${request.path})',
                  style: TextStyle(
                    color: context.appColors.textColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ColoredBox(
            color: context.appColors.darkContrastColor,
            child: Column(
              children: [
                Divider(
                  color: context.appColors.textColor,
                  thickness: 1,
                ),
                const RequestParamsHeader(),
                Row(
                  children: [
                    Expanded(
                      child: (request.hasInputParameters())
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InputBody(body: request.requestBody),
                                const SizedBox(height: 2),
                                FormData(
                                  formData: request.multipartBody,
                                ),
                                const SizedBox(height: 2),
                                QueryParams(
                                  queryParams: request.queryParams,
                                ),
                                const SizedBox(height: 2),
                                PathParams(
                                  pathParams: request.pathParams,
                                ),
                              ],
                            )
                          : const Text('No Input Parameters'),
                    ),
                    Expanded(
                      child: ResponseBody(
                        response: request.response,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
