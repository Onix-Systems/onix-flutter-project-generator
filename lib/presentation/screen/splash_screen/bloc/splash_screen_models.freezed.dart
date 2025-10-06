// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SplashScreenEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SplashScreenEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SplashScreenEvent()';
  }
}

/// @nodoc
class $SplashScreenEventCopyWith<$Res> {
  $SplashScreenEventCopyWith(
      SplashScreenEvent _, $Res Function(SplashScreenEvent) __);
}

/// Adds pattern-matching-related methods to [SplashScreenEvent].
extension SplashScreenEventPatterns on SplashScreenEvent {
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
    TResult Function(SplashScreenEventInit value)? init,
    TResult Function(SplashScreenEventOnAnimationFinished value)?
        onAnimationFinished,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SplashScreenEventInit() when init != null:
        return init(_that);
      case SplashScreenEventOnAnimationFinished()
          when onAnimationFinished != null:
        return onAnimationFinished(_that);
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
    required TResult Function(SplashScreenEventInit value) init,
    required TResult Function(SplashScreenEventOnAnimationFinished value)
        onAnimationFinished,
  }) {
    final _that = this;
    switch (_that) {
      case SplashScreenEventInit():
        return init(_that);
      case SplashScreenEventOnAnimationFinished():
        return onAnimationFinished(_that);
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
    TResult? Function(SplashScreenEventInit value)? init,
    TResult? Function(SplashScreenEventOnAnimationFinished value)?
        onAnimationFinished,
  }) {
    final _that = this;
    switch (_that) {
      case SplashScreenEventInit() when init != null:
        return init(_that);
      case SplashScreenEventOnAnimationFinished()
          when onAnimationFinished != null:
        return onAnimationFinished(_that);
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
    TResult Function()? onAnimationFinished,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SplashScreenEventInit() when init != null:
        return init();
      case SplashScreenEventOnAnimationFinished()
          when onAnimationFinished != null:
        return onAnimationFinished();
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
    required TResult Function() onAnimationFinished,
  }) {
    final _that = this;
    switch (_that) {
      case SplashScreenEventInit():
        return init();
      case SplashScreenEventOnAnimationFinished():
        return onAnimationFinished();
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
    TResult? Function()? onAnimationFinished,
  }) {
    final _that = this;
    switch (_that) {
      case SplashScreenEventInit() when init != null:
        return init();
      case SplashScreenEventOnAnimationFinished()
          when onAnimationFinished != null:
        return onAnimationFinished();
      case _:
        return null;
    }
  }
}

/// @nodoc

class SplashScreenEventInit implements SplashScreenEvent {
  const SplashScreenEventInit();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SplashScreenEventInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SplashScreenEvent.init()';
  }
}

/// @nodoc

class SplashScreenEventOnAnimationFinished implements SplashScreenEvent {
  const SplashScreenEventOnAnimationFinished();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SplashScreenEventOnAnimationFinished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SplashScreenEvent.onAnimationFinished()';
  }
}

/// @nodoc
mixin _$SplashScreenSR {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SplashScreenSR);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SplashScreenSR()';
  }
}

/// @nodoc
class $SplashScreenSRCopyWith<$Res> {
  $SplashScreenSRCopyWith(SplashScreenSR _, $Res Function(SplashScreenSR) __);
}

