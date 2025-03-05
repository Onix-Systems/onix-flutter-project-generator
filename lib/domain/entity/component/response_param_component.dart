import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';

part 'response_param_component.freezed.dart';

@freezed
class ResponseParamComponent with _$ResponseParamComponent {
  const ResponseParamComponent._();

  const factory ResponseParamComponent({
    required String name,
    required SwaggerType type,
    required bool isRequired,
    @Default(false) bool isEnum,
    @Default(true) bool fromSwagger,
  }) = _ResponseParamComponent;

  factory ResponseParamComponent.operationDefault() => ResponseParamComponent(
        name: '',
        type: SwaggerOperationDefault(),
        isRequired: false,
      );

  ResponseParamComponent changeComponentType(SwaggerType? type) {
    return copyWith(
      type: type ?? SwaggerOperationDefault(),
      isEnum: type is SwaggerEnum,
    );
  }
}
