// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node_style_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NodeStyleProperty {
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  NodeStyleType get style => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NodeStylePropertyCopyWith<NodeStyleProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeStylePropertyCopyWith<$Res> {
  factory $NodeStylePropertyCopyWith(
          NodeStyleProperty value, $Res Function(NodeStyleProperty) then) =
      _$NodeStylePropertyCopyWithImpl<$Res, NodeStyleProperty>;
  @useResult
  $Res call({String key, String name, String description, NodeStyleType style});
}

/// @nodoc
class _$NodeStylePropertyCopyWithImpl<$Res, $Val extends NodeStyleProperty>
    implements $NodeStylePropertyCopyWith<$Res> {
  _$NodeStylePropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? description = null,
    Object? style = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as NodeStyleType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NodeStylePropertyImplCopyWith<$Res>
    implements $NodeStylePropertyCopyWith<$Res> {
  factory _$$NodeStylePropertyImplCopyWith(_$NodeStylePropertyImpl value,
          $Res Function(_$NodeStylePropertyImpl) then) =
      __$$NodeStylePropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, String name, String description, NodeStyleType style});
}

/// @nodoc
class __$$NodeStylePropertyImplCopyWithImpl<$Res>
    extends _$NodeStylePropertyCopyWithImpl<$Res, _$NodeStylePropertyImpl>
    implements _$$NodeStylePropertyImplCopyWith<$Res> {
  __$$NodeStylePropertyImplCopyWithImpl(_$NodeStylePropertyImpl _value,
      $Res Function(_$NodeStylePropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? description = null,
    Object? style = null,
  }) {
    return _then(_$NodeStylePropertyImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as NodeStyleType,
    ));
  }
}

/// @nodoc

class _$NodeStylePropertyImpl implements _NodeStyleProperty {
  const _$NodeStylePropertyImpl(
      {required this.key,
      required this.name,
      required this.description,
      required this.style});

  @override
  final String key;
  @override
  final String name;
  @override
  final String description;
  @override
  final NodeStyleType style;

  @override
  String toString() {
    return 'NodeStyleProperty(key: $key, name: $name, description: $description, style: $style)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NodeStylePropertyImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.style, style) || other.style == style));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, name, description, style);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NodeStylePropertyImplCopyWith<_$NodeStylePropertyImpl> get copyWith =>
      __$$NodeStylePropertyImplCopyWithImpl<_$NodeStylePropertyImpl>(
          this, _$identity);
}

abstract class _NodeStyleProperty implements NodeStyleProperty {
  const factory _NodeStyleProperty(
      {required final String key,
      required final String name,
      required final String description,
      required final NodeStyleType style}) = _$NodeStylePropertyImpl;

  @override
  String get key;
  @override
  String get name;
  @override
  String get description;
  @override
  NodeStyleType get style;
  @override
  @JsonKey(ignore: true)
  _$$NodeStylePropertyImplCopyWith<_$NodeStylePropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
