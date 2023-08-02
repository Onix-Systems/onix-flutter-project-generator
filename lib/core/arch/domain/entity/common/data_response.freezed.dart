// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? errorObject) undefinedError,
    required TResult Function(dynamic error) apiError,
    required TResult Function() notConnected,
    required TResult Function() unauthorized,
    required TResult Function() tooManyRequests,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object? errorObject)? undefinedError,
    TResult? Function(dynamic error)? apiError,
    TResult? Function()? notConnected,
    TResult? Function()? unauthorized,
    TResult? Function()? tooManyRequests,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? errorObject)? undefinedError,
    TResult Function(dynamic error)? apiError,
    TResult Function()? notConnected,
    TResult Function()? unauthorized,
    TResult Function()? tooManyRequests,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataResponseSuccess<T> value) success,
    required TResult Function(_UndefinedError<T> value) undefinedError,
    required TResult Function(_ApiError<T> value) apiError,
    required TResult Function(_NoInternetConnection<T> value) notConnected,
    required TResult Function(_Unauthorized<T> value) unauthorized,
    required TResult Function(_TooManyRequests<T> value) tooManyRequests,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataResponseSuccess<T> value)? success,
    TResult? Function(_UndefinedError<T> value)? undefinedError,
    TResult? Function(_ApiError<T> value)? apiError,
    TResult? Function(_NoInternetConnection<T> value)? notConnected,
    TResult? Function(_Unauthorized<T> value)? unauthorized,
    TResult? Function(_TooManyRequests<T> value)? tooManyRequests,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataResponseSuccess<T> value)? success,
    TResult Function(_UndefinedError<T> value)? undefinedError,
    TResult Function(_ApiError<T> value)? apiError,
    TResult Function(_NoInternetConnection<T> value)? notConnected,
    TResult Function(_Unauthorized<T> value)? unauthorized,
    TResult Function(_TooManyRequests<T> value)? tooManyRequests,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataResponseCopyWith<T, $Res> {
  factory $DataResponseCopyWith(
          DataResponse<T> value, $Res Function(DataResponse<T>) then) =
      _$DataResponseCopyWithImpl<T, $Res, DataResponse<T>>;
}

/// @nodoc
class _$DataResponseCopyWithImpl<T, $Res, $Val extends DataResponse<T>>
    implements $DataResponseCopyWith<T, $Res> {
  _$DataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_DataResponseSuccessCopyWith<T, $Res> {
  factory _$$_DataResponseSuccessCopyWith(_$_DataResponseSuccess<T> value,
          $Res Function(_$_DataResponseSuccess<T>) then) =
      __$$_DataResponseSuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$_DataResponseSuccessCopyWithImpl<T, $Res>
    extends _$DataResponseCopyWithImpl<T, $Res, _$_DataResponseSuccess<T>>
    implements _$$_DataResponseSuccessCopyWith<T, $Res> {
  __$$_DataResponseSuccessCopyWithImpl(_$_DataResponseSuccess<T> _value,
      $Res Function(_$_DataResponseSuccess<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_DataResponseSuccess<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_DataResponseSuccess<T> extends _DataResponseSuccess<T> {
  const _$_DataResponseSuccess(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'DataResponse<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataResponseSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataResponseSuccessCopyWith<T, _$_DataResponseSuccess<T>> get copyWith =>
      __$$_DataResponseSuccessCopyWithImpl<T, _$_DataResponseSuccess<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? errorObject) undefinedError,
    required TResult Function(dynamic error) apiError,
    required TResult Function() notConnected,
    required TResult Function() unauthorized,
    required TResult Function() tooManyRequests,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object? errorObject)? undefinedError,
    TResult? Function(dynamic error)? apiError,
    TResult? Function()? notConnected,
    TResult? Function()? unauthorized,
    TResult? Function()? tooManyRequests,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? errorObject)? undefinedError,
    TResult Function(dynamic error)? apiError,
    TResult Function()? notConnected,
    TResult Function()? unauthorized,
    TResult Function()? tooManyRequests,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataResponseSuccess<T> value) success,
    required TResult Function(_UndefinedError<T> value) undefinedError,
    required TResult Function(_ApiError<T> value) apiError,
    required TResult Function(_NoInternetConnection<T> value) notConnected,
    required TResult Function(_Unauthorized<T> value) unauthorized,
    required TResult Function(_TooManyRequests<T> value) tooManyRequests,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataResponseSuccess<T> value)? success,
    TResult? Function(_UndefinedError<T> value)? undefinedError,
    TResult? Function(_ApiError<T> value)? apiError,
    TResult? Function(_NoInternetConnection<T> value)? notConnected,
    TResult? Function(_Unauthorized<T> value)? unauthorized,
    TResult? Function(_TooManyRequests<T> value)? tooManyRequests,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataResponseSuccess<T> value)? success,
    TResult Function(_UndefinedError<T> value)? undefinedError,
    TResult Function(_ApiError<T> value)? apiError,
    TResult Function(_NoInternetConnection<T> value)? notConnected,
    TResult Function(_Unauthorized<T> value)? unauthorized,
    TResult Function(_TooManyRequests<T> value)? tooManyRequests,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _DataResponseSuccess<T> extends DataResponse<T> {
  const factory _DataResponseSuccess(final T data) = _$_DataResponseSuccess<T>;
  const _DataResponseSuccess._() : super._();

  T get data;
  @JsonKey(ignore: true)
  _$$_DataResponseSuccessCopyWith<T, _$_DataResponseSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UndefinedErrorCopyWith<T, $Res> {
  factory _$$_UndefinedErrorCopyWith(_$_UndefinedError<T> value,
          $Res Function(_$_UndefinedError<T>) then) =
      __$$_UndefinedErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Object? errorObject});
}

