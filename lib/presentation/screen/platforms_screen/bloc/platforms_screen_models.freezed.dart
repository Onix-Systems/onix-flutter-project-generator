// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'platforms_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlatformsScreenEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PlatformsScreenEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PlatformsScreenEvent()';
  }
}

/// @nodoc
class $PlatformsScreenEventCopyWith<$Res> {
  $PlatformsScreenEventCopyWith(
      PlatformsScreenEvent _, $Res Function(PlatformsScreenEvent) __);
}

/// Adds pattern-matching-related methods to [PlatformsScreenEvent].
extension PlatformsScreenEventPatterns on PlatformsScreenEvent {
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
    TResult Function(PlatformsScreenEventInit value)? init,
    TResult Function(PlatformsScreenEventOnPlatformsChange value)?
        onPlatformsChange,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PlatformsScreenEventInit() when init != null:
        return init(_that);
      case PlatformsScreenEventOnPlatformsChange()
          when onPlatformsChange != null:
        return onPlatformsChange(_that);
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
    required TResult Function(PlatformsScreenEventInit value) init,
    required TResult Function(PlatformsScreenEventOnPlatformsChange value)
        onPlatformsChange,
  }) {
    final _that = this;
    switch (_that) {
      case PlatformsScreenEventInit():
        return init(_that);
      case PlatformsScreenEventOnPlatformsChange():
        return onPlatformsChange(_that);
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
    TResult? Function(PlatformsScreenEventInit value)? init,
    TResult? Function(PlatformsScreenEventOnPlatformsChange value)?
        onPlatformsChange,
  }) {
    final _that = this;
    switch (_that) {
      case PlatformsScreenEventInit() when init != null:
        return init(_that);
      case PlatformsScreenEventOnPlatformsChange()
          when onPlatformsChange != null:
        return onPlatformsChange(_that);
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
    TResult Function(AvailablePlatforms item)? onPlatformsChange,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PlatformsScreenEventInit() when init != null:
        return init();
      case PlatformsScreenEventOnPlatformsChange()
          when onPlatformsChange != null:
        return onPlatformsChange(_that.item);
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
    required TResult Function(AvailablePlatforms item) onPlatformsChange,
  }) {
    final _that = this;
    switch (_that) {
      case PlatformsScreenEventInit():
        return init();
      case PlatformsScreenEventOnPlatformsChange():
        return onPlatformsChange(_that.item);
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
    TResult? Function(AvailablePlatforms item)? onPlatformsChange,
  }) {
    final _that = this;
    switch (_that) {
      case PlatformsScreenEventInit() when init != null:
        return init();
      case PlatformsScreenEventOnPlatformsChange()
          when onPlatformsChange != null:
        return onPlatformsChange(_that.item);
      case _:
        return null;
    }
  }
}

/// @nodoc

class PlatformsScreenEventInit implements PlatformsScreenEvent {
  const PlatformsScreenEventInit();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PlatformsScreenEventInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PlatformsScreenEvent.init()';
  }
}

/// @nodoc

class PlatformsScreenEventOnPlatformsChange implements PlatformsScreenEvent {
  const PlatformsScreenEventOnPlatformsChange({required this.item});

  final AvailablePlatforms item;

  /// Create a copy of PlatformsScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlatformsScreenEventOnPlatformsChangeCopyWith<
          PlatformsScreenEventOnPlatformsChange>
      get copyWith => _$PlatformsScreenEventOnPlatformsChangeCopyWithImpl<
          PlatformsScreenEventOnPlatformsChange>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlatformsScreenEventOnPlatformsChange &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @override
  String toString() {
    return 'PlatformsScreenEvent.onPlatformsChange(item: $item)';
  }
}

/// @nodoc
abstract mixin class $PlatformsScreenEventOnPlatformsChangeCopyWith<$Res>
    implements $PlatformsScreenEventCopyWith<$Res> {
  factory $PlatformsScreenEventOnPlatformsChangeCopyWith(
          PlatformsScreenEventOnPlatformsChange value,
          $Res Function(PlatformsScreenEventOnPlatformsChange) _then) =
      _$PlatformsScreenEventOnPlatformsChangeCopyWithImpl;
  @useResult
  $Res call({AvailablePlatforms item});
}

