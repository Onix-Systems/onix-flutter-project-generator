import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/enum/swagger_path_request_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/service/base/class_builder/class_builder.dart';
import 'package:onix_flutter_bricks/domain/service/base/class_builder/freezed_class_builder.dart';
import 'package:onix_flutter_bricks/domain/service/base/class_builder/json_class_builder.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

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
