import 'dart:convert';
import 'dart:io';

import 'package:onix_flutter_bricks/core/arch/domain/entity/result/result.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

class FetchSwaggerDataUseCase {
  final SwaggerRepository _swaggerRepository;

  const FetchSwaggerDataUseCase(this._swaggerRepository);

  Future<Result<Components?>> call({
    required String url,
  }) async {
    return _swaggerRepository.fetchSwaggerData(url: url);
  }
}