/// @nodoc
class _$PlatformsScreenEventOnPlatformsChangeCopyWithImpl<$Res>
    implements $PlatformsScreenEventOnPlatformsChangeCopyWith<$Res> {
  _$PlatformsScreenEventOnPlatformsChangeCopyWithImpl(this._self, this._then);

  final PlatformsScreenEventOnPlatformsChange _self;
  final $Res Function(PlatformsScreenEventOnPlatformsChange) _then;

  /// Create a copy of PlatformsScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
  }) {
    return _then(PlatformsScreenEventOnPlatformsChange(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as AvailablePlatforms,
    ));
  }
}

/// @nodoc
mixin _$PlatformsScreenState {
  Config get config;

  /// Create a copy of PlatformsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlatformsScreenStateCopyWith<PlatformsScreenState> get copyWith =>
      _$PlatformsScreenStateCopyWithImpl<PlatformsScreenState>(
          this as PlatformsScreenState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlatformsScreenState &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @override
  String toString() {
    return 'PlatformsScreenState(config: $config)';
  }
}

/// @nodoc
abstract mixin class $PlatformsScreenStateCopyWith<$Res> {
  factory $PlatformsScreenStateCopyWith(PlatformsScreenState value,
          $Res Function(PlatformsScreenState) _then) =
      _$PlatformsScreenStateCopyWithImpl;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$PlatformsScreenStateCopyWithImpl<$Res>
    implements $PlatformsScreenStateCopyWith<$Res> {
  _$PlatformsScreenStateCopyWithImpl(this._self, this._then);

  final PlatformsScreenState _self;
  final $Res Function(PlatformsScreenState) _then;

  /// Create a copy of PlatformsScreenState
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

  /// Create a copy of PlatformsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<$Res> get config {
    return $ConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PlatformsScreenState].
extension PlatformsScreenStatePatterns on PlatformsScreenState {
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
    TResult Function(PlatformsScreenStateData value)? data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PlatformsScreenStateData() when data != null:
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
    required TResult Function(PlatformsScreenStateData value) data,
  }) {
    final _that = this;
    switch (_that) {
      case PlatformsScreenStateData():
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
    TResult? Function(PlatformsScreenStateData value)? data,
  }) {
    final _that = this;
    switch (_that) {
      case PlatformsScreenStateData() when data != null:
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
      case PlatformsScreenStateData() when data != null:
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
      case PlatformsScreenStateData():
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
      case PlatformsScreenStateData() when data != null:
        return data(_that.config);
      case _:
        return null;
    }
  }
}

/// @nodoc

class PlatformsScreenStateData implements PlatformsScreenState {
  const PlatformsScreenStateData({required this.config});

  @override
  final Config config;

  /// Create a copy of PlatformsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlatformsScreenStateDataCopyWith<PlatformsScreenStateData> get copyWith =>
      _$PlatformsScreenStateDataCopyWithImpl<PlatformsScreenStateData>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlatformsScreenStateData &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @override
  String toString() {
    return 'PlatformsScreenState.data(config: $config)';
  }
}

/// @nodoc
abstract mixin class $PlatformsScreenStateDataCopyWith<$Res>
    implements $PlatformsScreenStateCopyWith<$Res> {
  factory $PlatformsScreenStateDataCopyWith(PlatformsScreenStateData value,
          $Res Function(PlatformsScreenStateData) _then) =
      _$PlatformsScreenStateDataCopyWithImpl;
  @override
  @useResult
  $Res call({Config config});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$PlatformsScreenStateDataCopyWithImpl<$Res>
    implements $PlatformsScreenStateDataCopyWith<$Res> {
  _$PlatformsScreenStateDataCopyWithImpl(this._self, this._then);

  final PlatformsScreenStateData _self;
  final $Res Function(PlatformsScreenStateData) _then;

  /// Create a copy of PlatformsScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? config = null,
  }) {
    return _then(PlatformsScreenStateData(
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ));
  }

  /// Create a copy of PlatformsScreenState
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
