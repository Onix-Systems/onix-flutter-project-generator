// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ColorProperty {
  double get r => throw _privateConstructorUsedError;
  double get g => throw _privateConstructorUsedError;
  double get b => throw _privateConstructorUsedError;
  double get a => throw _privateConstructorUsedError;

  /// Create a copy of ColorProperty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorPropertyCopyWith<ColorProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorPropertyCopyWith<$Res> {
  factory $ColorPropertyCopyWith(
          ColorProperty value, $Res Function(ColorProperty) then) =
      _$ColorPropertyCopyWithImpl<$Res, ColorProperty>;
  @useResult
  $Res call({double r, double g, double b, double a});
}

/// @nodoc
class _$ColorPropertyCopyWithImpl<$Res, $Val extends ColorProperty>
    implements $ColorPropertyCopyWith<$Res> {
  _$ColorPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      r: null == r
          ? _value.r
          : r // ignore: cast_nullable_to_non_nullable
              as double,
      g: null == g
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as double,
      b: null == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as double,
      a: null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorPropertyImplCopyWith<$Res>
    implements $ColorPropertyCopyWith<$Res> {
  factory _$$ColorPropertyImplCopyWith(
          _$ColorPropertyImpl value, $Res Function(_$ColorPropertyImpl) then) =
      __$$ColorPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double r, double g, double b, double a});
}

/// @nodoc
class __$$ColorPropertyImplCopyWithImpl<$Res>
    extends _$ColorPropertyCopyWithImpl<$Res, _$ColorPropertyImpl>
    implements _$$ColorPropertyImplCopyWith<$Res> {
  __$$ColorPropertyImplCopyWithImpl(
      _$ColorPropertyImpl _value, $Res Function(_$ColorPropertyImpl) _then)
      : super(_value, _then);

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
    return _then(_$ColorPropertyImpl(
      r: null == r
          ? _value.r
          : r // ignore: cast_nullable_to_non_nullable
              as double,
      g: null == g
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as double,
      b: null == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as double,
      a: null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ColorPropertyImpl implements _ColorProperty {
  const _$ColorPropertyImpl(
      {required this.r, required this.g, required this.b, required this.a});

  @override
  final double r;
  @override
  final double g;
  @override
  final double b;
  @override
  final double a;

  @override
  String toString() {
    return 'ColorProperty(r: $r, g: $g, b: $b, a: $a)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorPropertyImpl &&
            (identical(other.r, r) || other.r == r) &&
            (identical(other.g, g) || other.g == g) &&
            (identical(other.b, b) || other.b == b) &&
            (identical(other.a, a) || other.a == a));
  }

  @override
  int get hashCode => Object.hash(runtimeType, r, g, b, a);

  /// Create a copy of ColorProperty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorPropertyImplCopyWith<_$ColorPropertyImpl> get copyWith =>
      __$$ColorPropertyImplCopyWithImpl<_$ColorPropertyImpl>(this, _$identity);
}

abstract class _ColorProperty implements ColorProperty {
  const factory _ColorProperty(
      {required final double r,
      required final double g,
      required final double b,
      required final double a}) = _$ColorPropertyImpl;

  @override
  double get r;
  @override
  double get g;
  @override
  double get b;
  @override
  double get a;

  /// Create a copy of ColorProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorPropertyImplCopyWith<_$ColorPropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
