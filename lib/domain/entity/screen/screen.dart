import 'package:json_annotation/json_annotation.dart';

part 'screen.g.dart';

@JsonSerializable()
class Screen {
  String name;
  ScreenStateManagement state;
  bool exists;

  Screen({
    required this.name,
    this.state = ScreenStateManagement.none,
    this.exists = false,
  });

  Screen.copyOf(Screen screen)
      : this(name: screen.name, state: screen.state, exists: screen.exists);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Screen &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          state == other.state &&
          exists == other.exists;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'ScreenEntity{name: $name, bloc: $state, exists: $exists}';
  }

  Map<String, dynamic> toJson() => _$ScreenToJson(this);

  factory Screen.fromJson(Map<String, dynamic> json) => _$ScreenFromJson(json);
}

enum ScreenStateManagement { bloc, cubit, none }
