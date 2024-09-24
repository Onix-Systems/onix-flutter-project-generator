import 'package:json_annotation/json_annotation.dart';

part 'screen.g.dart';

@JsonSerializable()
class Screen {
  String name;
  String stateManager;
  bool exists;
  bool initial;

  Screen({
    required this.name,
    this.stateManager = '',
    this.exists = false,
    this.initial = false,
  });

  Screen.copyOf(Screen screen)
      : this(
            name: screen.name,
            stateManager: screen.stateManager,
            exists: screen.exists,
            initial: screen.initial);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Screen &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          stateManager == other.stateManager &&
          exists == other.exists &&
          initial == other.initial;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'ScreenEntity{name: $name, bloc: $stateManager, exists: $exists, initial: $initial}';
  }

  Map<String, dynamic> toJson() => _$ScreenToJson(this);

  factory Screen.fromJson(Map<String, dynamic> json) => _$ScreenFromJson(json);
}

//enum ScreenStateManager { bloc, cubit, none }
