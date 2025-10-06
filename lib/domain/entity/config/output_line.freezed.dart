// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'output_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OutputLine {
  String get line;
  Color get color;
  OutputType get tag;

  /// Create a copy of OutputLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OutputLineCopyWith<OutputLine> get copyWith =>
      _$OutputLineCopyWithImpl<OutputLine>(this as OutputLine, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutputLine &&
            (identical(other.line, line) || other.line == line) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, line, color, tag);

  @override
  String toString() {
    return 'OutputLine(line: $line, color: $color, tag: $tag)';
  }
}

/// @nodoc
abstract mixin class $OutputLineCopyWith<$Res> {
  factory $OutputLineCopyWith(
          OutputLine value, $Res Function(OutputLine) _then) =
      _$OutputLineCopyWithImpl;
  @useResult
  $Res call({String line, Color color, OutputType tag});
}

/// @nodoc
class _$OutputLineCopyWithImpl<$Res> implements $OutputLineCopyWith<$Res> {
  _$OutputLineCopyWithImpl(this._self, this._then);

  final OutputLine _self;
  final $Res Function(OutputLine) _then;

  /// Create a copy of OutputLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line = null,
    Object? color = null,
    Object? tag = null,
  }) {
    return _then(_self.copyWith(
      line: null == line
          ? _self.line
          : line // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as OutputType,
    ));
  }
}

/// Adds pattern-matching-related methods to [OutputLine].
extension OutputLinePatterns on OutputLine {
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
    TResult Function(_OutputLine value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OutputLine() when $default != null:
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
    TResult Function(_OutputLine value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputLine():
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
    TResult? Function(_OutputLine value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputLine() when $default != null:
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
    TResult Function(String line, Color color, OutputType tag)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OutputLine() when $default != null:
        return $default(_that.line, _that.color, _that.tag);
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
    TResult Function(String line, Color color, OutputType tag) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputLine():
        return $default(_that.line, _that.color, _that.tag);
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
    TResult? Function(String line, Color color, OutputType tag)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OutputLine() when $default != null:
        return $default(_that.line, _that.color, _that.tag);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OutputLine implements OutputLine {
  const _OutputLine(
      {required this.line, required this.color, required this.tag});

  @override
  final String line;
  @override
  final Color color;
  @override
  final OutputType tag;

  /// Create a copy of OutputLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OutputLineCopyWith<_OutputLine> get copyWith =>
      __$OutputLineCopyWithImpl<_OutputLine>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OutputLine &&
            (identical(other.line, line) || other.line == line) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, line, color, tag);

  @override
  String toString() {
    return 'OutputLine(line: $line, color: $color, tag: $tag)';
  }
}

/// @nodoc
abstract mixin class _$OutputLineCopyWith<$Res>
    implements $OutputLineCopyWith<$Res> {
  factory _$OutputLineCopyWith(
          _OutputLine value, $Res Function(_OutputLine) _then) =
      __$OutputLineCopyWithImpl;
  @override
  @useResult
  $Res call({String line, Color color, OutputType tag});
}

/// @nodoc
class __$OutputLineCopyWithImpl<$Res> implements _$OutputLineCopyWith<$Res> {
  __$OutputLineCopyWithImpl(this._self, this._then);

  final _OutputLine _self;
  final $Res Function(_OutputLine) _then;

  /// Create a copy of OutputLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? line = null,
    Object? color = null,
    Object? tag = null,
  }) {
    return _then(_OutputLine(
      line: null == line
          ? _self.line
          : line // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as OutputType,
    ));
  }
}

// dart format on
