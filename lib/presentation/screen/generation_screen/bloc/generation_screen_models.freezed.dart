// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generation_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenerationScreenEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GenerationScreenEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GenerationScreenEvent()';
  }
}

/// @nodoc
class $GenerationScreenEventCopyWith<$Res> {
  $GenerationScreenEventCopyWith(
      GenerationScreenEvent _, $Res Function(GenerationScreenEvent) __);
}

/// Adds pattern-matching-related methods to [GenerationScreenEvent].
extension GenerationScreenEventPatterns on GenerationScreenEvent {
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
    TResult Function(GenerationScreenEventInit value)? init,
    TResult Function(GenerationScreenEventGenerateProject value)?
        generateProject,
    TResult Function(GenerationScreenEventOpenProject value)? open,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GenerationScreenEventInit() when init != null:
        return init(_that);
      case GenerationScreenEventGenerateProject() when generateProject != null:
        return generateProject(_that);
      case GenerationScreenEventOpenProject() when open != null:
        return open(_that);
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
    required TResult Function(GenerationScreenEventInit value) init,
    required TResult Function(GenerationScreenEventGenerateProject value)
        generateProject,
    required TResult Function(GenerationScreenEventOpenProject value) open,
  }) {
    final _that = this;
    switch (_that) {
      case GenerationScreenEventInit():
        return init(_that);
      case GenerationScreenEventGenerateProject():
        return generateProject(_that);
      case GenerationScreenEventOpenProject():
        return open(_that);
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
    TResult? Function(GenerationScreenEventInit value)? init,
    TResult? Function(GenerationScreenEventGenerateProject value)?
        generateProject,
    TResult? Function(GenerationScreenEventOpenProject value)? open,
  }) {
    final _that = this;
    switch (_that) {
      case GenerationScreenEventInit() when init != null:
        return init(_that);
      case GenerationScreenEventGenerateProject() when generateProject != null:
        return generateProject(_that);
      case GenerationScreenEventOpenProject() when open != null:
        return open(_that);
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
    TResult Function()? generateProject,
    TResult Function()? open,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GenerationScreenEventInit() when init != null:
        return init();
      case GenerationScreenEventGenerateProject() when generateProject != null:
        return generateProject();
      case GenerationScreenEventOpenProject() when open != null:
        return open();
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
    required TResult Function() generateProject,
    required TResult Function() open,
  }) {
    final _that = this;
    switch (_that) {
      case GenerationScreenEventInit():
        return init();
      case GenerationScreenEventGenerateProject():
        return generateProject();
      case GenerationScreenEventOpenProject():
        return open();
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
    TResult? Function()? generateProject,
    TResult? Function()? open,
  }) {
    final _that = this;
    switch (_that) {
      case GenerationScreenEventInit() when init != null:
        return init();
      case GenerationScreenEventGenerateProject() when generateProject != null:
        return generateProject();
      case GenerationScreenEventOpenProject() when open != null:
        return open();
      case _:
        return null;
    }
  }
}

/// @nodoc

class GenerationScreenEventInit implements GenerationScreenEvent {
  const GenerationScreenEventInit();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenerationScreenEventInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GenerationScreenEvent.init()';
  }
}

/// @nodoc

class GenerationScreenEventGenerateProject implements GenerationScreenEvent {
  const GenerationScreenEventGenerateProject();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenerationScreenEventGenerateProject);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GenerationScreenEvent.generateProject()';
  }
}

/// @nodoc

class GenerationScreenEventOpenProject implements GenerationScreenEvent {
  const GenerationScreenEventOpenProject();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenerationScreenEventOpenProject);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GenerationScreenEvent.open()';
  }
}

/// @nodoc
mixin _$GenerationScreenSR {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GenerationScreenSR);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GenerationScreenSR()';
  }
}

/// @nodoc
class $GenerationScreenSRCopyWith<$Res> {
  $GenerationScreenSRCopyWith(
      GenerationScreenSR _, $Res Function(GenerationScreenSR) __);
}

/// Adds pattern-matching-related methods to [GenerationScreenSR].
extension GenerationScreenSRPatterns on GenerationScreenSR {
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
    TResult Function(_StubSR value)? stub,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StubSR() when stub != null:
        return stub(_that);
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
    required TResult Function(_StubSR value) stub,
  }) {
    final _that = this;
    switch (_that) {
      case _StubSR():
        return stub(_that);
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
    TResult? Function(_StubSR value)? stub,
  }) {
    final _that = this;
    switch (_that) {
      case _StubSR() when stub != null:
        return stub(_that);
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
    TResult Function()? stub,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StubSR() when stub != null:
        return stub();
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
    required TResult Function() stub,
  }) {
    final _that = this;
    switch (_that) {
      case _StubSR():
        return stub();
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
    TResult? Function()? stub,
  }) {
    final _that = this;
    switch (_that) {
      case _StubSR() when stub != null:
        return stub();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StubSR implements GenerationScreenSR {
  const _StubSR();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _StubSR);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GenerationScreenSR.stub()';
  }
}

