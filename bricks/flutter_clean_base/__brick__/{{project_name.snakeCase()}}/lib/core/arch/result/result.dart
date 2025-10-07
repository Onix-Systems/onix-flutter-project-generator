import 'package:{{project_name}}/core/arch/domain/entity/common/operation_status.dart';

abstract class Result<T> {
  const Result();

  factory Result.ok(T data) => Ok<T>(data);

  factory Result.error({required Exception error}) => Error<T>(error);

  factory Result.status() => const Status() as Result<T>;

  bool get isOk => this is Ok<T> || this is Status;

  bool get isError => this is Error<T>;

  ///WARNING. ALWAYS CHECK isOk == true before call
  T get data => (this as Ok<T>).data;

  ///WARNING. ALWAYS CHECK isOk == true before call
  Ok<T> get asOk => this as Ok<T>;

  ///WARNING. ALWAYS CHECK isError == true before call
  Error<T> get asError => this as Error<T>;

  T? get dataOrNull => isOk ? (this as Ok<T>).data : null;

  T getDataOr(T defaultValue) => isOk ? (this as Ok<T>).data : defaultValue;

  Exception? get errorOrNull => isError ? (this as Error<T>).error : null;

  Result<U> map<U>(U Function(T) mapper) {
    return fold(
      (data) => Result.ok(mapper(data)),
      (error) => Result.error(error: error.error),
    );
  }

  Result<U> flatMap<U>(Result<U> Function(T) mapper) {
    return fold(
      (data) => mapper(data),
      (error) => Result.error(error: error.error),
    );
  }

  R when<R>({
    required R Function(T data) ok,
    required R Function(Exception error) error,
  }) {
    return fold(ok, (err) => error(err.error));
  }

  B fold<B>(B Function(T data) onOk, B Function(Error<T> error) onError);
}

final class Ok<T> extends Result<T> {
  final T _data;

  @override
  T get data => _data;

  Ok(T data) : _data = data;

  @override
  String toString() => 'Result<$T>.ok($_data)';

  @override
  B fold<B>(B Function(T data) onOk, B Function(Error<T> error) onError) {
    return onOk(_data);
  }
}

final class Error<T> extends Result<T> {
  final Exception _error;

  Exception get error => _error;

  Error(Exception error) : _error = error;

  @override
  String toString() => 'Result<$T>.error($error)';

  @override
  B fold<B>(B Function(T data) onOk, B Function(Error<T> error) onError) {
    return onError(this);
  }
}

final class Status extends Result<OperationStatus> {
  const Status();

  @override
  B fold<B>(
    Function(OperationStatus data) onOk,
    Function(Error<OperationStatus> error) onError,
  ) {
    return onOk(const OperationStatus());
  }
}