/// Adds pattern-matching-related methods to [SplashScreenSR].
extension SplashScreenSRPatterns on SplashScreenSR {
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
    TResult Function(_onNeedUpdate value)? onNeedUpdate,
    TResult Function(_onContinue value)? onContinue,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _onNeedUpdate() when onNeedUpdate != null:
        return onNeedUpdate(_that);
      case _onContinue() when onContinue != null:
        return onContinue(_that);
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
    required TResult Function(_onNeedUpdate value) onNeedUpdate,
    required TResult Function(_onContinue value) onContinue,
  }) {
    final _that = this;
    switch (_that) {
      case _onNeedUpdate():
        return onNeedUpdate(_that);
      case _onContinue():
        return onContinue(_that);
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
    TResult? Function(_onNeedUpdate value)? onNeedUpdate,
    TResult? Function(_onContinue value)? onContinue,
  }) {
    final _that = this;
    switch (_that) {
      case _onNeedUpdate() when onNeedUpdate != null:
        return onNeedUpdate(_that);
      case _onContinue() when onContinue != null:
        return onContinue(_that);
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
    TResult Function(String latestReleaseUrl)? onNeedUpdate,
    TResult Function()? onContinue,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _onNeedUpdate() when onNeedUpdate != null:
        return onNeedUpdate(_that.latestReleaseUrl);
      case _onContinue() when onContinue != null:
        return onContinue();
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
    required TResult Function(String latestReleaseUrl) onNeedUpdate,
    required TResult Function() onContinue,
  }) {
    final _that = this;
    switch (_that) {
      case _onNeedUpdate():
        return onNeedUpdate(_that.latestReleaseUrl);
      case _onContinue():
        return onContinue();
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
    TResult? Function(String latestReleaseUrl)? onNeedUpdate,
    TResult? Function()? onContinue,
  }) {
    final _that = this;
    switch (_that) {
      case _onNeedUpdate() when onNeedUpdate != null:
        return onNeedUpdate(_that.latestReleaseUrl);
      case _onContinue() when onContinue != null:
        return onContinue();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _onNeedUpdate implements SplashScreenSR {
  const _onNeedUpdate({required this.latestReleaseUrl});

  final String latestReleaseUrl;

  /// Create a copy of SplashScreenSR
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$onNeedUpdateCopyWith<_onNeedUpdate> get copyWith =>
      __$onNeedUpdateCopyWithImpl<_onNeedUpdate>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _onNeedUpdate &&
            (identical(other.latestReleaseUrl, latestReleaseUrl) ||
                other.latestReleaseUrl == latestReleaseUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latestReleaseUrl);

  @override
  String toString() {
    return 'SplashScreenSR.onNeedUpdate(latestReleaseUrl: $latestReleaseUrl)';
  }
}

/// @nodoc
abstract mixin class _$onNeedUpdateCopyWith<$Res>
    implements $SplashScreenSRCopyWith<$Res> {
  factory _$onNeedUpdateCopyWith(
          _onNeedUpdate value, $Res Function(_onNeedUpdate) _then) =
      __$onNeedUpdateCopyWithImpl;
  @useResult
  $Res call({String latestReleaseUrl});
}

/// @nodoc
class __$onNeedUpdateCopyWithImpl<$Res>
    implements _$onNeedUpdateCopyWith<$Res> {
  __$onNeedUpdateCopyWithImpl(this._self, this._then);

  final _onNeedUpdate _self;
  final $Res Function(_onNeedUpdate) _then;

  /// Create a copy of SplashScreenSR
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latestReleaseUrl = null,
  }) {
    return _then(_onNeedUpdate(
      latestReleaseUrl: null == latestReleaseUrl
          ? _self.latestReleaseUrl
          : latestReleaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _onContinue implements SplashScreenSR {
  const _onContinue();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _onContinue);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SplashScreenSR.onContinue()';
  }
}

/// @nodoc
mixin _$SplashScreenState {
  String get remoteVersion;
  String get localVersion;
  bool get logoVisible;

  /// Create a copy of SplashScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SplashScreenStateCopyWith<SplashScreenState> get copyWith =>
      _$SplashScreenStateCopyWithImpl<SplashScreenState>(
          this as SplashScreenState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SplashScreenState &&
            (identical(other.remoteVersion, remoteVersion) ||
                other.remoteVersion == remoteVersion) &&
            (identical(other.localVersion, localVersion) ||
                other.localVersion == localVersion) &&
            (identical(other.logoVisible, logoVisible) ||
                other.logoVisible == logoVisible));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, remoteVersion, localVersion, logoVisible);

  @override
  String toString() {
    return 'SplashScreenState(remoteVersion: $remoteVersion, localVersion: $localVersion, logoVisible: $logoVisible)';
  }
}

/// @nodoc
abstract mixin class $SplashScreenStateCopyWith<$Res> {
  factory $SplashScreenStateCopyWith(
          SplashScreenState value, $Res Function(SplashScreenState) _then) =
      _$SplashScreenStateCopyWithImpl;
  @useResult
  $Res call({String remoteVersion, String localVersion, bool logoVisible});
}

/// @nodoc
class _$SplashScreenStateCopyWithImpl<$Res>
    implements $SplashScreenStateCopyWith<$Res> {
  _$SplashScreenStateCopyWithImpl(this._self, this._then);

  final SplashScreenState _self;
  final $Res Function(SplashScreenState) _then;

  /// Create a copy of SplashScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteVersion = null,
    Object? localVersion = null,
    Object? logoVisible = null,
  }) {
    return _then(_self.copyWith(
      remoteVersion: null == remoteVersion
          ? _self.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String,
      localVersion: null == localVersion
          ? _self.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as String,
      logoVisible: null == logoVisible
          ? _self.logoVisible
          : logoVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SplashScreenState].
extension SplashScreenStatePatterns on SplashScreenState {
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
    TResult Function(Data value)? data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Data() when data != null:
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
    required TResult Function(Data value) data,
  }) {
    final _that = this;
    switch (_that) {
      case Data():
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
    TResult? Function(Data value)? data,
  }) {
    final _that = this;
    switch (_that) {
      case Data() when data != null:
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
    TResult Function(
            String remoteVersion, String localVersion, bool logoVisible)?
        data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Data() when data != null:
        return data(_that.remoteVersion, _that.localVersion, _that.logoVisible);
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
    required TResult Function(
            String remoteVersion, String localVersion, bool logoVisible)
        data,
  }) {
    final _that = this;
    switch (_that) {
      case Data():
        return data(_that.remoteVersion, _that.localVersion, _that.logoVisible);
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
    TResult? Function(
            String remoteVersion, String localVersion, bool logoVisible)?
        data,
  }) {
    final _that = this;
    switch (_that) {
      case Data() when data != null:
        return data(_that.remoteVersion, _that.localVersion, _that.logoVisible);
      case _:
        return null;
    }
  }
}

