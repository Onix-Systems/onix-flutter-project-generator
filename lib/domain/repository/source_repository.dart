import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';

abstract class SourceRepository {
  Source get timeSource;

  Set<Source> get sources;

  void parse(Map<String, dynamic> data);

  bool containsNewComponents();

  Source? getSourceByName(String name);

  String getDataComponentSourceName(String entityName);

  DataComponent? getDataComponentByName(String name);

  void addSource(Source source);

  void addAll(Set<Source> sources);

  void deleteSource(Source source);

  void modifySource(Source source, String sourceName);

  void addDataComponentToSource(Source source, DataComponent dataComponent);

  void deleteDataComponentFromSource(
      Source source, DataComponent dataComponent);

  void deleteDataComponentFromAllSources(String name);

  void modifyDataComponentInSource(
      Source source, DataComponent dataComponent, String oldDataComponentName);

  void modifyDataComponentInAllSources(
      DataComponent dataComponent, String oldDataComponentName);

  void empty();

  bool checkEntityIsEnum({required String entityName});
}
