import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';

part 'data_variable_component.freezed.dart';

@freezed
class DataVariableComponent with _$DataVariableComponent {
  const DataVariableComponent._();

  const factory DataVariableComponent({
    required String name,
    required SwaggerType type,
    required bool isRequired,
  }) = _DataVariableComponent;
}
