// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ColorProperty {
  double get r;
  double get g;
  double get b;
  double get a;

  /// Create a copy of ColorProperty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ColorPropertyCopyWith<ColorProperty> get copyWith =>
      _$ColorPropertyCopyWithImpl<ColorProperty>(
          this as ColorProperty, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ColorProperty &&
            (identical(other.r, r) || other.r == r) &&
            (identical(other.g, g) || other.g == g) &&
            (identical(other.b, b) || other.b == b) &&
            (identical(other.a, a) || other.a == a));
  }

  @override
  int get hashCode => Object.hash(runtimeType, r, g, b, a);

  @override
  String toString() {
    return 'ColorProperty(r: $r, g: $g, b: $b, a: $a)';
  }
}

/// @nodoc
abstract mixin class $ColorPropertyCopyWith<$Res> {
  factory $ColorPropertyCopyWith(
          ColorProperty value, $Res Function(ColorProperty) _then) =
      _$ColorPropertyCopyWithImpl;
  @useResult
  $Res call({double r, double g, double b, double a});
}

/// @nodoc
class _$ColorPropertyCopyWithImpl<$Res>
    implements $ColorPropertyCopyWith<$Res> {
  _$ColorPropertyCopyWithImpl(this._self, this._then);

  final ColorProperty _self;
  final $Res Function(ColorProperty) _then;

  /// Create a copy of ColorProperty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? r = null,
    Object? g = null,
    Object? b = null,
    Object? a = null,
  }) {
    return _then(_self.copyWith(
      r: null == r
          ? _self.r
          : r // ignore: cast_nullable_to_non_nullable
              as double,
      g: null == g
          ? _self.g
          : g // ignore: cast_nullable_to_non_nullable
              as double,
      b: null == b
          ? _self.b
          : b // ignore: cast_nullable_to_non_nullable
              as double,
      a: null == a
          ? _self.a
          : a // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [ColorProperty].
extension ColorPropertyPatterns on ColorProperty {
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
    TResult Function(_ColorProperty value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ColorProperty() when $default != null:
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
    TResult Function(_ColorProperty value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ColorProperty():
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
    TResult? Function(_ColorProperty value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ColorProperty() when $default != null:
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
    TResult Function(double r, double g, double b, double a)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ColorProperty() when $default != null:
        return $default(_that.r, _that.g, _that.b, _that.a);
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
    TResult Function(double r, double g, double b, double a) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ColorProperty():
        return $default(_that.r, _that.g, _that.b, _that.a);
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
    TResult? Function(double r, double g, double b, double a)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ColorProperty() when $default != null:
        return $default(_that.r, _that.g, _that.b, _that.a);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ColorProperty implements ColorProperty {
  const _ColorProperty(
      {required this.r, required this.g, required this.b, required this.a});

  @override
  final double r;
  @override
  final double g;
  @override
  final double b;
  @override
  final double a;

  /// Create a copy of ColorProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ColorPropertyCopyWith<_ColorProperty> get copyWith =>
      __$ColorPropertyCopyWithImpl<_ColorProperty>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ColorProperty &&
            (identical(other.r, r) || other.r == r) &&
            (identical(other.g, g) || other.g == g) &&
            (identical(other.b, b) || other.b == b) &&
            (identical(other.a, a) || other.a == a));
  }

  @override
  int get hashCode => Object.hash(runtimeType, r, g, b, a);

  @override
  String toString() {
    return 'ColorProperty(r: $r, g: $g, b: $b, a: $a)';
  }
}

/// @nodoc
abstract mixin class _$ColorPropertyCopyWith<$Res>
    implements $ColorPropertyCopyWith<$Res> {
  factory _$ColorPropertyCopyWith(
          _ColorProperty value, $Res Function(_ColorProperty) _then) =
      __$ColorPropertyCopyWithImpl;
  @override
  @useResult
  $Res call({double r, double g, double b, double a});
}

/// @nodoc
class __$ColorPropertyCopyWithImpl<$Res>
    implements _$ColorPropertyCopyWith<$Res> {
  __$ColorPropertyCopyWithImpl(this._self, this._then);

  final _ColorProperty _self;
  final $Res Function(_ColorProperty) _then;

  /// Create a copy of ColorProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? r = null,
    Object? g = null,
    Object? b = null,
    Object? a = null,
  }) {
    return _then(_ColorProperty(
      r: null == r
          ? _self.r
          : r // ignore: cast_nullable_to_non_nullable
              as double,
      g: null == g
          ? _self.g
          : g // ignore: cast_nullable_to_non_nullable
              as double,
      b: null == b
          ? _self.b
          : b // ignore: cast_nullable_to_non_nullable
              as double,
      a: null == a
          ? _self.a
          : a // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
