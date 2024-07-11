import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';

part 'components.freezed.dart';

@freezed
class Components with _$Components {
  const Components._();

  const factory Components({
    required List<SourceComponent> sources,
    required List<EnumParamComponent> enums,
    required List<DataObjectComponent> dataObjects,
  }) = _Components;


}
