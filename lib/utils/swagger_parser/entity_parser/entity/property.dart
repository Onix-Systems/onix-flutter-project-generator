import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';

part 'property.g.dart';

@JsonSerializable()
class Property {
  final String name;
  late String type;
  final bool nullable;

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
}
