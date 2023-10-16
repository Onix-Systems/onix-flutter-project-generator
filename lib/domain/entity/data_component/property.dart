import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';

part 'property.g.dart';

@JsonSerializable()
class Property {
  String name;
  String type;
  bool nullable;
  bool isList;

  Property({
    required this.name,
    required this.type,
    this.nullable = false,
    this.isList = false,
  });

  factory Property.empty() => Property(
        name: 'name',
        type: 'String',
        nullable: false,
        isList: false,
      );

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyToJson(this);

  @override
  String toString() {
    return '${nullable ? '' : 'required '}${isList ? 'List<' : ''}${TypeMatcher.getDartType(type)}${isList ? '>' : ''}${nullable ? '?' : ''} $name';
  }

  Property.copyOf(Property source)
      : this(
          name: source.name,
          type: source.type,
          nullable: source.nullable,
          isList: source.isList,
        );
}
