import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';

part 'data_variable_component.freezed.dart';

@Freezed(toJson: false, fromJson: false)
sealed class DataVariableComponent with _$DataVariableComponent {
  const DataVariableComponent._();

  const factory DataVariableComponent({
    required String name,
    required SwaggerType type,
    required bool isRequired,
    @Default(false) bool isEnum,
  }) = _DataVariableComponent;

  String getString() {
    return '${isRequired ? 'required ' : ''}$type $name;';
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type.toJson(),
      'isRequired': isRequired,
      'isEnum': isEnum,
    };
  }

  factory DataVariableComponent.fromJson(Map<String, dynamic> json) {
    return DataVariableComponent(
      name: json['name'] as String,
      type: SwaggerType.fromJson(json['type'] as Map<String, dynamic>),
      isRequired: json['isRequired'] as bool,
      isEnum: json['isEnum'] as bool? ?? false,
    );
  }
}
