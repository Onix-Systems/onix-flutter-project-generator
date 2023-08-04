import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/path.dart';

part 'source.g.dart';

@JsonSerializable()
class Source {
  String name;
  List<DataComponent> dataComponents;
  bool exists;
  bool isGenerated;
  final List<Path> paths;
  final String tag;
  final List<String> dataComponentsNames;

  Source({
    required this.name,
    this.dataComponents = const [],
    this.exists = false,
    this.isGenerated = true,
    this.paths = const [],
    this.tag = '',
    this.dataComponentsNames = const [],
  });

  @override
  String toString() {
    return 'Source{name: $name, dataComponents: $dataComponents, exists: $exists, isGenerated: $isGenerated, paths: $paths, tag: $tag, dataComponentsNames: $dataComponentsNames}';
  }

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