/// @nodoc
class __$$_UndefinedErrorCopyWithImpl<T, $Res>
    extends _$DataResponseCopyWithImpl<T, $Res, _$_UndefinedError<T>>
    implements _$$_UndefinedErrorCopyWith<T, $Res> {
  __$$_UndefinedErrorCopyWithImpl(
      _$_UndefinedError<T> _value, $Res Function(_$_UndefinedError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorObject = freezed,
  }) {
    return _then(_$_UndefinedError<T>(
      freezed == errorObject ? _value.errorObject : errorObject,
    ));
  }
}

/// @nodoc

class _$_UndefinedError<T> extends _UndefinedError<T> {
  const _$_UndefinedError(this.errorObject) : super._();

  @override
  final Object? errorObject;

  @override
  String toString() {
    return 'DataResponse<$T>.undefinedError(errorObject: $errorObject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UndefinedError<T> &&
            const DeepCollectionEquality()
                .equals(other.errorObject, errorObject));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorObject));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UndefinedErrorCopyWith<T, _$_UndefinedError<T>> get copyWith =>
      __$$_UndefinedErrorCopyWithImpl<T, _$_UndefinedError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? errorObject) undefinedError,
    required TResult Function(dynamic error) apiError,
    required TResult Function() notConnected,
    required TResult Function() unauthorized,
    required TResult Function() tooManyRequests,
  }) {
    return undefinedError(errorObject);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object? errorObject)? undefinedError,
    TResult? Function(dynamic error)? apiError,
    TResult? Function()? notConnected,
    TResult? Function()? unauthorized,
    TResult? Function()? tooManyRequests,
  }) {
    return undefinedError?.call(errorObject);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? errorObject)? undefinedError,
    TResult Function(dynamic error)? apiError,
    TResult Function()? notConnected,
    TResult Function()? unauthorized,
    TResult Function()? tooManyRequests,
    required TResult orElse(),
  }) {
    if (undefinedError != null) {
      return undefinedError(errorObject);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataResponseSuccess<T> value) success,
    required TResult Function(_UndefinedError<T> value) undefinedError,
    required TResult Function(_ApiError<T> value) apiError,
    required TResult Function(_NoInternetConnection<T> value) notConnected,
    required TResult Function(_Unauthorized<T> value) unauthorized,
    required TResult Function(_TooManyRequests<T> value) tooManyRequests,
  }) {
    return undefinedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataResponseSuccess<T> value)? success,
    TResult? Function(_UndefinedError<T> value)? undefinedError,
    TResult? Function(_ApiError<T> value)? apiError,
    TResult? Function(_NoInternetConnection<T> value)? notConnected,
    TResult? Function(_Unauthorized<T> value)? unauthorized,
    TResult? Function(_TooManyRequests<T> value)? tooManyRequests,
  }) {
    return undefinedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataResponseSuccess<T> value)? success,
    TResult Function(_UndefinedError<T> value)? undefinedError,
    TResult Function(_ApiError<T> value)? apiError,
    TResult Function(_NoInternetConnection<T> value)? notConnected,
    TResult Function(_Unauthorized<T> value)? unauthorized,
    TResult Function(_TooManyRequests<T> value)? tooManyRequests,
    required TResult orElse(),
  }) {
    if (undefinedError != null) {
      return undefinedError(this);
    }
    return orElse();
  }
}

