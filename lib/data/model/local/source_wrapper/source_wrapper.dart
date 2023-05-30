import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/local/entity_wrapper/entity_wrapper.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/path.dart';

part 'source_wrapper.g.dart';

@JsonSerializable()
class SourceWrapper {
  String name;
  List<EntityWrapper> entities;
  bool exists;
  List<Path> paths;

  SourceWrapper({
    required this.name,
    required this.entities,
    this.paths = const [],
    this.exists = false,
  });

  SourceWrapper.copyOf(SourceWrapper source)
      : this(
          name: source.name,
          entities:
              source.entities.map((e) => EntityWrapper.copyOf(e)).toList(),
          exists: source.exists,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SourceWrapper &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          entities == other.entities &&
          exists == other.exists;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'SourceEntity{name: $name, exists: $exists, entities: $entities}';
  }

  Map<String, dynamic> toJson() => _$SourceWrapperToJson(this);

  factory SourceWrapper.fromJson(Map<String, dynamic> json) =>
      _$SourceWrapperFromJson(json);
}
