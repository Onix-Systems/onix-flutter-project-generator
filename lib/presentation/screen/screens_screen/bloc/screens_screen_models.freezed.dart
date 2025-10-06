// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screens_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScreensScreenEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScreensScreenEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ScreensScreenEvent()';
  }
}

/// @nodoc
class $ScreensScreenEventCopyWith<$Res> {
  $ScreensScreenEventCopyWith(
      ScreensScreenEvent _, $Res Function(ScreensScreenEvent) __);
}

/// Adds pattern-matching-related methods to [ScreensScreenEvent].
extension ScreensScreenEventPatterns on ScreensScreenEvent {
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
    TResult Function(ScreensScreenEventInit value)? init,
    TResult Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
    TResult Function(ScreensScreenEventOnScreenChangeInitial value)?
        onScreenChangeInitial,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ScreensScreenEventInit() when init != null:
        return init(_that);
      case ScreensScreenEventOnScreenAdd() when onScreenAdd != null:
        return onScreenAdd(_that);
      case ScreensScreenEventOnScreenDelete() when onScreenDelete != null:
        return onScreenDelete(_that);
      case ScreensScreenEventOnScreenModify() when onScreenModify != null:
        return onScreenModify(_that);
      case ScreensScreenEventOnScreenChangeInitial()
          when onScreenChangeInitial != null:
        return onScreenChangeInitial(_that);
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
    required TResult Function(ScreensScreenEventInit value) init,
    required TResult Function(ScreensScreenEventOnScreenAdd value) onScreenAdd,
    required TResult Function(ScreensScreenEventOnScreenDelete value)
        onScreenDelete,
    required TResult Function(ScreensScreenEventOnScreenModify value)
        onScreenModify,
    required TResult Function(ScreensScreenEventOnScreenChangeInitial value)
        onScreenChangeInitial,
  }) {
    final _that = this;
    switch (_that) {
      case ScreensScreenEventInit():
        return init(_that);
      case ScreensScreenEventOnScreenAdd():
        return onScreenAdd(_that);
      case ScreensScreenEventOnScreenDelete():
        return onScreenDelete(_that);
      case ScreensScreenEventOnScreenModify():
        return onScreenModify(_that);
      case ScreensScreenEventOnScreenChangeInitial():
        return onScreenChangeInitial(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreensScreenEventInit value)? init,
    TResult? Function(ScreensScreenEventOnScreenAdd value)? onScreenAdd,
    TResult? Function(ScreensScreenEventOnScreenDelete value)? onScreenDelete,
    TResult? Function(ScreensScreenEventOnScreenModify value)? onScreenModify,
    TResult? Function(ScreensScreenEventOnScreenChangeInitial value)?
        onScreenChangeInitial,
  }) {
    final _that = this;
    switch (_that) {
      case ScreensScreenEventInit() when init != null:
        return init(_that);
      case ScreensScreenEventOnScreenAdd() when onScreenAdd != null:
        return onScreenAdd(_that);
      case ScreensScreenEventOnScreenDelete() when onScreenDelete != null:
        return onScreenDelete(_that);
      case ScreensScreenEventOnScreenModify() when onScreenModify != null:
        return onScreenModify(_that);
      case ScreensScreenEventOnScreenChangeInitial()
          when onScreenChangeInitial != null:
        return onScreenChangeInitial(_that);
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
    TResult Function(Screen screen)? onScreenAdd,
    TResult Function(String screenName)? onScreenDelete,
    TResult Function(Screen screen, String oldName)? onScreenModify,
    TResult Function(Screen screen)? onScreenChangeInitial,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ScreensScreenEventInit() when init != null:
        return init();
      case ScreensScreenEventOnScreenAdd() when onScreenAdd != null:
        return onScreenAdd(_that.screen);
      case ScreensScreenEventOnScreenDelete() when onScreenDelete != null:
        return onScreenDelete(_that.screenName);
      case ScreensScreenEventOnScreenModify() when onScreenModify != null:
        return onScreenModify(_that.screen, _that.oldName);
      case ScreensScreenEventOnScreenChangeInitial()
          when onScreenChangeInitial != null:
        return onScreenChangeInitial(_that.screen);
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
    required TResult Function(Screen screen) onScreenAdd,
    required TResult Function(String screenName) onScreenDelete,
    required TResult Function(Screen screen, String oldName) onScreenModify,
    required TResult Function(Screen screen) onScreenChangeInitial,
  }) {
    final _that = this;
    switch (_that) {
      case ScreensScreenEventInit():
        return init();
      case ScreensScreenEventOnScreenAdd():
        return onScreenAdd(_that.screen);
      case ScreensScreenEventOnScreenDelete():
        return onScreenDelete(_that.screenName);
      case ScreensScreenEventOnScreenModify():
        return onScreenModify(_that.screen, _that.oldName);
      case ScreensScreenEventOnScreenChangeInitial():
        return onScreenChangeInitial(_that.screen);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(Screen screen)? onScreenAdd,
    TResult? Function(String screenName)? onScreenDelete,
    TResult? Function(Screen screen, String oldName)? onScreenModify,
    TResult? Function(Screen screen)? onScreenChangeInitial,
  }) {
    final _that = this;
    switch (_that) {
      case ScreensScreenEventInit() when init != null:
        return init();
      case ScreensScreenEventOnScreenAdd() when onScreenAdd != null:
        return onScreenAdd(_that.screen);
      case ScreensScreenEventOnScreenDelete() when onScreenDelete != null:
        return onScreenDelete(_that.screenName);
      case ScreensScreenEventOnScreenModify() when onScreenModify != null:
        return onScreenModify(_that.screen, _that.oldName);
      case ScreensScreenEventOnScreenChangeInitial()
          when onScreenChangeInitial != null:
        return onScreenChangeInitial(_that.screen);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ScreensScreenEventInit implements ScreensScreenEvent {
  const ScreensScreenEventInit();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScreensScreenEventInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ScreensScreenEvent.init()';
  }
}

/// @nodoc

class ScreensScreenEventOnScreenAdd implements ScreensScreenEvent {
  const ScreensScreenEventOnScreenAdd({required this.screen});

  final Screen screen;

  /// Create a copy of ScreensScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScreensScreenEventOnScreenAddCopyWith<ScreensScreenEventOnScreenAdd>
      get copyWith => _$ScreensScreenEventOnScreenAddCopyWithImpl<
          ScreensScreenEventOnScreenAdd>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScreensScreenEventOnScreenAdd &&
            (identical(other.screen, screen) || other.screen == screen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screen);

  @override
  String toString() {
    return 'ScreensScreenEvent.onScreenAdd(screen: $screen)';
  }
}

/// @nodoc
abstract mixin class $ScreensScreenEventOnScreenAddCopyWith<$Res>
    implements $ScreensScreenEventCopyWith<$Res> {
  factory $ScreensScreenEventOnScreenAddCopyWith(
          ScreensScreenEventOnScreenAdd value,
          $Res Function(ScreensScreenEventOnScreenAdd) _then) =
      _$ScreensScreenEventOnScreenAddCopyWithImpl;
  @useResult
  $Res call({Screen screen});
}

/// @nodoc
class _$ScreensScreenEventOnScreenAddCopyWithImpl<$Res>
    implements $ScreensScreenEventOnScreenAddCopyWith<$Res> {
  _$ScreensScreenEventOnScreenAddCopyWithImpl(this._self, this._then);

  final ScreensScreenEventOnScreenAdd _self;
  final $Res Function(ScreensScreenEventOnScreenAdd) _then;

  /// Create a copy of ScreensScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? screen = null,
  }) {
    return _then(ScreensScreenEventOnScreenAdd(
      screen: null == screen
          ? _self.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as Screen,
    ));
  }
}