abstract class _UndefinedError<T> extends DataResponse<T> {
  const factory _UndefinedError(final Object? errorObject) =
      _$_UndefinedError<T>;
  const _UndefinedError._() : super._();

  Object? get errorObject;
  @JsonKey(ignore: true)
  _$$_UndefinedErrorCopyWith<T, _$_UndefinedError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ApiErrorCopyWith<T, $Res> {
  factory _$$_ApiErrorCopyWith(
          _$_ApiError<T> value, $Res Function(_$_ApiError<T>) then) =
      __$$_ApiErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$_ApiErrorCopyWithImpl<T, $Res>
    extends _$DataResponseCopyWithImpl<T, $Res, _$_ApiError<T>>
    implements _$$_ApiErrorCopyWith<T, $Res> {
  __$$_ApiErrorCopyWithImpl(
      _$_ApiError<T> _value, $Res Function(_$_ApiError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_ApiError<T>(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_ApiError<T> extends _ApiError<T> {
  const _$_ApiError(this.error) : super._();

  @override
  final dynamic error;

  @override
  String toString() {
    return 'DataResponse<$T>.apiError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiError<T> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiErrorCopyWith<T, _$_ApiError<T>> get copyWith =>
      __$$_ApiErrorCopyWithImpl<T, _$_ApiError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? errorObject) undefinedError,
    required TResult Function(dynamic error) apiError,
    required TResult Function() notConnected,
    required TResult Function() unauthorized,
    required TResult Function() tooManyRequests,
  }) {
    return apiError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object? errorObject)? undefinedError,
    TResult? Function(dynamic error)? apiError,
    TResult? Function()? notConnected,
    TResult? Function()? unauthorized,
    TResult? Function()? tooManyRequests,
  }) {
    return apiError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? errorObject)? undefinedError,
    TResult Function(dynamic error)? apiError,
    TResult Function()? notConnected,
    TResult Function()? unauthorized,
    TResult Function()? tooManyRequests,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataResponseSuccess<T> value) success,
    required TResult Function(_UndefinedError<T> value) undefinedError,
    required TResult Function(_ApiError<T> value) apiError,
    required TResult Function(_NoInternetConnection<T> value) notConnected,
    required TResult Function(_Unauthorized<T> value) unauthorized,
    required TResult Function(_TooManyRequests<T> value) tooManyRequests,
  }) {
    return apiError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataResponseSuccess<T> value)? success,
    TResult? Function(_UndefinedError<T> value)? undefinedError,
    TResult? Function(_ApiError<T> value)? apiError,
    TResult? Function(_NoInternetConnection<T> value)? notConnected,
    TResult? Function(_Unauthorized<T> value)? unauthorized,
    TResult? Function(_TooManyRequests<T> value)? tooManyRequests,
  }) {
    return apiError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataResponseSuccess<T> value)? success,
    TResult Function(_UndefinedError<T> value)? undefinedError,
    TResult Function(_ApiError<T> value)? apiError,
    TResult Function(_NoInternetConnection<T> value)? notConnected,
    TResult Function(_Unauthorized<T> value)? unauthorized,
    TResult Function(_TooManyRequests<T> value)? tooManyRequests,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(this);
    }
    return orElse();
  }
}

abstract class _ApiError<T> extends DataResponse<T> {
  const factory _ApiError(final dynamic error) = _$_ApiError<T>;
  const _ApiError._() : super._();

