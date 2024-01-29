// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connector_node_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectorNodeEntity {
  String get id => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<PaintProperty> get fills => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectorNodeEntityCopyWith<ConnectorNodeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectorNodeEntityCopyWith<$Res> {
  factory $ConnectorNodeEntityCopyWith(
          ConnectorNodeEntity value, $Res Function(ConnectorNodeEntity) then) =
      _$ConnectorNodeEntityCopyWithImpl<$Res, ConnectorNodeEntity>;
  @useResult
  $Res call(
      {String id,
      String key,
      String name,
      String type,
      List<PaintProperty> fills});
}

/// @nodoc
class _$ConnectorNodeEntityCopyWithImpl<$Res, $Val extends ConnectorNodeEntity>
    implements $ConnectorNodeEntityCopyWith<$Res> {
  _$ConnectorNodeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$ConnectorNodeEntityImplCopyWith<$Res>
    implements $ConnectorNodeEntityCopyWith<$Res> {
  factory _$$ConnectorNodeEntityImplCopyWith(_$ConnectorNodeEntityImpl value,
          $Res Function(_$ConnectorNodeEntityImpl) then) =
      __$$ConnectorNodeEntityImplCopyWithImpl<$Res>;
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
class __$$ConnectorNodeEntityImplCopyWithImpl<$Res>
    extends _$ConnectorNodeEntityCopyWithImpl<$Res, _$ConnectorNodeEntityImpl>
    implements _$$ConnectorNodeEntityImplCopyWith<$Res> {
  __$$ConnectorNodeEntityImplCopyWithImpl(_$ConnectorNodeEntityImpl _value,
      $Res Function(_$ConnectorNodeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
    Object? fills = null,
  }) {
    return _then(_$ConnectorNodeEntityImpl(
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

class _$ConnectorNodeEntityImpl implements _ConnectorNodeEntity {
  const _$ConnectorNodeEntityImpl(
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
    return 'ConnectorNodeEntity(id: $id, key: $key, name: $name, type: $type, fills: $fills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectorNodeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._fills, _fills));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, key, name, type,
      const DeepCollectionEquality().hash(_fills));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectorNodeEntityImplCopyWith<_$ConnectorNodeEntityImpl> get copyWith =>
      __$$ConnectorNodeEntityImplCopyWithImpl<_$ConnectorNodeEntityImpl>(
          this, _$identity);
}

abstract class _ConnectorNodeEntity implements ConnectorNodeEntity {
  const factory _ConnectorNodeEntity(
      {required final String id,
      required final String key,
      required final String name,
      required final String type,
      required final List<PaintProperty> fills}) = _$ConnectorNodeEntityImpl;

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
  @override
  @JsonKey(ignore: true)
  _$$ConnectorNodeEntityImplCopyWith<_$ConnectorNodeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
