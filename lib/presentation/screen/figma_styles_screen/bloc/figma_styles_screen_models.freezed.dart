// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'figma_styles_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FigmaStylesScreenEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FigmaStylesScreenEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FigmaStylesScreenEvent()';
  }
}

/// @nodoc
class $FigmaStylesScreenEventCopyWith<$Res> {
  $FigmaStylesScreenEventCopyWith(
      FigmaStylesScreenEvent _, $Res Function(FigmaStylesScreenEvent) __);
}

/// Adds pattern-matching-related methods to [FigmaStylesScreenEvent].
extension FigmaStylesScreenEventPatterns on FigmaStylesScreenEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FigmaStylesScreenEventInit value)? init,
    TResult Function(FigmaStylesScreenEventOnGetStyles value)? onGetStyles,
    TResult Function(FigmaStylesScreenEventOnClear value)? onClear,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FigmaStylesScreenEventInit() when init != null:
        return init(_that);
      case FigmaStylesScreenEventOnGetStyles() when onGetStyles != null:
        return onGetStyles(_that);
      case FigmaStylesScreenEventOnClear() when onClear != null:
        return onClear(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(FigmaStylesScreenEventInit value) init,
    required TResult Function(FigmaStylesScreenEventOnGetStyles value)
        onGetStyles,
    required TResult Function(FigmaStylesScreenEventOnClear value) onClear,
  }) {
    final _that = this;
    switch (_that) {
      case FigmaStylesScreenEventInit():
        return init(_that);
      case FigmaStylesScreenEventOnGetStyles():
        return onGetStyles(_that);
      case FigmaStylesScreenEventOnClear():
        return onClear(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FigmaStylesScreenEventInit value)? init,
    TResult? Function(FigmaStylesScreenEventOnGetStyles value)? onGetStyles,
    TResult? Function(FigmaStylesScreenEventOnClear value)? onClear,
  }) {
    final _that = this;
    switch (_that) {
      case FigmaStylesScreenEventInit() when init != null:
        return init(_that);
      case FigmaStylesScreenEventOnGetStyles() when onGetStyles != null:
        return onGetStyles(_that);
      case FigmaStylesScreenEventOnClear() when onClear != null:
        return onClear(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String figmaId, String token)? onGetStyles,
    TResult Function()? onClear,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FigmaStylesScreenEventInit() when init != null:
        return init();
      case FigmaStylesScreenEventOnGetStyles() when onGetStyles != null:
        return onGetStyles(_that.figmaId, _that.token);
      case FigmaStylesScreenEventOnClear() when onClear != null:
        return onClear();
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
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String figmaId, String token) onGetStyles,
    required TResult Function() onClear,
  }) {
    final _that = this;
    switch (_that) {
      case FigmaStylesScreenEventInit():
        return init();
      case FigmaStylesScreenEventOnGetStyles():
        return onGetStyles(_that.figmaId, _that.token);
      case FigmaStylesScreenEventOnClear():
        return onClear();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String figmaId, String token)? onGetStyles,
    TResult? Function()? onClear,
  }) {
    final _that = this;
    switch (_that) {
      case FigmaStylesScreenEventInit() when init != null:
        return init();
      case FigmaStylesScreenEventOnGetStyles() when onGetStyles != null:
        return onGetStyles(_that.figmaId, _that.token);
      case FigmaStylesScreenEventOnClear() when onClear != null:
        return onClear();
      case _:
        return null;
    }
  }
}

/// @nodoc

class FigmaStylesScreenEventInit implements FigmaStylesScreenEvent {
  const FigmaStylesScreenEventInit();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FigmaStylesScreenEventInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FigmaStylesScreenEvent.init()';
  }
}

/// @nodoc

class FigmaStylesScreenEventOnGetStyles implements FigmaStylesScreenEvent {
  const FigmaStylesScreenEventOnGetStyles(
      {required this.figmaId, required this.token});

  final String figmaId;
  final String token;

  /// Create a copy of FigmaStylesScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FigmaStylesScreenEventOnGetStylesCopyWith<FigmaStylesScreenEventOnGetStyles>
      get copyWith => _$FigmaStylesScreenEventOnGetStylesCopyWithImpl<
          FigmaStylesScreenEventOnGetStyles>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FigmaStylesScreenEventOnGetStyles &&
            (identical(other.figmaId, figmaId) || other.figmaId == figmaId) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, figmaId, token);

  @override
  String toString() {
    return 'FigmaStylesScreenEvent.onGetStyles(figmaId: $figmaId, token: $token)';
  }
}

/// @nodoc
abstract mixin class $FigmaStylesScreenEventOnGetStylesCopyWith<$Res>
    implements $FigmaStylesScreenEventCopyWith<$Res> {
  factory $FigmaStylesScreenEventOnGetStylesCopyWith(
          FigmaStylesScreenEventOnGetStyles value,
          $Res Function(FigmaStylesScreenEventOnGetStyles) _then) =
      _$FigmaStylesScreenEventOnGetStylesCopyWithImpl;
  @useResult
  $Res call({String figmaId, String token});
}

/// @nodoc
class _$FigmaStylesScreenEventOnGetStylesCopyWithImpl<$Res>
    implements $FigmaStylesScreenEventOnGetStylesCopyWith<$Res> {
  _$FigmaStylesScreenEventOnGetStylesCopyWithImpl(this._self, this._then);

  final FigmaStylesScreenEventOnGetStyles _self;
  final $Res Function(FigmaStylesScreenEventOnGetStyles) _then;

  /// Create a copy of FigmaStylesScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? figmaId = null,
    Object? token = null,
  }) {
    return _then(FigmaStylesScreenEventOnGetStyles(
      figmaId: null == figmaId
          ? _self.figmaId
          : figmaId // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class FigmaStylesScreenEventOnClear implements FigmaStylesScreenEvent {
  const FigmaStylesScreenEventOnClear();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FigmaStylesScreenEventOnClear);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FigmaStylesScreenEvent.onClear()';
  }
}

