// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'swagger_parser_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SwaggerParserScreenEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SwaggerParserScreenEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SwaggerParserScreenEvent()';
  }
}

/// @nodoc
class $SwaggerParserScreenEventCopyWith<$Res> {
  $SwaggerParserScreenEventCopyWith(
      SwaggerParserScreenEvent _, $Res Function(SwaggerParserScreenEvent) __);
}

/// Adds pattern-matching-related methods to [SwaggerParserScreenEvent].
extension SwaggerParserScreenEventPatterns on SwaggerParserScreenEvent {
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
    TResult Function(SwaggerParserScreenEventInit value)? init,
    TResult Function(SwaggerParserScreenEventParse value)? parse,
    TResult Function(SwaggerParserScreenEventOnCancel value)? onCancel,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SwaggerParserScreenEventInit() when init != null:
        return init(_that);
      case SwaggerParserScreenEventParse() when parse != null:
        return parse(_that);
      case SwaggerParserScreenEventOnCancel() when onCancel != null:
        return onCancel(_that);
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
    required TResult Function(SwaggerParserScreenEventInit value) init,
    required TResult Function(SwaggerParserScreenEventParse value) parse,
    required TResult Function(SwaggerParserScreenEventOnCancel value) onCancel,
  }) {
    final _that = this;
    switch (_that) {
      case SwaggerParserScreenEventInit():
        return init(_that);
      case SwaggerParserScreenEventParse():
        return parse(_that);
      case SwaggerParserScreenEventOnCancel():
        return onCancel(_that);
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
    TResult? Function(SwaggerParserScreenEventInit value)? init,
    TResult? Function(SwaggerParserScreenEventParse value)? parse,
    TResult? Function(SwaggerParserScreenEventOnCancel value)? onCancel,
  }) {
    final _that = this;
    switch (_that) {
      case SwaggerParserScreenEventInit() when init != null:
        return init(_that);
      case SwaggerParserScreenEventParse() when parse != null:
        return parse(_that);
      case SwaggerParserScreenEventOnCancel() when onCancel != null:
        return onCancel(_that);
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
    TResult Function(String url, bool? overwrite)? parse,
    TResult Function()? onCancel,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SwaggerParserScreenEventInit() when init != null:
        return init();
      case SwaggerParserScreenEventParse() when parse != null:
        return parse(_that.url, _that.overwrite);
      case SwaggerParserScreenEventOnCancel() when onCancel != null:
        return onCancel();
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
    required TResult Function(String url, bool? overwrite) parse,
    required TResult Function() onCancel,
  }) {
    final _that = this;
    switch (_that) {
      case SwaggerParserScreenEventInit():
        return init();
      case SwaggerParserScreenEventParse():
        return parse(_that.url, _that.overwrite);
      case SwaggerParserScreenEventOnCancel():
        return onCancel();
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
    TResult? Function(String url, bool? overwrite)? parse,
    TResult? Function()? onCancel,
  }) {
    final _that = this;
    switch (_that) {
      case SwaggerParserScreenEventInit() when init != null:
        return init();
      case SwaggerParserScreenEventParse() when parse != null:
        return parse(_that.url, _that.overwrite);
      case SwaggerParserScreenEventOnCancel() when onCancel != null:
        return onCancel();
      case _:
        return null;
    }
  }
}

/// @nodoc

class SwaggerParserScreenEventInit implements SwaggerParserScreenEvent {
  const SwaggerParserScreenEventInit();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SwaggerParserScreenEventInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SwaggerParserScreenEvent.init()';
  }
}

/// @nodoc

class SwaggerParserScreenEventParse implements SwaggerParserScreenEvent {
  const SwaggerParserScreenEventParse({required this.url, this.overwrite});

  final String url;
  final bool? overwrite;

  /// Create a copy of SwaggerParserScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SwaggerParserScreenEventParseCopyWith<SwaggerParserScreenEventParse>
      get copyWith => _$SwaggerParserScreenEventParseCopyWithImpl<
          SwaggerParserScreenEventParse>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SwaggerParserScreenEventParse &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.overwrite, overwrite) ||
                other.overwrite == overwrite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, overwrite);

  @override
  String toString() {
    return 'SwaggerParserScreenEvent.parse(url: $url, overwrite: $overwrite)';
  }
}

/// @nodoc
abstract mixin class $SwaggerParserScreenEventParseCopyWith<$Res>
    implements $SwaggerParserScreenEventCopyWith<$Res> {
  factory $SwaggerParserScreenEventParseCopyWith(
          SwaggerParserScreenEventParse value,
          $Res Function(SwaggerParserScreenEventParse) _then) =
      _$SwaggerParserScreenEventParseCopyWithImpl;
  @useResult
  $Res call({String url, bool? overwrite});
}

