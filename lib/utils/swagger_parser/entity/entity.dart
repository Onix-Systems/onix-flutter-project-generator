import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
abstract class Entity {
  List get properties;

  String get name;
}
