// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vector_node_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VectorNodeEntity {
  String get id => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<PaintProperty> get fills => throw _privateConstructorUsedError;

  /// Create a copy of VectorNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VectorNodeEntityCopyWith<VectorNodeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VectorNodeEntityCopyWith<$Res> {
  factory $VectorNodeEntityCopyWith(
          VectorNodeEntity value, $Res Function(VectorNodeEntity) then) =
      _$VectorNodeEntityCopyWithImpl<$Res, VectorNodeEntity>;
  @useResult
  $Res call(
      {String id,
      String key,
      String name,
      String type,
      List<PaintProperty> fills});
}

/// @nodoc
class _$VectorNodeEntityCopyWithImpl<$Res, $Val extends VectorNodeEntity>
    implements $VectorNodeEntityCopyWith<$Res> {
  _$VectorNodeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VectorNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
    Object? fills = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      fills: null == fills
          ? _value.fills
          : fills // ignore: cast_nullable_to_non_nullable
              as List<PaintProperty>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VectorNodeEntityImplCopyWith<$Res>
    implements $VectorNodeEntityCopyWith<$Res> {
  factory _$$VectorNodeEntityImplCopyWith(_$VectorNodeEntityImpl value,
          $Res Function(_$VectorNodeEntityImpl) then) =
      __$$VectorNodeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String key,
      String name,
      String type,
      List<PaintProperty> fills});
}

/// @nodoc
class __$$VectorNodeEntityImplCopyWithImpl<$Res>
    extends _$VectorNodeEntityCopyWithImpl<$Res, _$VectorNodeEntityImpl>
    implements _$$VectorNodeEntityImplCopyWith<$Res> {
  __$$VectorNodeEntityImplCopyWithImpl(_$VectorNodeEntityImpl _value,
      $Res Function(_$VectorNodeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of VectorNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
    Object? fills = null,
  }) {
    return _then(_$VectorNodeEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      fills: null == fills
          ? _value._fills
          : fills // ignore: cast_nullable_to_non_nullable
              as List<PaintProperty>,
    ));
  }
}

/// @nodoc

class _$VectorNodeEntityImpl implements _VectorNodeEntity {
  const _$VectorNodeEntityImpl(
      {required this.id,
      required this.key,
      required this.name,
      required this.type,
      required final List<PaintProperty> fills})
      : _fills = fills;

  @override
  final String id;
  @override
  final String key;
  @override
  final String name;
  @override
  final String type;
  final List<PaintProperty> _fills;
  @override
  List<PaintProperty> get fills {
    if (_fills is EqualUnmodifiableListView) return _fills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fills);
  }

  @override
  String toString() {
    return 'VectorNodeEntity(id: $id, key: $key, name: $name, type: $type, fills: $fills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VectorNodeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._fills, _fills));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, key, name, type,
      const DeepCollectionEquality().hash(_fills));

  /// Create a copy of VectorNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VectorNodeEntityImplCopyWith<_$VectorNodeEntityImpl> get copyWith =>
      __$$VectorNodeEntityImplCopyWithImpl<_$VectorNodeEntityImpl>(
          this, _$identity);
}

abstract class _VectorNodeEntity implements VectorNodeEntity {
  const factory _VectorNodeEntity(
      {required final String id,
      required final String key,
      required final String name,
      required final String type,
      required final List<PaintProperty> fills}) = _$VectorNodeEntityImpl;

  @override
  String get id;
  @override
  String get key;
  @override
  String get name;
  @override
  String get type;
  @override
  List<PaintProperty> get fills;

  /// Create a copy of VectorNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VectorNodeEntityImplCopyWith<_$VectorNodeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