/// @nodoc
class _$SwaggerParserScreenEventParseCopyWithImpl<$Res>
    implements $SwaggerParserScreenEventParseCopyWith<$Res> {
  _$SwaggerParserScreenEventParseCopyWithImpl(this._self, this._then);

  final SwaggerParserScreenEventParse _self;
  final $Res Function(SwaggerParserScreenEventParse) _then;

  /// Create a copy of SwaggerParserScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? url = null,
    Object? overwrite = freezed,
  }) {
    return _then(SwaggerParserScreenEventParse(
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      overwrite: freezed == overwrite
          ? _self.overwrite
          : overwrite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class SwaggerParserScreenEventOnCancel implements SwaggerParserScreenEvent {
  const SwaggerParserScreenEventOnCancel();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SwaggerParserScreenEventOnCancel);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SwaggerParserScreenEvent.onCancel()';
  }
}

/// @nodoc
mixin _$SwaggerParserScreenSR {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SwaggerParserScreenSR);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SwaggerParserScreenSR()';
  }
}

/// @nodoc
class $SwaggerParserScreenSRCopyWith<$Res> {
  $SwaggerParserScreenSRCopyWith(
      SwaggerParserScreenSR _, $Res Function(SwaggerParserScreenSR) __);
}

/// Adds pattern-matching-related methods to [SwaggerParserScreenSR].
extension SwaggerParserScreenSRPatterns on SwaggerParserScreenSR {
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
    TResult Function(_Init value)? init,
    TResult Function(_OnContinue value)? onContinue,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Init() when init != null:
        return init(_that);
      case _OnContinue() when onContinue != null:
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
    required TResult Function(_Init value) init,
    required TResult Function(_OnContinue value) onContinue,
  }) {
    final _that = this;
    switch (_that) {
      case _Init():
        return init(_that);
      case _OnContinue():
        return onContinue(_that);
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
    TResult? Function(_Init value)? init,
    TResult? Function(_OnContinue value)? onContinue,
  }) {
    final _that = this;
    switch (_that) {
      case _Init() when init != null:
        return init(_that);
      case _OnContinue() when onContinue != null:
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
    TResult Function()? init,
    TResult Function()? onContinue,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Init() when init != null:
        return init();
      case _OnContinue() when onContinue != null:
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
    required TResult Function() init,
    required TResult Function() onContinue,
  }) {
    final _that = this;
    switch (_that) {
      case _Init():
        return init();
      case _OnContinue():
        return onContinue();
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
    TResult? Function()? onContinue,
  }) {
    final _that = this;
    switch (_that) {
      case _Init() when init != null:
        return init();
      case _OnContinue() when onContinue != null:
        return onContinue();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Init implements SwaggerParserScreenSR {
  const _Init();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SwaggerParserScreenSR.init()';
  }
}

/// @nodoc

class _OnContinue implements SwaggerParserScreenSR {
  const _OnContinue();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _OnContinue);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SwaggerParserScreenSR.onContinue()';
  }
}

