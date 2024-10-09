import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/state_management/state_management_variant.dart';

part 'screen.g.dart';

@JsonSerializable()
class Screen {
  String name;
  @JsonKey(includeFromJson: false, includeToJson: false)
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
            initial: screen.initial);

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

  Map<String, dynamic> toJson() => _$ScreenToJson(this);

  factory Screen.fromJson(Map<String, dynamic> json) => _$ScreenFromJson(json);
}
