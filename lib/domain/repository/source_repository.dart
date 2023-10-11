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

  void modifySource(Source source, String sourceName);

  void addDataComponentToSource(Source source, DataComponent dataComponent);

  void deleteDataComponentFromSource(
      {required Source source, required String dataComponentName});

  void deleteDataComponentFromAllSources(String name);

  void modifyDataComponentInSource(String sourceName,
      DataComponent dataComponent, String oldDataComponentName);

  void modifyDataComponentInAllSources(
      DataComponent dataComponent, String oldDataComponentName);

  void empty();

  void setAllExists();
}