/// @nodoc
mixin _$SwaggerParserScreenState {
  Config get config;
  Components get componentsBeforeParsing;

  /// Create a copy of SwaggerParserScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SwaggerParserScreenStateCopyWith<SwaggerParserScreenState> get copyWith =>
      _$SwaggerParserScreenStateCopyWithImpl<SwaggerParserScreenState>(
          this as SwaggerParserScreenState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SwaggerParserScreenState &&
            (identical(other.config, config) || other.config == config) &&
            (identical(
                    other.componentsBeforeParsing, componentsBeforeParsing) ||
                other.componentsBeforeParsing == componentsBeforeParsing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, componentsBeforeParsing);

  @override
  String toString() {
    return 'SwaggerParserScreenState(config: $config, componentsBeforeParsing: $componentsBeforeParsing)';
  }
}

/// @nodoc
abstract mixin class $SwaggerParserScreenStateCopyWith<$Res> {
  factory $SwaggerParserScreenStateCopyWith(SwaggerParserScreenState value,
          $Res Function(SwaggerParserScreenState) _then) =
      _$SwaggerParserScreenStateCopyWithImpl;
  @useResult
  $Res call({Config config, Components componentsBeforeParsing});

  $ConfigCopyWith<$Res> get config;
  $ComponentsCopyWith<$Res> get componentsBeforeParsing;
}

/// @nodoc
class _$SwaggerParserScreenStateCopyWithImpl<$Res>
    implements $SwaggerParserScreenStateCopyWith<$Res> {
  _$SwaggerParserScreenStateCopyWithImpl(this._self, this._then);

  final SwaggerParserScreenState _self;
  final $Res Function(SwaggerParserScreenState) _then;

  /// Create a copy of SwaggerParserScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? componentsBeforeParsing = null,
  }) {
    return _then(_self.copyWith(
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      componentsBeforeParsing: null == componentsBeforeParsing
          ? _self.componentsBeforeParsing
          : componentsBeforeParsing // ignore: cast_nullable_to_non_nullable
              as Components,
    ));
  }

  /// Create a copy of SwaggerParserScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<$Res> get config {
    return $ConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }

  /// Create a copy of SwaggerParserScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ComponentsCopyWith<$Res> get componentsBeforeParsing {
    return $ComponentsCopyWith<$Res>(_self.componentsBeforeParsing, (value) {
      return _then(_self.copyWith(componentsBeforeParsing: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SwaggerParserScreenState].
extension SwaggerParserScreenStatePatterns on SwaggerParserScreenState {
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
    TResult Function(SwaggerParserScreenStateData value)? data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SwaggerParserScreenStateData() when data != null:
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
    required TResult Function(SwaggerParserScreenStateData value) data,
  }) {
    final _that = this;
    switch (_that) {
      case SwaggerParserScreenStateData():
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
    TResult? Function(SwaggerParserScreenStateData value)? data,
  }) {
    final _that = this;
    switch (_that) {
      case SwaggerParserScreenStateData() when data != null:
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
    TResult Function(Config config, Components componentsBeforeParsing)? data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SwaggerParserScreenStateData() when data != null:
        return data(_that.config, _that.componentsBeforeParsing);
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
    required TResult Function(Config config, Components componentsBeforeParsing)
        data,
  }) {
    final _that = this;
    switch (_that) {
      case SwaggerParserScreenStateData():
        return data(_that.config, _that.componentsBeforeParsing);
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
    TResult? Function(Config config, Components componentsBeforeParsing)? data,
  }) {
    final _that = this;
    switch (_that) {
      case SwaggerParserScreenStateData() when data != null:
        return data(_that.config, _that.componentsBeforeParsing);
      case _:
        return null;
    }
  }
}

/// @nodoc

class SwaggerParserScreenStateData implements SwaggerParserScreenState {
  const SwaggerParserScreenStateData(
      {required this.config, required this.componentsBeforeParsing});

  @override
  final Config config;
  @override
  final Components componentsBeforeParsing;

  /// Create a copy of SwaggerParserScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SwaggerParserScreenStateDataCopyWith<SwaggerParserScreenStateData>
      get copyWith => _$SwaggerParserScreenStateDataCopyWithImpl<
          SwaggerParserScreenStateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SwaggerParserScreenStateData &&
            (identical(other.config, config) || other.config == config) &&
            (identical(
                    other.componentsBeforeParsing, componentsBeforeParsing) ||
                other.componentsBeforeParsing == componentsBeforeParsing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, componentsBeforeParsing);

  @override
  String toString() {
    return 'SwaggerParserScreenState.data(config: $config, componentsBeforeParsing: $componentsBeforeParsing)';
  }
}

/// @nodoc
abstract mixin class $SwaggerParserScreenStateDataCopyWith<$Res>
    implements $SwaggerParserScreenStateCopyWith<$Res> {
  factory $SwaggerParserScreenStateDataCopyWith(
          SwaggerParserScreenStateData value,
          $Res Function(SwaggerParserScreenStateData) _then) =
      _$SwaggerParserScreenStateDataCopyWithImpl;
  @override
  @useResult
  $Res call({Config config, Components componentsBeforeParsing});

  @override
  $ConfigCopyWith<$Res> get config;
  @override
  $ComponentsCopyWith<$Res> get componentsBeforeParsing;
}

/// @nodoc
class _$SwaggerParserScreenStateDataCopyWithImpl<$Res>
    implements $SwaggerParserScreenStateDataCopyWith<$Res> {
  _$SwaggerParserScreenStateDataCopyWithImpl(this._self, this._then);

  final SwaggerParserScreenStateData _self;
  final $Res Function(SwaggerParserScreenStateData) _then;

  /// Create a copy of SwaggerParserScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? config = null,
    Object? componentsBeforeParsing = null,
  }) {
    return _then(SwaggerParserScreenStateData(
      config: null == config
          ? _self.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      componentsBeforeParsing: null == componentsBeforeParsing
          ? _self.componentsBeforeParsing
          : componentsBeforeParsing // ignore: cast_nullable_to_non_nullable
              as Components,
    ));
  }

  /// Create a copy of SwaggerParserScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<$Res> get config {
    return $ConfigCopyWith<$Res>(_self.config, (value) {
      return _then(_self.copyWith(config: value));
    });
  }

  /// Create a copy of SwaggerParserScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ComponentsCopyWith<$Res> get componentsBeforeParsing {
    return $ComponentsCopyWith<$Res>(_self.componentsBeforeParsing, (value) {
      return _then(_self.copyWith(componentsBeforeParsing: value));
    });
  }
}

// dart format on
