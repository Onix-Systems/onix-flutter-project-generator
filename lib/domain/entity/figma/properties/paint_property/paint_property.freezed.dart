// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paint_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaintProperty {
  ColorProperty get color;
  PaintPropertyType get type;

  /// Create a copy of PaintProperty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaintPropertyCopyWith<PaintProperty> get copyWith =>
      _$PaintPropertyCopyWithImpl<PaintProperty>(
          this as PaintProperty, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaintProperty &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, type);

  @override
  String toString() {
    return 'PaintProperty(color: $color, type: $type)';
  }
}

/// @nodoc
abstract mixin class $PaintPropertyCopyWith<$Res> {
  factory $PaintPropertyCopyWith(
          PaintProperty value, $Res Function(PaintProperty) _then) =
      _$PaintPropertyCopyWithImpl;
  @useResult
  $Res call({ColorProperty color, PaintPropertyType type});

  $ColorPropertyCopyWith<$Res> get color;
}

/// @nodoc
class _$PaintPropertyCopyWithImpl<$Res>
    implements $PaintPropertyCopyWith<$Res> {
  _$PaintPropertyCopyWithImpl(this._self, this._then);

  final PaintProperty _self;
  final $Res Function(PaintProperty) _then;

  /// Create a copy of PaintProperty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorProperty,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaintPropertyType,
    ));
  }

  /// Create a copy of PaintProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ColorPropertyCopyWith<$Res> get color {
    return $ColorPropertyCopyWith<$Res>(_self.color, (value) {
      return _then(_self.copyWith(color: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PaintProperty].
extension PaintPropertyPatterns on PaintProperty {
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
    TResult Function(_PaintProperty value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaintProperty() when $default != null:
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
    TResult Function(_PaintProperty value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaintProperty():
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
    TResult? Function(_PaintProperty value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaintProperty() when $default != null:
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
    TResult Function(ColorProperty color, PaintPropertyType type)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaintProperty() when $default != null:
        return $default(_that.color, _that.type);
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
    TResult Function(ColorProperty color, PaintPropertyType type) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaintProperty():
        return $default(_that.color, _that.type);
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
    TResult? Function(ColorProperty color, PaintPropertyType type)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaintProperty() when $default != null:
        return $default(_that.color, _that.type);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PaintProperty implements PaintProperty {
  const _PaintProperty({required this.color, required this.type});

  @override
  final ColorProperty color;
  @override
  final PaintPropertyType type;

  /// Create a copy of PaintProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaintPropertyCopyWith<_PaintProperty> get copyWith =>
      __$PaintPropertyCopyWithImpl<_PaintProperty>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaintProperty &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, type);

  @override
  String toString() {
    return 'PaintProperty(color: $color, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$PaintPropertyCopyWith<$Res>
    implements $PaintPropertyCopyWith<$Res> {
  factory _$PaintPropertyCopyWith(
          _PaintProperty value, $Res Function(_PaintProperty) _then) =
      __$PaintPropertyCopyWithImpl;
  @override
  @useResult
  $Res call({ColorProperty color, PaintPropertyType type});

  @override
  $ColorPropertyCopyWith<$Res> get color;
}

/// @nodoc
class __$PaintPropertyCopyWithImpl<$Res>
    implements _$PaintPropertyCopyWith<$Res> {
  __$PaintPropertyCopyWithImpl(this._self, this._then);

  final _PaintProperty _self;
  final $Res Function(_PaintProperty) _then;

  /// Create a copy of PaintProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? color = null,
    Object? type = null,
  }) {
    return _then(_PaintProperty(
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorProperty,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaintPropertyType,
    ));
  }

  /// Create a copy of PaintProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ColorPropertyCopyWith<$Res> get color {
    return $ColorPropertyCopyWith<$Res>(_self.color, (value) {
      return _then(_self.copyWith(color: value));
    });
  }
}

// dart format on