/// @nodoc
mixin _$FigmaStylesScreenSR {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FigmaStylesScreenSR);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FigmaStylesScreenSR()';
  }
}

/// @nodoc
class $FigmaStylesScreenSRCopyWith<$Res> {
  $FigmaStylesScreenSRCopyWith(
      FigmaStylesScreenSR _, $Res Function(FigmaStylesScreenSR) __);
}

/// Adds pattern-matching-related methods to [FigmaStylesScreenSR].
extension FigmaStylesScreenSRPatterns on FigmaStylesScreenSR {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFinished() when loadFinished != null:
        return loadFinished(_that);
      case _Error() when error != null:
        return error(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFinished():
        return loadFinished(_that);
      case _Error():
        return error(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFinished() when loadFinished != null:
        return loadFinished(_that);
      case _Error() when error != null:
        return error(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFinished() when loadFinished != null:
        return loadFinished();
      case _Error() when error != null:
        return error(_that.error);
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
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function(String error) error,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFinished():
        return loadFinished();
      case _Error():
        return error(_that.error);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function(String error)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadFinished() when loadFinished != null:
        return loadFinished();
      case _Error() when error != null:
        return error(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadFinished implements FigmaStylesScreenSR {
  const _LoadFinished();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadFinished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FigmaStylesScreenSR.loadFinished()';
  }
}

/// @nodoc

class _Error implements FigmaStylesScreenSR {
  const _Error({required this.error});

  final String error;

  /// Create a copy of FigmaStylesScreenSR
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'FigmaStylesScreenSR.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $FigmaStylesScreenSRCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of FigmaStylesScreenSR
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(_Error(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$FigmaStylesScreenState {
  Config get config;

  /// Create a copy of FigmaStylesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FigmaStylesScreenStateCopyWith<FigmaStylesScreenState> get copyWith =>
      _$FigmaStylesScreenStateCopyWithImpl<FigmaStylesScreenState>(
          this as FigmaStylesScreenState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FigmaStylesScreenState &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @override
  String toString() {
    return 'FigmaStylesScreenState(config: $config)';
  }
}

/// @nodoc
abstract mixin class $FigmaStylesScreenStateCopyWith<$Res> {
  factory $FigmaStylesScreenStateCopyWith(FigmaStylesScreenState value,
          $Res Function(FigmaStylesScreenState) _then) =
      _$FigmaStylesScreenStateCopyWithImpl;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$FigmaStylesScreenStateCopyWithImpl<$Res>
    implements $FigmaStylesScreenStateCopyWith<$Res> {
  _$FigmaStylesScreenStateCopyWithImpl(this._self, this._then);

  final FigmaStylesScreenState _self;
  final $Res Function(FigmaStylesScreenState) _then;

  /// Create a copy of FigmaStylesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_self.copyWith(
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ));
  }

  /// Create a copy of FigmaStylesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<$Res> get config {
    return $ConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }
}

/// Adds pattern-matching-related methods to [FigmaStylesScreenState].
extension FigmaStylesScreenStatePatterns on FigmaStylesScreenState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FigmaStylesScreenStateData value)? data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FigmaStylesScreenStateData() when data != null:
        return data(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(FigmaStylesScreenStateData value) data,
  }) {
    final _that = this;
    switch (_that) {
      case FigmaStylesScreenStateData():
        return data(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FigmaStylesScreenStateData value)? data,
  }) {
    final _that = this;
    switch (_that) {
      case FigmaStylesScreenStateData() when data != null:
        return data(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FigmaStylesScreenStateData() when data != null:
        return data(_that.config);
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
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) data,
  }) {
    final _that = this;
    switch (_that) {
      case FigmaStylesScreenStateData():
        return data(_that.config);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? data,
  }) {
    final _that = this;
    switch (_that) {
      case FigmaStylesScreenStateData() when data != null:
        return data(_that.config);
      case _:
        return null;
    }
  }
}

/// @nodoc

class FigmaStylesScreenStateData implements FigmaStylesScreenState {
  const FigmaStylesScreenStateData({required this.config});

  @override
  final Config config;

  /// Create a copy of FigmaStylesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FigmaStylesScreenStateDataCopyWith<FigmaStylesScreenStateData>
      get copyWith =>
          _$FigmaStylesScreenStateDataCopyWithImpl<FigmaStylesScreenStateData>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FigmaStylesScreenStateData &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @override
  String toString() {
    return 'FigmaStylesScreenState.data(config: $config)';
  }
}

/// @nodoc
abstract mixin class $FigmaStylesScreenStateDataCopyWith<$Res>
    implements $FigmaStylesScreenStateCopyWith<$Res> {
  factory $FigmaStylesScreenStateDataCopyWith(FigmaStylesScreenStateData value,
          $Res Function(FigmaStylesScreenStateData) _then) =
      _$FigmaStylesScreenStateDataCopyWithImpl;
  @override
  @useResult
  $Res call({Config config});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$FigmaStylesScreenStateDataCopyWithImpl<$Res>
    implements $FigmaStylesScreenStateDataCopyWith<$Res> {
  _$FigmaStylesScreenStateDataCopyWithImpl(this._self, this._then);

  final FigmaStylesScreenStateData _self;
  final $Res Function(FigmaStylesScreenStateData) _then;

  /// Create a copy of FigmaStylesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? config = null,
  }) {
    return _then(FigmaStylesScreenStateData(
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ));
  }

  /// Create a copy of FigmaStylesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<$Res> get config {
    return $ConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }
}

// dart format on
