import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:onix_flutter_bricks/core/arch/domain/entity/failure/failure.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  bool get success => this is _ResultSuccess<T>;

  bool get isError => this is ResultError;

  ///WARNING. ALWAYS CHECK success == true before call
  T get data => (this as _ResultSuccess<T>).data;

  ///WARNING. ALWAYS CHECK isError == true before call
  ResultError get error => this as ResultError;

  const Result._();

  const factory Result.success(T data) = _ResultSuccess;

  const factory Result.error({
    required Failure failure,
  }) = ResultError;
}
