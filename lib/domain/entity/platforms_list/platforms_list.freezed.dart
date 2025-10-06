// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'platforms_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlatformsList {
  bool get android;
  bool get ios;
  bool get web;
  bool get macos;
  bool get windows;
  bool get linux;

  /// Create a copy of PlatformsList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlatformsListCopyWith<PlatformsList> get copyWith =>
      _$PlatformsListCopyWithImpl<PlatformsList>(
          this as PlatformsList, _$identity);

  /// Serializes this PlatformsList to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlatformsList &&
            (identical(other.android, android) || other.android == android) &&
            (identical(other.ios, ios) || other.ios == ios) &&
            (identical(other.web, web) || other.web == web) &&
            (identical(other.macos, macos) || other.macos == macos) &&
            (identical(other.windows, windows) || other.windows == windows) &&
            (identical(other.linux, linux) || other.linux == linux));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, android, ios, web, macos, windows, linux);
}

/// @nodoc
abstract mixin class $PlatformsListCopyWith<$Res> {
  factory $PlatformsListCopyWith(
          PlatformsList value, $Res Function(PlatformsList) _then) =
      _$PlatformsListCopyWithImpl;
  @useResult
  $Res call(
      {bool android, bool ios, bool web, bool macos, bool windows, bool linux});
}

/// @nodoc
class _$PlatformsListCopyWithImpl<$Res>
    implements $PlatformsListCopyWith<$Res> {
  _$PlatformsListCopyWithImpl(this._self, this._then);

  final PlatformsList _self;
  final $Res Function(PlatformsList) _then;

  /// Create a copy of PlatformsList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? android = null,
    Object? ios = null,
    Object? web = null,
    Object? macos = null,
    Object? windows = null,
    Object? linux = null,
  }) {
    return _then(_self.copyWith(
      android: null == android
          ? _self.android
          : android // ignore: cast_nullable_to_non_nullable
              as bool,
      ios: null == ios
          ? _self.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as bool,
      web: null == web
          ? _self.web
          : web // ignore: cast_nullable_to_non_nullable
              as bool,
      macos: null == macos
          ? _self.macos
          : macos // ignore: cast_nullable_to_non_nullable
              as bool,
      windows: null == windows
          ? _self.windows
          : windows // ignore: cast_nullable_to_non_nullable
              as bool,
      linux: null == linux
          ? _self.linux
          : linux // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlatformsList].
extension PlatformsListPatterns on PlatformsList {
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
    TResult Function(_PlatformsList value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlatformsList() when $default != null:
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
    TResult Function(_PlatformsList value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlatformsList():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(_PlatformsList value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlatformsList() when $default != null:
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
    TResult Function(bool android, bool ios, bool web, bool macos, bool windows,
            bool linux)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlatformsList() when $default != null:
        return $default(_that.android, _that.ios, _that.web, _that.macos,
            _that.windows, _that.linux);
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
    TResult Function(bool android, bool ios, bool web, bool macos, bool windows,
            bool linux)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlatformsList():
        return $default(_that.android, _that.ios, _that.web, _that.macos,
            _that.windows, _that.linux);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(bool android, bool ios, bool web, bool macos,
            bool windows, bool linux)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlatformsList() when $default != null:
        return $default(_that.android, _that.ios, _that.web, _that.macos,
            _that.windows, _that.linux);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlatformsList extends PlatformsList {
  const _PlatformsList(
      {this.android = true,
      this.ios = true,
      this.web = false,
      this.macos = false,
      this.windows = false,
      this.linux = false})
      : super._();
  factory _PlatformsList.fromJson(Map<String, dynamic> json) =>
      _$PlatformsListFromJson(json);

  @override
  @JsonKey()
  final bool android;
  @override
  @JsonKey()
  final bool ios;
  @override
  @JsonKey()
  final bool web;
  @override
  @JsonKey()
  final bool macos;
  @override
  @JsonKey()
  final bool windows;
  @override
  @JsonKey()
  final bool linux;

  /// Create a copy of PlatformsList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlatformsListCopyWith<_PlatformsList> get copyWith =>
      __$PlatformsListCopyWithImpl<_PlatformsList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlatformsListToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlatformsList &&
            (identical(other.android, android) || other.android == android) &&
            (identical(other.ios, ios) || other.ios == ios) &&
            (identical(other.web, web) || other.web == web) &&
            (identical(other.macos, macos) || other.macos == macos) &&
            (identical(other.windows, windows) || other.windows == windows) &&
            (identical(other.linux, linux) || other.linux == linux));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, android, ios, web, macos, windows, linux);
}

/// @nodoc
abstract mixin class _$PlatformsListCopyWith<$Res>
    implements $PlatformsListCopyWith<$Res> {
  factory _$PlatformsListCopyWith(
          _PlatformsList value, $Res Function(_PlatformsList) _then) =
      __$PlatformsListCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool android, bool ios, bool web, bool macos, bool windows, bool linux});
}

/// @nodoc
class __$PlatformsListCopyWithImpl<$Res>
    implements _$PlatformsListCopyWith<$Res> {
  __$PlatformsListCopyWithImpl(this._self, this._then);

  final _PlatformsList _self;
  final $Res Function(_PlatformsList) _then;

  /// Create a copy of PlatformsList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? android = null,
    Object? ios = null,
    Object? web = null,
    Object? macos = null,
    Object? windows = null,
    Object? linux = null,
  }) {
    return _then(_PlatformsList(
      android: null == android
          ? _self.android
          : android // ignore: cast_nullable_to_non_nullable
              as bool,
      ios: null == ios
          ? _self.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as bool,
      web: null == web
          ? _self.web
          : web // ignore: cast_nullable_to_non_nullable
              as bool,
      macos: null == macos
          ? _self.macos
          : macos // ignore: cast_nullable_to_non_nullable
              as bool,
      windows: null == windows
          ? _self.windows
          : windows // ignore: cast_nullable_to_non_nullable
              as bool,
      linux: null == linux
          ? _self.linux
          : linux // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
