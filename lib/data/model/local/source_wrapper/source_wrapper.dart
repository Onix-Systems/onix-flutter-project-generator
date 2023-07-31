import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/path.dart';

part 'source_wrapper.g.dart';

@JsonSerializable()
class SourceWrapper {
  String name;
  List<Entity> entities;
  bool exists;
  bool isGenerated;
  List<Path> paths;

  SourceWrapper({
    required this.name,
    required this.entities,
    this.paths = const [],
    this.exists = false,
    this.isGenerated = true,
  });

  SourceWrapper.copyOf(SourceWrapper source)
      : this(
          name: source.name,
          entities: source.entities.map((e) => Entity.copyOf(e)).toList(),
          exists: source.exists,
          isGenerated: source.isGenerated,
          paths: source.paths.map((e) => Path.copyOf(e)).toList(),
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
