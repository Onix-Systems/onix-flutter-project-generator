import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/source/path.dart';

part 'source.g.dart';

@JsonSerializable()
class Source {
  String name;
  bool exists;
  bool isGenerated;
  final List<Path> paths;
  final String tag;
  List<String> dataComponentsNames;

  Source({
    required this.name,
    this.exists = false,
    this.isGenerated = true,
    this.paths = const [],
    this.tag = '',
    required this.dataComponentsNames,
  });

  @override
  String toString() {
    return 'Source{name: $name, exists: $exists, isGenerated: $isGenerated, tag: $tag, dataComponentsNames: $dataComponentsNames}';
  }

  Source.copyOf(Source source)
      : name = source.name,
        exists = source.exists,
        isGenerated = source.isGenerated,
        paths = source.paths.map((e) => Path.copyOf(e)).toList(),
        tag = source.tag,
        dataComponentsNames = source.dataComponentsNames;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
