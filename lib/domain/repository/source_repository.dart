import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';

abstract class SourceRepository {
  Source get timeSource;

  Set<Source> get sources;

  void parse({required Map<String, dynamic> data});

  bool containsNewComponents();

  Source? getSourceByName({required String sourceName});

  void addSource({required Source source});

  void addAll({required Set<Source> sources});

  void deleteSource(
      {required String sourceName, required bool withDataComponents});

  void modifySource({required Source source, required String oldSourceName});

  void addDataComponentToSource(
      {required String sourceName, required String dataComponentName});

  void deleteDataComponentFromSource(
      {required String sourceName, required String dataComponentName});

  void deleteDataComponentFromAllSources({required String dataComponentName});

  void modifyDataComponentInSource(
      {required DataComponent dataComponent,
      required String oldDataComponentName});

  void modifyDataComponentInAllSources(
      DataComponent dataComponent, String oldDataComponentName);

  void empty();

  void setAllExists();

  bool exists({required String sourceName});
}
