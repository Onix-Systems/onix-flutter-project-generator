import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

abstract interface class SwaggerRepository {
  Components get components;

  Future<Result<Components>> fetchSwaggerData({
    required String url,
    required ArchType arch,
  });

  void clearComponents();

  Result<OperationStatus> addSource({
    required String sourceName,
    required ArchType arch,
  });

  Result<OperationStatus> removeSource(String sourceName);

  Result<OperationStatus> editSourceName({
    required String sourceName,
    required String newName,
  });

  Result<OperationStatus> addSourceRequest({
    required String sourceName,
    required RequestComponent requestComponent,
  });

  Result<OperationStatus> editSourceRequest({
    required String sourceName,
    required RequestComponent oldComponent,
    required RequestComponent requestComponent,
  });

  Result<OperationStatus> deleteSourceRequest({
    required String sourceName,
    required RequestComponent requestComponent,
  });

  bool isComponentExists(String dataObjectName);

  Result<OperationStatus> addComponent(
    Component dataObject,
  );

  Result<Component> getComponentByName({
    required String componentName,
  });

  Result<OperationStatus> editComponent({
    required String oldName,
    required Component component,
  });

  Result<OperationStatus> deleteComponent(
    Component component,
  );
}
