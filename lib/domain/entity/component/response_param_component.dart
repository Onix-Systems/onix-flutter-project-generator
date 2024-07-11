import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/app/util/enum/swagger_path_request_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

part 'response_param_component.freezed.dart';

@freezed
class ResponseParamComponent with _$ResponseParamComponent {
  const ResponseParamComponent._();

  const factory ResponseParamComponent({
    required String name,
    required SwaggerType type,
    required bool isRequired,
  }) = _ResponseParamComponent;




}
