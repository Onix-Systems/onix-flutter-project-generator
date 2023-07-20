abstract class Entity {
  Entity();

  List get properties;

  String get name;

  Set<String> get imports;

  Set<Entity> get entityImports;

  String get sourceName;

  void setSourceName(String sourceName);

  void setName(String name);
}