/// @nodoc

class Data implements SplashScreenState {
  const Data(
      {this.remoteVersion = '',
      this.localVersion = '',
      this.logoVisible = false});

  @override
  @JsonKey()
  final String remoteVersion;
  @override
  @JsonKey()
  final String localVersion;
  @override
  @JsonKey()
  final bool logoVisible;

  /// Create a copy of SplashScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataCopyWith<Data> get copyWith =>
      _$DataCopyWithImpl<Data>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Data &&
            (identical(other.remoteVersion, remoteVersion) ||
                other.remoteVersion == remoteVersion) &&
            (identical(other.localVersion, localVersion) ||
                other.localVersion == localVersion) &&
            (identical(other.logoVisible, logoVisible) ||
                other.logoVisible == logoVisible));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, remoteVersion, localVersion, logoVisible);

  @override
  String toString() {
    return 'SplashScreenState.data(remoteVersion: $remoteVersion, localVersion: $localVersion, logoVisible: $logoVisible)';
  }
}

/// @nodoc
abstract mixin class $DataCopyWith<$Res>
    implements $SplashScreenStateCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) =
      _$DataCopyWithImpl;
  @override
  @useResult
  $Res call({String remoteVersion, String localVersion, bool logoVisible});
}

/// @nodoc
class _$DataCopyWithImpl<$Res> implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._self, this._then);

  final Data _self;
  final $Res Function(Data) _then;

  /// Create a copy of SplashScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? remoteVersion = null,
    Object? localVersion = null,
    Object? logoVisible = null,
  }) {
    return _then(Data(
      remoteVersion: null == remoteVersion
          ? _self.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String,
      localVersion: null == localVersion
          ? _self.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as String,
      logoVisible: null == logoVisible
          ? _self.logoVisible
          : logoVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
