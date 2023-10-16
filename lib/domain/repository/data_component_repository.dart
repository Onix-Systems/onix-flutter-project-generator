import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';

abstract class DataComponentRepository {
  DataComponent get authComponent;

  DataComponent get timeComponent;

  Set<DataComponent> get dataComponents;

  bool isEnum({required String dataComponentName});

  bool containsNewComponents();

  bool exists({required String dataComponentName});

  Set<String> getEnumNames();

  void parse({required Map<String, dynamic> data});

  DataComponent? getDataComponentByName({required String dataComponentName});

  void empty();

  void addComponent({required DataComponent dataComponent});

  void removeComponent({required String dataComponentName});

  void modifyComponent(
      {required String oldDataComponentName,
      required DataComponent dataComponent});

  void addAll({required Set<DataComponent> dataComponents});

  void setAllExists();

  void setDataComponentSource(
      {required String dataComponentName, String sourceName = ''});
}
