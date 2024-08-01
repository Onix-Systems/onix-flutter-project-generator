import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';

extension DataComponentsExtension on List<DataObjectComponent> {
  List<DataObjectComponent> distinct() {
    final copy = List<DataObjectComponent>.empty(growable: true);
    forEach(
      (e) {
        final exist = copy.firstWhereOrNull(
          (c) => c.name == e.name,
        );
        if (exist == null) {
          copy.add(e);
        }
      },
    );
    return copy;
  }
}
