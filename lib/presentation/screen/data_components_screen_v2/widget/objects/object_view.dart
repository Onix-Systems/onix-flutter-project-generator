import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';

class ObjectView {
  final String name;
  final List<DataVariableComponent> variables;
  String variablesString = '';

  ObjectView({required this.name, required this.variables});

  void collectVariables(Components components) {
    final result = <String>[];

    for (final variable in variables) {
      final ref = variable.type.getSwaggerObjectReference();
      if (ref != null) {
        Component? object = components.dataObjects
            .firstWhereOrNull((element) => element.name == ref.reference);

        object ??= components.enums
            .firstWhereOrNull((element) => element.name == ref.reference);

        if (object != null) {
          if (variable.type is SwaggerArray) {
            result
                .add('${variable.type} ${variable.name}: [\n   ${object.name} {'
                    '\n${object.getString(level: 3)}\n   }\n];');
          } else {
            result.add(
              '${variable.type} ${variable.name}:\n${object.getString()}',
            );
          }
        }
      } else {
        result.add('${variable.type} ${variable.name};');
      }
    }

    variablesString = result.join('\n');
  }
}
