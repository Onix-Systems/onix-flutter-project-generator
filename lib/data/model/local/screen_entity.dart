import 'package:json_annotation/json_annotation.dart';

part 'screen_entity.g.dart';

@JsonSerializable()
class ScreenEntity {
  String name;
  bool bloc;
  bool exists;

  ScreenEntity({
    required this.name,
    this.bloc = false,
    this.exists = false,
  });

  ScreenEntity.copyOf(ScreenEntity screen)
      : this(name: screen.name, bloc: screen.bloc, exists: screen.exists);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScreenEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          bloc == other.bloc &&
          exists == other.exists;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'ScreenEntity{name: $name, bloc: $bloc, exists: $exists}';
  }

  Map<String, dynamic> toJson() => _$ScreenEntityToJson(this);

  factory ScreenEntity.fromJson(Map<String, dynamic> json) =>
      _$ScreenEntityFromJson(json);
}