  dynamic get error;
  @JsonKey(ignore: true)
  _$$_ApiErrorCopyWith<T, _$_ApiError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NoInternetConnectionCopyWith<T, $Res> {
  factory _$$_NoInternetConnectionCopyWith(_$_NoInternetConnection<T> value,
          $Res Function(_$_NoInternetConnection<T>) then) =
      __$$_NoInternetConnectionCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_NoInternetConnectionCopyWithImpl<T, $Res>
    extends _$DataResponseCopyWithImpl<T, $Res, _$_NoInternetConnection<T>>
    implements _$$_NoInternetConnectionCopyWith<T, $Res> {
  __$$_NoInternetConnectionCopyWithImpl(_$_NoInternetConnection<T> _value,
      $Res Function(_$_NoInternetConnection<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NoInternetConnection<T> extends _NoInternetConnection<T> {
  const _$_NoInternetConnection() : super._();

  @override
  String toString() {
    return 'DataResponse<$T>.notConnected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoInternetConnection<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? errorObject) undefinedError,
    required TResult Function(dynamic error) apiError,
    required TResult Function() notConnected,
    required TResult Function() unauthorized,
    required TResult Function() tooManyRequests,
  }) {
    return notConnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object? errorObject)? undefinedError,
    TResult? Function(dynamic error)? apiError,
    TResult? Function()? notConnected,
    TResult? Function()? unauthorized,
    TResult? Function()? tooManyRequests,
  }) {
    return notConnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? errorObject)? undefinedError,
    TResult Function(dynamic error)? apiError,
    TResult Function()? notConnected,
    TResult Function()? unauthorized,
    TResult Function()? tooManyRequests,
    required TResult orElse(),
  }) {
    if (notConnected != null) {
      return notConnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataResponseSuccess<T> value) success,
    required TResult Function(_UndefinedError<T> value) undefinedError,
    required TResult Function(_ApiError<T> value) apiError,
    required TResult Function(_NoInternetConnection<T> value) notConnected,
    required TResult Function(_Unauthorized<T> value) unauthorized,
    required TResult Function(_TooManyRequests<T> value) tooManyRequests,
  }) {
    return notConnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataResponseSuccess<T> value)? success,
    TResult? Function(_UndefinedError<T> value)? undefinedError,
    TResult? Function(_ApiError<T> value)? apiError,
    TResult? Function(_NoInternetConnection<T> value)? notConnected,
    TResult? Function(_Unauthorized<T> value)? unauthorized,
    TResult? Function(_TooManyRequests<T> value)? tooManyRequests,
  }) {
    return notConnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataResponseSuccess<T> value)? success,
    TResult Function(_UndefinedError<T> value)? undefinedError,
    TResult Function(_ApiError<T> value)? apiError,
    TResult Function(_NoInternetConnection<T> value)? notConnected,
    TResult Function(_Unauthorized<T> value)? unauthorized,
    TResult Function(_TooManyRequests<T> value)? tooManyRequests,
    required TResult orElse(),
  }) {
    if (notConnected != null) {
      return notConnected(this);
    }
    return orElse();
  }
}

abstract class _NoInternetConnection<T> extends DataResponse<T> {
  const factory _NoInternetConnection() = _$_NoInternetConnection<T>;
  const _NoInternetConnection._() : super._();
}

