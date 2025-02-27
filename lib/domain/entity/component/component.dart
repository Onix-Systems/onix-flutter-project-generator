import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';

abstract class Component {
  final String name;
  final bool fromSwagger;

  Component({
    required this.name,
    required this.fromSwagger,
  });

  String getString({int level = 1});

  bool equals(Component component) {
    if (component.runtimeType != runtimeType) {
      return false;
    }

    if (component is EnumParamComponent && this is EnumParamComponent) {
      return component.type == (this as EnumParamComponent).type;
    }

    if (component is DataObjectComponent && this is DataObjectComponent) {
      return component.fileReference ==
          (this as DataObjectComponent).fileReference;
    }

    return false;
  }
}
