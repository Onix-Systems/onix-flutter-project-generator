// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BranchConfig {
  String get branch;
  String get localVersion;
  String get remoteVersion;

  /// Create a copy of BranchConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BranchConfigCopyWith<BranchConfig> get copyWith =>
      _$BranchConfigCopyWithImpl<BranchConfig>(
          this as BranchConfig, _$identity);

  /// Serializes this BranchConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BranchConfig &&
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

  @override
  String toString() {
    return 'BranchConfig(branch: $branch, localVersion: $localVersion, remoteVersion: $remoteVersion)';
  }
}

/// @nodoc
abstract mixin class $BranchConfigCopyWith<$Res> {
  factory $BranchConfigCopyWith(
          BranchConfig value, $Res Function(BranchConfig) _then) =
      _$BranchConfigCopyWithImpl;
  @useResult
  $Res call({String branch, String localVersion, String remoteVersion});
}

/// @nodoc
class _$BranchConfigCopyWithImpl<$Res> implements $BranchConfigCopyWith<$Res> {
  _$BranchConfigCopyWithImpl(this._self, this._then);

  final BranchConfig _self;
  final $Res Function(BranchConfig) _then;

  /// Create a copy of BranchConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branch = null,
    Object? localVersion = null,
    Object? remoteVersion = null,
  }) {
    return _then(_self.copyWith(
      branch: null == branch
          ? _self.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String,
      localVersion: null == localVersion
          ? _self.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as String,
      remoteVersion: null == remoteVersion
          ? _self.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [BranchConfig].
extension BranchConfigPatterns on BranchConfig {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BranchConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BranchConfig() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BranchConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BranchConfig():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BranchConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BranchConfig() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String branch, String localVersion, String remoteVersion)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BranchConfig() when $default != null:
        return $default(_that.branch, _that.localVersion, _that.remoteVersion);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String branch, String localVersion, String remoteVersion)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BranchConfig():
        return $default(_that.branch, _that.localVersion, _that.remoteVersion);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String branch, String localVersion, String remoteVersion)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BranchConfig() when $default != null:
        return $default(_that.branch, _that.localVersion, _that.remoteVersion);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BranchConfig implements BranchConfig {
  const _BranchConfig(
      {this.branch = 'main', this.localVersion = '', this.remoteVersion = ''});
  factory _BranchConfig.fromJson(Map<String, dynamic> json) =>
      _$BranchConfigFromJson(json);

  @override
  @JsonKey()
  final String branch;
  @override
  @JsonKey()
  final String localVersion;
  @override
  @JsonKey()
  final String remoteVersion;

  /// Create a copy of BranchConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BranchConfigCopyWith<_BranchConfig> get copyWith =>
      __$BranchConfigCopyWithImpl<_BranchConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BranchConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BranchConfig &&
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

  @override
  String toString() {
    return 'BranchConfig(branch: $branch, localVersion: $localVersion, remoteVersion: $remoteVersion)';
  }
}

/// @nodoc
abstract mixin class _$BranchConfigCopyWith<$Res>
    implements $BranchConfigCopyWith<$Res> {
  factory _$BranchConfigCopyWith(
          _BranchConfig value, $Res Function(_BranchConfig) _then) =
      __$BranchConfigCopyWithImpl;
  @override
  @useResult
  $Res call({String branch, String localVersion, String remoteVersion});
}

/// @nodoc
class __$BranchConfigCopyWithImpl<$Res>
    implements _$BranchConfigCopyWith<$Res> {
  __$BranchConfigCopyWithImpl(this._self, this._then);

  final _BranchConfig _self;
  final $Res Function(_BranchConfig) _then;

  /// Create a copy of BranchConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? branch = null,
    Object? localVersion = null,
    Object? remoteVersion = null,
  }) {
    return _then(_BranchConfig(
      branch: null == branch
          ? _self.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String,
      localVersion: null == localVersion
          ? _self.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as String,
      remoteVersion: null == remoteVersion
          ? _self.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
