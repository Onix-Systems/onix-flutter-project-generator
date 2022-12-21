class ScreenEntity {
  late int id;
  String name;
  bool bloc;

  ScreenEntity({
    required this.name,
    this.bloc = false,
  }) {
    id = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScreenEntity &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'ScreenEntity{id: $id, name: $name, bloc: $bloc}';
  }
}
