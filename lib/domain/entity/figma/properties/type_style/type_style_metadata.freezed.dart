// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_style_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TypeStyleMetadata {
  String get fontFamily;
  num get fontWeight;
  num get fontSize;
  num get letterSpacing;

  /// Create a copy of TypeStyleMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TypeStyleMetadataCopyWith<TypeStyleMetadata> get copyWith =>
      _$TypeStyleMetadataCopyWithImpl<TypeStyleMetadata>(
          this as TypeStyleMetadata, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TypeStyleMetadata &&
            (identical(other.fontFamily, fontFamily) ||
                other.fontFamily == fontFamily) &&
            (identical(other.fontWeight, fontWeight) ||
                other.fontWeight == fontWeight) &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize) &&
            (identical(other.letterSpacing, letterSpacing) ||
                other.letterSpacing == letterSpacing));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, fontFamily, fontWeight, fontSize, letterSpacing);

  @override
  String toString() {
    return 'TypeStyleMetadata(fontFamily: $fontFamily, fontWeight: $fontWeight, fontSize: $fontSize, letterSpacing: $letterSpacing)';
  }
}

/// @nodoc
abstract mixin class $TypeStyleMetadataCopyWith<$Res> {
  factory $TypeStyleMetadataCopyWith(
          TypeStyleMetadata value, $Res Function(TypeStyleMetadata) _then) =
      _$TypeStyleMetadataCopyWithImpl;
  @useResult
  $Res call(
      {String fontFamily, num fontWeight, num fontSize, num letterSpacing});
}

/// @nodoc
class _$TypeStyleMetadataCopyWithImpl<$Res>
    implements $TypeStyleMetadataCopyWith<$Res> {
  _$TypeStyleMetadataCopyWithImpl(this._self, this._then);

  final TypeStyleMetadata _self;
  final $Res Function(TypeStyleMetadata) _then;

  /// Create a copy of TypeStyleMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontFamily = null,
    Object? fontWeight = null,
    Object? fontSize = null,
    Object? letterSpacing = null,
  }) {
    return _then(_self.copyWith(
      fontFamily: null == fontFamily
          ? _self.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String,
      fontWeight: null == fontWeight
          ? _self.fontWeight
          : fontWeight // ignore: cast_nullable_to_non_nullable
              as num,
      fontSize: null == fontSize
          ? _self.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as num,
      letterSpacing: null == letterSpacing
          ? _self.letterSpacing
          : letterSpacing // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// Adds pattern-matching-related methods to [TypeStyleMetadata].
extension TypeStyleMetadataPatterns on TypeStyleMetadata {
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
    TResult Function(_TypeStyleMetadata value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TypeStyleMetadata() when $default != null:
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
    TResult Function(_TypeStyleMetadata value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TypeStyleMetadata():
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
    TResult? Function(_TypeStyleMetadata value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TypeStyleMetadata() when $default != null:
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
    TResult Function(
            String fontFamily, num fontWeight, num fontSize, num letterSpacing)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TypeStyleMetadata() when $default != null:
        return $default(_that.fontFamily, _that.fontWeight, _that.fontSize,
            _that.letterSpacing);
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
    TResult Function(
            String fontFamily, num fontWeight, num fontSize, num letterSpacing)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TypeStyleMetadata():
        return $default(_that.fontFamily, _that.fontWeight, _that.fontSize,
            _that.letterSpacing);
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
    TResult? Function(
            String fontFamily, num fontWeight, num fontSize, num letterSpacing)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TypeStyleMetadata() when $default != null:
        return $default(_that.fontFamily, _that.fontWeight, _that.fontSize,
            _that.letterSpacing);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TypeStyleMetadata implements TypeStyleMetadata {
  const _TypeStyleMetadata(
      {required this.fontFamily,
      required this.fontWeight,
      required this.fontSize,
      required this.letterSpacing});

  @override
  final String fontFamily;
  @override
  final num fontWeight;
  @override
  final num fontSize;
  @override
  final num letterSpacing;

  /// Create a copy of TypeStyleMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TypeStyleMetadataCopyWith<_TypeStyleMetadata> get copyWith =>
      __$TypeStyleMetadataCopyWithImpl<_TypeStyleMetadata>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TypeStyleMetadata &&
            (identical(other.fontFamily, fontFamily) ||
                other.fontFamily == fontFamily) &&
            (identical(other.fontWeight, fontWeight) ||
                other.fontWeight == fontWeight) &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize) &&
            (identical(other.letterSpacing, letterSpacing) ||
                other.letterSpacing == letterSpacing));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, fontFamily, fontWeight, fontSize, letterSpacing);

  @override
  String toString() {
    return 'TypeStyleMetadata(fontFamily: $fontFamily, fontWeight: $fontWeight, fontSize: $fontSize, letterSpacing: $letterSpacing)';
  }
}

/// @nodoc
abstract mixin class _$TypeStyleMetadataCopyWith<$Res>
    implements $TypeStyleMetadataCopyWith<$Res> {
  factory _$TypeStyleMetadataCopyWith(
          _TypeStyleMetadata value, $Res Function(_TypeStyleMetadata) _then) =
      __$TypeStyleMetadataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String fontFamily, num fontWeight, num fontSize, num letterSpacing});
}

/// @nodoc
class __$TypeStyleMetadataCopyWithImpl<$Res>
    implements _$TypeStyleMetadataCopyWith<$Res> {
  __$TypeStyleMetadataCopyWithImpl(this._self, this._then);

  final _TypeStyleMetadata _self;
  final $Res Function(_TypeStyleMetadata) _then;

  /// Create a copy of TypeStyleMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fontFamily = null,
    Object? fontWeight = null,
    Object? fontSize = null,
    Object? letterSpacing = null,
  }) {
    return _then(_TypeStyleMetadata(
      fontFamily: null == fontFamily
          ? _self.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String,
      fontWeight: null == fontWeight
          ? _self.fontWeight
          : fontWeight // ignore: cast_nullable_to_non_nullable
              as num,
      fontSize: null == fontSize
          ? _self.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as num,
      letterSpacing: null == letterSpacing
          ? _self.letterSpacing
          : letterSpacing // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

// dart format on
