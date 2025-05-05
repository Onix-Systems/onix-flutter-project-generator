import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';

part 'response_param_component.freezed.dart';

@Freezed(toJson: false, fromJson: false)
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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type.toJson(),
      'isRequired': isRequired,
      'isEnum': isEnum,
    };
  }

  factory ResponseParamComponent.fromJson(Map<String, dynamic> json) {
    return ResponseParamComponent(
      name: json['name'] as String,
      type: SwaggerType.fromJson(json['type'] as Map<String, dynamic>),
      isRequired: json['isRequired'] as bool,
      isEnum: json['isEnum'] as bool? ?? false,
      fromSwagger: json['fromSwagger'] as bool? ?? true,
    );
  }
}
