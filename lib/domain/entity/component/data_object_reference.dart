import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';

part 'data_object_reference.freezed.dart';

@freezed
class DataObjectReference with _$DataObjectReference {
  const DataObjectReference._();

  const factory DataObjectReference({
    required DataFileType type,
    required SwaggerReference fileReference,
  }) = _DataObjectReference;

}