/// @nodoc

class ScreensScreenEventOnScreenDelete implements ScreensScreenEvent {
  const ScreensScreenEventOnScreenDelete({required this.screenName});

  final String screenName;

  /// Create a copy of ScreensScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScreensScreenEventOnScreenDeleteCopyWith<ScreensScreenEventOnScreenDelete>
      get copyWith => _$ScreensScreenEventOnScreenDeleteCopyWithImpl<
          ScreensScreenEventOnScreenDelete>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScreensScreenEventOnScreenDelete &&
            (identical(other.screenName, screenName) ||
                other.screenName == screenName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screenName);

  @override
  String toString() {
    return 'ScreensScreenEvent.onScreenDelete(screenName: $screenName)';
  }
}

/// @nodoc
abstract mixin class $ScreensScreenEventOnScreenDeleteCopyWith<$Res>
    implements $ScreensScreenEventCopyWith<$Res> {
  factory $ScreensScreenEventOnScreenDeleteCopyWith(
          ScreensScreenEventOnScreenDelete value,
          $Res Function(ScreensScreenEventOnScreenDelete) _then) =
      _$ScreensScreenEventOnScreenDeleteCopyWithImpl;
  @useResult
  $Res call({String screenName});
}

/// @nodoc
class _$ScreensScreenEventOnScreenDeleteCopyWithImpl<$Res>
    implements $ScreensScreenEventOnScreenDeleteCopyWith<$Res> {
  _$ScreensScreenEventOnScreenDeleteCopyWithImpl(this._self, this._then);

  final ScreensScreenEventOnScreenDelete _self;
  final $Res Function(ScreensScreenEventOnScreenDelete) _then;

  /// Create a copy of ScreensScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? screenName = null,
  }) {
    return _then(ScreensScreenEventOnScreenDelete(
      screenName: null == screenName
          ? _self.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ScreensScreenEventOnScreenModify implements ScreensScreenEvent {
  const ScreensScreenEventOnScreenModify(
      {required this.screen, required this.oldName});

  final Screen screen;
  final String oldName;

  /// Create a copy of ScreensScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScreensScreenEventOnScreenModifyCopyWith<ScreensScreenEventOnScreenModify>
      get copyWith => _$ScreensScreenEventOnScreenModifyCopyWithImpl<
          ScreensScreenEventOnScreenModify>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScreensScreenEventOnScreenModify &&
            (identical(other.screen, screen) || other.screen == screen) &&
            (identical(other.oldName, oldName) || other.oldName == oldName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screen, oldName);

  @override
  String toString() {
    return 'ScreensScreenEvent.onScreenModify(screen: $screen, oldName: $oldName)';
  }
}

/// @nodoc
abstract mixin class $ScreensScreenEventOnScreenModifyCopyWith<$Res>
    implements $ScreensScreenEventCopyWith<$Res> {
  factory $ScreensScreenEventOnScreenModifyCopyWith(
          ScreensScreenEventOnScreenModify value,
          $Res Function(ScreensScreenEventOnScreenModify) _then) =
      _$ScreensScreenEventOnScreenModifyCopyWithImpl;
  @useResult
  $Res call({Screen screen, String oldName});
}

/// @nodoc
class _$ScreensScreenEventOnScreenModifyCopyWithImpl<$Res>
    implements $ScreensScreenEventOnScreenModifyCopyWith<$Res> {
  _$ScreensScreenEventOnScreenModifyCopyWithImpl(this._self, this._then);

  final ScreensScreenEventOnScreenModify _self;
  final $Res Function(ScreensScreenEventOnScreenModify) _then;

  /// Create a copy of ScreensScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? screen = null,
    Object? oldName = null,
  }) {
    return _then(ScreensScreenEventOnScreenModify(
      screen: null == screen
          ? _self.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as Screen,
      oldName: null == oldName
          ? _self.oldName
          : oldName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ScreensScreenEventOnScreenChangeInitial implements ScreensScreenEvent {
  const ScreensScreenEventOnScreenChangeInitial({required this.screen});

  final Screen screen;

  /// Create a copy of ScreensScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScreensScreenEventOnScreenChangeInitialCopyWith<
          ScreensScreenEventOnScreenChangeInitial>
      get copyWith => _$ScreensScreenEventOnScreenChangeInitialCopyWithImpl<
          ScreensScreenEventOnScreenChangeInitial>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScreensScreenEventOnScreenChangeInitial &&
            (identical(other.screen, screen) || other.screen == screen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screen);

  @override
  String toString() {
    return 'ScreensScreenEvent.onScreenChangeInitial(screen: $screen)';
  }
}

/// @nodoc
abstract mixin class $ScreensScreenEventOnScreenChangeInitialCopyWith<$Res>
    implements $ScreensScreenEventCopyWith<$Res> {
  factory $ScreensScreenEventOnScreenChangeInitialCopyWith(
          ScreensScreenEventOnScreenChangeInitial value,
          $Res Function(ScreensScreenEventOnScreenChangeInitial) _then) =
      _$ScreensScreenEventOnScreenChangeInitialCopyWithImpl;
  @useResult
  $Res call({Screen screen});
}

/// @nodoc
class _$ScreensScreenEventOnScreenChangeInitialCopyWithImpl<$Res>
    implements $ScreensScreenEventOnScreenChangeInitialCopyWith<$Res> {
  _$ScreensScreenEventOnScreenChangeInitialCopyWithImpl(this._self, this._then);

  final ScreensScreenEventOnScreenChangeInitial _self;
  final $Res Function(ScreensScreenEventOnScreenChangeInitial) _then;

  /// Create a copy of ScreensScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? screen = null,
  }) {
    return _then(ScreensScreenEventOnScreenChangeInitial(
      screen: null == screen
          ? _self.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as Screen,
    ));
  }
}

/// @nodoc
mixin _$ScreensScreenSR {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScreensScreenSR);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ScreensScreenSR()';
  }
}

/// @nodoc
class $ScreensScreenSRCopyWith<$Res> {
  $ScreensScreenSRCopyWith(
      ScreensScreenSR _, $Res Function(ScreensScreenSR) __);
}

/// Adds pattern-matching-related methods to [ScreensScreenSR].
extension ScreensScreenSRPatterns on ScreensScreenSR {
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
    TResult Function(_ExistsError value)? existsError,
    TResult Function(_WrongNameError value)? wrongNameError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExistsError() when existsError != null:
        return existsError(_that);
      case _WrongNameError() when wrongNameError != null:
        return wrongNameError(_that);
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
    required TResult Function(_ExistsError value) existsError,
    required TResult Function(_WrongNameError value) wrongNameError,
  }) {
    final _that = this;
    switch (_that) {
      case _ExistsError():
        return existsError(_that);
      case _WrongNameError():
        return wrongNameError(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ExistsError value)? existsError,
    TResult? Function(_WrongNameError value)? wrongNameError,
  }) {
    final _that = this;
    switch (_that) {
      case _ExistsError() when existsError != null:
        return existsError(_that);
      case _WrongNameError() when wrongNameError != null:
        return wrongNameError(_that);
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
    TResult Function()? existsError,
    TResult Function()? wrongNameError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExistsError() when existsError != null:
        return existsError();
      case _WrongNameError() when wrongNameError != null:
        return wrongNameError();
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
    required TResult Function() existsError,
    required TResult Function() wrongNameError,
  }) {
    final _that = this;
    switch (_that) {
      case _ExistsError():
        return existsError();
      case _WrongNameError():
        return wrongNameError();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? existsError,
    TResult? Function()? wrongNameError,
  }) {
    final _that = this;
    switch (_that) {
      case _ExistsError() when existsError != null:
        return existsError();
      case _WrongNameError() when wrongNameError != null:
        return wrongNameError();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExistsError implements ScreensScreenSR {
  const _ExistsError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ExistsError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ScreensScreenSR.existsError()';
  }
}

/// @nodoc

class _WrongNameError implements ScreensScreenSR {
  const _WrongNameError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _WrongNameError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ScreensScreenSR.wrongNameError()';
  }
}

