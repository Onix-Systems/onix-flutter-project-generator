import 'package:onix_flutter_bricks/domain/entity/state_management/state_management_variant.dart';

class Screen {
  String name;
  StateManagementVariant stateVariant;
  bool exists;
  bool initial;

  Screen({
    required this.name,
    this.stateVariant = const StatelessStateManagementVariant(),
    this.exists = false,
    this.initial = false,
  });

  Screen.copyOf(Screen screen)
      : this(
          name: screen.name,
          stateVariant: screen.stateVariant,
          exists: screen.exists,
          initial: screen.initial,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Screen &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          stateVariant == other.stateVariant &&
          exists == other.exists &&
          initial == other.initial;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'ScreenEntity{name: $name, stateManager: ${stateVariant.name}, exists: $exists, initial: $initial}';
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'state_variant': stateVariant.name,
        'exists': exists,
        'initial': initial,
      };

  factory Screen.fromJson(Map<String, dynamic> json) => Screen(
        name: json['name'],
        stateVariant: StateManagementVariant.fromJson(json),
        exists: json['exists'],
        initial: json['initial'],
      );
}
