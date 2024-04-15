// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paint_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaintProperty {
  ColorProperty get color => throw _privateConstructorUsedError;
  PaintPropertyType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaintPropertyCopyWith<PaintProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaintPropertyCopyWith<$Res> {
  factory $PaintPropertyCopyWith(
          PaintProperty value, $Res Function(PaintProperty) then) =
      _$PaintPropertyCopyWithImpl<$Res, PaintProperty>;
  @useResult
  $Res call({ColorProperty color, PaintPropertyType type});

  $ColorPropertyCopyWith<$Res> get color;
}

/// @nodoc
class _$PaintPropertyCopyWithImpl<$Res, $Val extends PaintProperty>
    implements $PaintPropertyCopyWith<$Res> {
  _$PaintPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorProperty,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaintPropertyType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ColorPropertyCopyWith<$Res> get color {
    return $ColorPropertyCopyWith<$Res>(_value.color, (value) {
      return _then(_value.copyWith(color: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaintPropertyImplCopyWith<$Res>
    implements $PaintPropertyCopyWith<$Res> {
  factory _$$PaintPropertyImplCopyWith(
          _$PaintPropertyImpl value, $Res Function(_$PaintPropertyImpl) then) =
      __$$PaintPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ColorProperty color, PaintPropertyType type});

  @override
  $ColorPropertyCopyWith<$Res> get color;
}

/// @nodoc
class __$$PaintPropertyImplCopyWithImpl<$Res>
    extends _$PaintPropertyCopyWithImpl<$Res, _$PaintPropertyImpl>
    implements _$$PaintPropertyImplCopyWith<$Res> {
  __$$PaintPropertyImplCopyWithImpl(
      _$PaintPropertyImpl _value, $Res Function(_$PaintPropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? type = null,
  }) {
    return _then(_$PaintPropertyImpl(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorProperty,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaintPropertyType,
    ));
  }
}

/// @nodoc

class _$PaintPropertyImpl implements _PaintProperty {
  const _$PaintPropertyImpl({required this.color, required this.type});

  @override
  final ColorProperty color;
  @override
  final PaintPropertyType type;

  @override
  String toString() {
    return 'PaintProperty(color: $color, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaintPropertyImpl &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaintPropertyImplCopyWith<_$PaintPropertyImpl> get copyWith =>
      __$$PaintPropertyImplCopyWithImpl<_$PaintPropertyImpl>(this, _$identity);
}

abstract class _PaintProperty implements PaintProperty {
  const factory _PaintProperty(
      {required final ColorProperty color,
      required final PaintPropertyType type}) = _$PaintPropertyImpl;

  @override
  ColorProperty get color;
  @override
  PaintPropertyType get type;
  @override
  @JsonKey(ignore: true)
  _$$PaintPropertyImplCopyWith<_$PaintPropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