/// @nodoc
mixin _$GenerationScreenState {
  GeneratingState get generatingState;
  Stream<List<OutputLine>>? get outputStream;

  /// Create a copy of GenerationScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenerationScreenStateCopyWith<GenerationScreenState> get copyWith =>
      _$GenerationScreenStateCopyWithImpl<GenerationScreenState>(
          this as GenerationScreenState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenerationScreenState &&
            (identical(other.generatingState, generatingState) ||
                other.generatingState == generatingState) &&
            (identical(other.outputStream, outputStream) ||
                other.outputStream == outputStream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, generatingState, outputStream);

  @override
  String toString() {
    return 'GenerationScreenState(generatingState: $generatingState, outputStream: $outputStream)';
  }
}

/// @nodoc
abstract mixin class $GenerationScreenStateCopyWith<$Res> {
  factory $GenerationScreenStateCopyWith(GenerationScreenState value,
          $Res Function(GenerationScreenState) _then) =
      _$GenerationScreenStateCopyWithImpl;
  @useResult
  $Res call(
      {GeneratingState generatingState,
      Stream<List<OutputLine>>? outputStream});
}

/// @nodoc
class _$GenerationScreenStateCopyWithImpl<$Res>
    implements $GenerationScreenStateCopyWith<$Res> {
  _$GenerationScreenStateCopyWithImpl(this._self, this._then);

  final GenerationScreenState _self;
  final $Res Function(GenerationScreenState) _then;

  /// Create a copy of GenerationScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatingState = null,
    Object? outputStream = freezed,
  }) {
    return _then(_self.copyWith(
      generatingState: null == generatingState
          ? _self.generatingState
          : generatingState // ignore: cast_nullable_to_non_nullable
              as GeneratingState,
      outputStream: freezed == outputStream
          ? _self.outputStream
          : outputStream // ignore: cast_nullable_to_non_nullable
              as Stream<List<OutputLine>>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [GenerationScreenState].
extension GenerationScreenStatePatterns on GenerationScreenState {
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
    TResult Function(GenerationScreenStateData value)? data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GenerationScreenStateData() when data != null:
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
    required TResult Function(GenerationScreenStateData value) data,
  }) {
    final _that = this;
    switch (_that) {
      case GenerationScreenStateData():
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
    TResult? Function(GenerationScreenStateData value)? data,
  }) {
    final _that = this;
    switch (_that) {
      case GenerationScreenStateData() when data != null:
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
    TResult Function(GeneratingState generatingState,
            Stream<List<OutputLine>>? outputStream)?
        data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GenerationScreenStateData() when data != null:
        return data(_that.generatingState, _that.outputStream);
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
    required TResult Function(GeneratingState generatingState,
            Stream<List<OutputLine>>? outputStream)
        data,
  }) {
    final _that = this;
    switch (_that) {
      case GenerationScreenStateData():
        return data(_that.generatingState, _that.outputStream);
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
    TResult? Function(GeneratingState generatingState,
            Stream<List<OutputLine>>? outputStream)?
        data,
  }) {
    final _that = this;
    switch (_that) {
      case GenerationScreenStateData() when data != null:
        return data(_that.generatingState, _that.outputStream);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GenerationScreenStateData implements GenerationScreenState {
  const GenerationScreenStateData(
      {this.generatingState = GeneratingState.init, this.outputStream});

  @override
  @JsonKey()
  final GeneratingState generatingState;
  @override
  final Stream<List<OutputLine>>? outputStream;

  /// Create a copy of GenerationScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenerationScreenStateDataCopyWith<GenerationScreenStateData> get copyWith =>
      _$GenerationScreenStateDataCopyWithImpl<GenerationScreenStateData>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenerationScreenStateData &&
            (identical(other.generatingState, generatingState) ||
                other.generatingState == generatingState) &&
            (identical(other.outputStream, outputStream) ||
                other.outputStream == outputStream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, generatingState, outputStream);

  @override
  String toString() {
    return 'GenerationScreenState.data(generatingState: $generatingState, outputStream: $outputStream)';
  }
}

/// @nodoc
abstract mixin class $GenerationScreenStateDataCopyWith<$Res>
    implements $GenerationScreenStateCopyWith<$Res> {
  factory $GenerationScreenStateDataCopyWith(GenerationScreenStateData value,
          $Res Function(GenerationScreenStateData) _then) =
      _$GenerationScreenStateDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {GeneratingState generatingState,
      Stream<List<OutputLine>>? outputStream});
}

/// @nodoc
class _$GenerationScreenStateDataCopyWithImpl<$Res>
    implements $GenerationScreenStateDataCopyWith<$Res> {
  _$GenerationScreenStateDataCopyWithImpl(this._self, this._then);

  final GenerationScreenStateData _self;
  final $Res Function(GenerationScreenStateData) _then;

  /// Create a copy of GenerationScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? generatingState = null,
    Object? outputStream = freezed,
  }) {
    return _then(GenerationScreenStateData(
      generatingState: null == generatingState
          ? _self.generatingState
          : generatingState // ignore: cast_nullable_to_non_nullable
              as GeneratingState,
      outputStream: freezed == outputStream
          ? _self.outputStream
          : outputStream // ignore: cast_nullable_to_non_nullable
              as Stream<List<OutputLine>>?,
    ));
  }
}

// dart format on
