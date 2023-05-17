abstract class Entity {
  Entity();

  List get properties;

  String get name;

  Set<String> get imports;

  Set<Entity> get entityImports;

  String get sourceName;

  String generateClassBody({required String projectName});

  void setSourceName(String sourceName);
}
