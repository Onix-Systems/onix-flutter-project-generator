import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';

part 'property.g.dart';

@JsonSerializable()
class Property {
  String name;
  String type;
  bool nullable;

  Property({
    required this.name,
    required this.type,
    this.nullable = false,
  });

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyToJson(this);

  @override
  String toString() {
    return '${nullable ? '' : 'required '}${TypeMatcher.getDartType(type)}${nullable ? '?' : ''} $name';
  }

  Property.copyOf(Property source)
      : this(
          name: source.name,
          type: source.type,
          nullable: source.nullable,
        );
}