/// @nodoc
mixin _$ScreensScreenState {
  Config get config;
  int get stateUpdate;

  /// Create a copy of ScreensScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScreensScreenStateCopyWith<ScreensScreenState> get copyWith =>
      _$ScreensScreenStateCopyWithImpl<ScreensScreenState>(
          this as ScreensScreenState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScreensScreenState &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.stateUpdate, stateUpdate) ||
                other.stateUpdate == stateUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, stateUpdate);

  @override
  String toString() {
    return 'ScreensScreenState(config: $config, stateUpdate: $stateUpdate)';
  }
}

/// @nodoc
abstract mixin class $ScreensScreenStateCopyWith<$Res> {
  factory $ScreensScreenStateCopyWith(
          ScreensScreenState value, $Res Function(ScreensScreenState) _then) =
      _$ScreensScreenStateCopyWithImpl;
  @useResult
  $Res call({Config config, int stateUpdate});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$ScreensScreenStateCopyWithImpl<$Res>
    implements $ScreensScreenStateCopyWith<$Res> {
  _$ScreensScreenStateCopyWithImpl(this._self, this._then);

  final ScreensScreenState _self;
  final $Res Function(ScreensScreenState) _then;

  /// Create a copy of ScreensScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? stateUpdate = null,
  }) {
    return _then(_self.copyWith(
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      stateUpdate: null == stateUpdate
          ? _self.stateUpdate
          : stateUpdate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of ScreensScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<$Res> get config {
    return $ConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ScreensScreenState].
extension ScreensScreenStatePatterns on ScreensScreenState {
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
    TResult Function(ScreensScreenStateData value)? data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ScreensScreenStateData() when data != null:
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
    required TResult Function(ScreensScreenStateData value) data,
  }) {
    final _that = this;
    switch (_that) {
      case ScreensScreenStateData():
        return data(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreensScreenStateData value)? data,
  }) {
    final _that = this;
    switch (_that) {
      case ScreensScreenStateData() when data != null:
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
    TResult Function(Config config, int stateUpdate)? data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ScreensScreenStateData() when data != null:
        return data(_that.config, _that.stateUpdate);
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
    required TResult Function(Config config, int stateUpdate) data,
  }) {
    final _that = this;
    switch (_that) {
      case ScreensScreenStateData():
        return data(_that.config, _that.stateUpdate);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, int stateUpdate)? data,
  }) {
    final _that = this;
    switch (_that) {
      case ScreensScreenStateData() when data != null:
        return data(_that.config, _that.stateUpdate);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ScreensScreenStateData implements ScreensScreenState {
  const ScreensScreenStateData({required this.config, this.stateUpdate = 0});

  @override
  final Config config;
  @override
  @JsonKey()
  final int stateUpdate;

  /// Create a copy of ScreensScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScreensScreenStateDataCopyWith<ScreensScreenStateData> get copyWith =>
      _$ScreensScreenStateDataCopyWithImpl<ScreensScreenStateData>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScreensScreenStateData &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.stateUpdate, stateUpdate) ||
                other.stateUpdate == stateUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, stateUpdate);

  @override
  String toString() {
    return 'ScreensScreenState.data(config: $config, stateUpdate: $stateUpdate)';
  }
}

/// @nodoc
abstract mixin class $ScreensScreenStateDataCopyWith<$Res>
    implements $ScreensScreenStateCopyWith<$Res> {
  factory $ScreensScreenStateDataCopyWith(ScreensScreenStateData value,
          $Res Function(ScreensScreenStateData) _then) =
      _$ScreensScreenStateDataCopyWithImpl;
  @override
  @useResult
  $Res call({Config config, int stateUpdate});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$ScreensScreenStateDataCopyWithImpl<$Res>
    implements $ScreensScreenStateDataCopyWith<$Res> {
  _$ScreensScreenStateDataCopyWithImpl(this._self, this._then);

  final ScreensScreenStateData _self;
  final $Res Function(ScreensScreenStateData) _then;

  /// Create a copy of ScreensScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? config = null,
    Object? stateUpdate = null,
  }) {
    return _then(ScreensScreenStateData(
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      stateUpdate: null == stateUpdate
          ? _self.stateUpdate
          : stateUpdate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of ScreensScreenState
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
