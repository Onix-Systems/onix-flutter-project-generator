// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'default_api_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DefaultApiError _$DefaultApiErrorFromJson(Map<String, dynamic> json) {
  return _DefaultApiError.fromJson(json);
}

/// @nodoc
mixin _$DefaultApiError {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  /// Serializes this DefaultApiError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DefaultApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DefaultApiErrorCopyWith<DefaultApiError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultApiErrorCopyWith<$Res> {
  factory $DefaultApiErrorCopyWith(
          DefaultApiError value, $Res Function(DefaultApiError) then) =
      _$DefaultApiErrorCopyWithImpl<$Res, DefaultApiError>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$DefaultApiErrorCopyWithImpl<$Res, $Val extends DefaultApiError>
    implements $DefaultApiErrorCopyWith<$Res> {
  _$DefaultApiErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DefaultApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefaultApiErrorImplCopyWith<$Res>
    implements $DefaultApiErrorCopyWith<$Res> {
  factory _$$DefaultApiErrorImplCopyWith(_$DefaultApiErrorImpl value,
          $Res Function(_$DefaultApiErrorImpl) then) =
      __$$DefaultApiErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$DefaultApiErrorImplCopyWithImpl<$Res>
    extends _$DefaultApiErrorCopyWithImpl<$Res, _$DefaultApiErrorImpl>
    implements _$$DefaultApiErrorImplCopyWith<$Res> {
  __$$DefaultApiErrorImplCopyWithImpl(
      _$DefaultApiErrorImpl _value, $Res Function(_$DefaultApiErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of DefaultApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$DefaultApiErrorImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DefaultApiErrorImpl implements _DefaultApiError {
  const _$DefaultApiErrorImpl({required this.name, required this.code});

  factory _$DefaultApiErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefaultApiErrorImplFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'DefaultApiError(name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefaultApiErrorImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  /// Create a copy of DefaultApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DefaultApiErrorImplCopyWith<_$DefaultApiErrorImpl> get copyWith =>
      __$$DefaultApiErrorImplCopyWithImpl<_$DefaultApiErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefaultApiErrorImplToJson(
      this,
    );
  }
}

abstract class _DefaultApiError implements DefaultApiError {
  const factory _DefaultApiError(
      {required final String name,
      required final String code}) = _$DefaultApiErrorImpl;

  factory _DefaultApiError.fromJson(Map<String, dynamic> json) =
      _$DefaultApiErrorImpl.fromJson;

  @override
  String get name;
  @override
  String get code;

  /// Create a copy of DefaultApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DefaultApiErrorImplCopyWith<_$DefaultApiErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
