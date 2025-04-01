import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';

part 'components.freezed.dart';

@Freezed(toJson: false, fromJson: false)
class Components with _$Components {
  const Components._();

  const factory Components({
    required List<SourceComponent> sources,
    required List<EnumParamComponent> enums,
    required List<DataObjectComponent> dataObjects,
  }) = _Components;

  factory Components.empty() => const Components(
        sources: [],
        enums: [],
        dataObjects: [],
      );

  Map<String, dynamic> toJson() {
    return {
      'sources': sources.map((e) => e.toJson()).toList(),
      'enums': enums.map((e) => e.toJson()).toList(),
      'dataObjects': dataObjects.map((e) => e.toJson()).toList(),
    };
  }

  factory Components.fromJson(Map<String, dynamic> json) {
    return Components(
      sources: (json['sources'] as List<dynamic>)
          .map((e) => SourceComponent.fromJson(e))
          .toList(),
      enums: (json['enums'] as List<dynamic>)
          .map((e) => EnumParamComponent.fromJson(e))
          .toList(),
      dataObjects: (json['dataObjects'] as List<dynamic>)
          .map((e) => DataObjectComponent.fromJson(e))
          .toList(),
    );
  }
}
