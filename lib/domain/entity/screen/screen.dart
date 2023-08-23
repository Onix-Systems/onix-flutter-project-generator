import 'package:json_annotation/json_annotation.dart';

part 'screen.g.dart';

@JsonSerializable()
class Screen {
  String name;
  bool bloc;
  bool exists;

  Screen({
    required this.name,
    this.bloc = false,
    this.exists = false,
  });

  Screen.copyOf(Screen screen)
      : this(name: screen.name, bloc: screen.bloc, exists: screen.exists);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Screen &&
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

  Map<String, dynamic> toJson() => _$ScreenToJson(this);

  factory Screen.fromJson(Map<String, dynamic> json) => _$ScreenFromJson(json);
}
