import 'package:onix_flutter_bricks/domain/entity/source/source.dart';

abstract class SourceRepository {
  Set<Source> get sources;

  void parse(Map<String, dynamic> data);

  Source? getSourceByName(String name);
}
