import 'package:onix_flutter_bricks/domain/entity/entity.dart';

abstract class EntityRepository {
  Set<Entity> get entities;

  bool isEnum(String name);

  Set<String> getEnumNames();

  void parse(Map<String, dynamic> data);

  Entity? getEntityByName(String name);
}
