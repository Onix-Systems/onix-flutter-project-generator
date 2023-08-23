import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/source/method.dart';

part 'path.g.dart';

@JsonSerializable()
class Path {
  final String path;
  final List<Method> methods;

  Path({
    required this.path,
    required this.methods,
  });

  @override
  String toString() {
    return '\n{path: $path,\nmethods: $methods\n}';
  }

  factory Path.fromJson(Map<String, dynamic> json) => _$PathFromJson(json);

  Map<String, dynamic> toJson() => _$PathToJson(this);

  Path.copyOf(Path source)
      : this(
          path: source.path,
          methods: source.methods.map((e) => Method.copyOf(e)).toList(),
        );
}
