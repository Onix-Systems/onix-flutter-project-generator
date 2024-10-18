import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';

extension VariiableSortExtenson on List<DataVariableComponent> {
  List<DataVariableComponent> sortByRequired() {
    final copy = List<DataVariableComponent>.from(
      this,
    )..sort(
        (a, b) {
          if (b.isRequired) {
            return 1;
          }
          return -1;
        },
      );
    return copy;
  }
}
