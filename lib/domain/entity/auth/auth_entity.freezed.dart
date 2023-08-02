// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationEntity {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticationEntityCopyWith<AuthenticationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEntityCopyWith<$Res> {
  factory $AuthenticationEntityCopyWith(AuthenticationEntity value,
          $Res Function(AuthenticationEntity) then) =
      _$AuthenticationEntityCopyWithImpl<$Res, AuthenticationEntity>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$AuthenticationEntityCopyWithImpl<$Res,
        $Val extends AuthenticationEntity>
    implements $AuthenticationEntityCopyWith<$Res> {
  _$AuthenticationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthenticationEntityCopyWith<$Res>
    implements $AuthenticationEntityCopyWith<$Res> {
  factory _$$_AuthenticationEntityCopyWith(_$_AuthenticationEntity value,
          $Res Function(_$_AuthenticationEntity) then) =
      __$$_AuthenticationEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$_AuthenticationEntityCopyWithImpl<$Res>
    extends _$AuthenticationEntityCopyWithImpl<$Res, _$_AuthenticationEntity>
    implements _$$_AuthenticationEntityCopyWith<$Res> {
  __$$_AuthenticationEntityCopyWithImpl(_$_AuthenticationEntity _value,
      $Res Function(_$_AuthenticationEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$_AuthenticationEntity(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthenticationEntity implements _AuthenticationEntity {
  const _$_AuthenticationEntity(
      {required this.accessToken, required this.refreshToken});

  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'AuthenticationEntity(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationEntity &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticationEntityCopyWith<_$_AuthenticationEntity> get copyWith =>
      __$$_AuthenticationEntityCopyWithImpl<_$_AuthenticationEntity>(
          this, _$identity);
}

abstract class _AuthenticationEntity implements AuthenticationEntity {
  const factory _AuthenticationEntity(
      {required final String accessToken,
      required final String refreshToken}) = _$_AuthenticationEntity;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticationEntityCopyWith<_$_AuthenticationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
