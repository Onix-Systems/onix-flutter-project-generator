// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BranchConfig _$BranchConfigFromJson(Map<String, dynamic> json) {
  return _BranchConfig.fromJson(json);
}

/// @nodoc
mixin _$BranchConfig {
  String get branch => throw _privateConstructorUsedError;
  String get localVersion => throw _privateConstructorUsedError;
  String get remoteVersion => throw _privateConstructorUsedError;

  /// Serializes this BranchConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BranchConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BranchConfigCopyWith<BranchConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchConfigCopyWith<$Res> {
  factory $BranchConfigCopyWith(
          BranchConfig value, $Res Function(BranchConfig) then) =
      _$BranchConfigCopyWithImpl<$Res, BranchConfig>;
  @useResult
  $Res call({String branch, String localVersion, String remoteVersion});
}

/// @nodoc
class _$BranchConfigCopyWithImpl<$Res, $Val extends BranchConfig>
    implements $BranchConfigCopyWith<$Res> {
  _$BranchConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BranchConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branch = null,
    Object? localVersion = null,
    Object? remoteVersion = null,
  }) {
    return _then(_value.copyWith(
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String,
      localVersion: null == localVersion
          ? _value.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as String,
      remoteVersion: null == remoteVersion
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BranchConfigImplCopyWith<$Res>
    implements $BranchConfigCopyWith<$Res> {
  factory _$$BranchConfigImplCopyWith(
          _$BranchConfigImpl value, $Res Function(_$BranchConfigImpl) then) =
      __$$BranchConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String branch, String localVersion, String remoteVersion});
}

/// @nodoc
class __$$BranchConfigImplCopyWithImpl<$Res>
    extends _$BranchConfigCopyWithImpl<$Res, _$BranchConfigImpl>
    implements _$$BranchConfigImplCopyWith<$Res> {
  __$$BranchConfigImplCopyWithImpl(
      _$BranchConfigImpl _value, $Res Function(_$BranchConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branch = null,
    Object? localVersion = null,
    Object? remoteVersion = null,
  }) {
    return _then(_$BranchConfigImpl(
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String,
      localVersion: null == localVersion
          ? _value.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as String,
      remoteVersion: null == remoteVersion
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BranchConfigImpl implements _BranchConfig {
  const _$BranchConfigImpl(
      {this.branch = 'main', this.localVersion = '', this.remoteVersion = ''});

  factory _$BranchConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchConfigImplFromJson(json);

  @override
  @JsonKey()
  final String branch;
  @override
  @JsonKey()
  final String localVersion;
  @override
  @JsonKey()
  final String remoteVersion;

  @override
  String toString() {
    return 'BranchConfig(branch: $branch, localVersion: $localVersion, remoteVersion: $remoteVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchConfigImpl &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.localVersion, localVersion) ||
                other.localVersion == localVersion) &&
            (identical(other.remoteVersion, remoteVersion) ||
                other.remoteVersion == remoteVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, branch, localVersion, remoteVersion);

  /// Create a copy of BranchConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchConfigImplCopyWith<_$BranchConfigImpl> get copyWith =>
      __$$BranchConfigImplCopyWithImpl<_$BranchConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchConfigImplToJson(
      this,
    );
  }
}

abstract class _BranchConfig implements BranchConfig {
  const factory _BranchConfig(
      {final String branch,
      final String localVersion,
      final String remoteVersion}) = _$BranchConfigImpl;

  factory _BranchConfig.fromJson(Map<String, dynamic> json) =
      _$BranchConfigImpl.fromJson;

  @override
  String get branch;
  @override
  String get localVersion;
  @override
  String get remoteVersion;

  /// Create a copy of BranchConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BranchConfigImplCopyWith<_$BranchConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
