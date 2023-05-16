import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
abstract class Entity {
  List get properties;

  String get name;

  Set<String> get imports;

  String generateClassBody({required String projectName, String? sourceName});
}