/// @nodoc
abstract class _$$_UnauthorizedCopyWith<T, $Res> {
  factory _$$_UnauthorizedCopyWith(
          _$_Unauthorized<T> value, $Res Function(_$_Unauthorized<T>) then) =
      __$$_UnauthorizedCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_UnauthorizedCopyWithImpl<T, $Res>
    extends _$DataResponseCopyWithImpl<T, $Res, _$_Unauthorized<T>>
    implements _$$_UnauthorizedCopyWith<T, $Res> {
  __$$_UnauthorizedCopyWithImpl(
      _$_Unauthorized<T> _value, $Res Function(_$_Unauthorized<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Unauthorized<T> extends _Unauthorized<T> {
  const _$_Unauthorized() : super._();

  @override
  String toString() {
    return 'DataResponse<$T>.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Unauthorized<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? errorObject) undefinedError,
    required TResult Function(dynamic error) apiError,
    required TResult Function() notConnected,
    required TResult Function() unauthorized,
    required TResult Function() tooManyRequests,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object? errorObject)? undefinedError,
    TResult? Function(dynamic error)? apiError,
    TResult? Function()? notConnected,
    TResult? Function()? unauthorized,
    TResult? Function()? tooManyRequests,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? errorObject)? undefinedError,
    TResult Function(dynamic error)? apiError,
    TResult Function()? notConnected,
    TResult Function()? unauthorized,
    TResult Function()? tooManyRequests,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataResponseSuccess<T> value) success,
    required TResult Function(_UndefinedError<T> value) undefinedError,
    required TResult Function(_ApiError<T> value) apiError,
    required TResult Function(_NoInternetConnection<T> value) notConnected,
    required TResult Function(_Unauthorized<T> value) unauthorized,
    required TResult Function(_TooManyRequests<T> value) tooManyRequests,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataResponseSuccess<T> value)? success,
    TResult? Function(_UndefinedError<T> value)? undefinedError,
    TResult? Function(_ApiError<T> value)? apiError,
    TResult? Function(_NoInternetConnection<T> value)? notConnected,
    TResult? Function(_Unauthorized<T> value)? unauthorized,
    TResult? Function(_TooManyRequests<T> value)? tooManyRequests,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataResponseSuccess<T> value)? success,
    TResult Function(_UndefinedError<T> value)? undefinedError,
    TResult Function(_ApiError<T> value)? apiError,
    TResult Function(_NoInternetConnection<T> value)? notConnected,
    TResult Function(_Unauthorized<T> value)? unauthorized,
    TResult Function(_TooManyRequests<T> value)? tooManyRequests,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized<T> extends DataResponse<T> {
  const factory _Unauthorized() = _$_Unauthorized<T>;
  const _Unauthorized._() : super._();
}

/// @nodoc
abstract class _$$_TooManyRequestsCopyWith<T, $Res> {
  factory _$$_TooManyRequestsCopyWith(_$_TooManyRequests<T> value,
          $Res Function(_$_TooManyRequests<T>) then) =
      __$$_TooManyRequestsCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_TooManyRequestsCopyWithImpl<T, $Res>
    extends _$DataResponseCopyWithImpl<T, $Res, _$_TooManyRequests<T>>
    implements _$$_TooManyRequestsCopyWith<T, $Res> {
  __$$_TooManyRequestsCopyWithImpl(
      _$_TooManyRequests<T> _value, $Res Function(_$_TooManyRequests<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_TooManyRequests<T> extends _TooManyRequests<T> {
  const _$_TooManyRequests() : super._();

  @override
  String toString() {
    return 'DataResponse<$T>.tooManyRequests()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_TooManyRequests<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? errorObject) undefinedError,
    required TResult Function(dynamic error) apiError,
    required TResult Function() notConnected,
    required TResult Function() unauthorized,
    required TResult Function() tooManyRequests,
  }) {
    return tooManyRequests();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(Object? errorObject)? undefinedError,
    TResult? Function(dynamic error)? apiError,
    TResult? Function()? notConnected,
    TResult? Function()? unauthorized,
    TResult? Function()? tooManyRequests,
  }) {
    return tooManyRequests?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? errorObject)? undefinedError,
    TResult Function(dynamic error)? apiError,
    TResult Function()? notConnected,
    TResult Function()? unauthorized,
    TResult Function()? tooManyRequests,
    required TResult orElse(),
  }) {
    if (tooManyRequests != null) {
      return tooManyRequests();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataResponseSuccess<T> value) success,
    required TResult Function(_UndefinedError<T> value) undefinedError,
    required TResult Function(_ApiError<T> value) apiError,
    required TResult Function(_NoInternetConnection<T> value) notConnected,
    required TResult Function(_Unauthorized<T> value) unauthorized,
    required TResult Function(_TooManyRequests<T> value) tooManyRequests,
  }) {
    return tooManyRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataResponseSuccess<T> value)? success,
    TResult? Function(_UndefinedError<T> value)? undefinedError,
    TResult? Function(_ApiError<T> value)? apiError,
    TResult? Function(_NoInternetConnection<T> value)? notConnected,
    TResult? Function(_Unauthorized<T> value)? unauthorized,
    TResult? Function(_TooManyRequests<T> value)? tooManyRequests,
  }) {
    return tooManyRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataResponseSuccess<T> value)? success,
    TResult Function(_UndefinedError<T> value)? undefinedError,
    TResult Function(_ApiError<T> value)? apiError,
    TResult Function(_NoInternetConnection<T> value)? notConnected,
    TResult Function(_Unauthorized<T> value)? unauthorized,
    TResult Function(_TooManyRequests<T> value)? tooManyRequests,
    required TResult orElse(),
  }) {
    if (tooManyRequests != null) {
      return tooManyRequests(this);
    }
    return orElse();
  }
}

abstract class _TooManyRequests<T> extends DataResponse<T> {
  const factory _TooManyRequests() = _$_TooManyRequests<T>;
  const _TooManyRequests._() : super._();
}
