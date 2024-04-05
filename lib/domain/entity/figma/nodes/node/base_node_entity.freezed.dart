// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_node_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseNodeEntity {
  String get id => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BaseNodeEntityCopyWith<BaseNodeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseNodeEntityCopyWith<$Res> {
  factory $BaseNodeEntityCopyWith(
          BaseNodeEntity value, $Res Function(BaseNodeEntity) then) =
      _$BaseNodeEntityCopyWithImpl<$Res, BaseNodeEntity>;
  @useResult
  $Res call({String id, String key, String name, String type});
}

/// @nodoc
class _$BaseNodeEntityCopyWithImpl<$Res, $Val extends BaseNodeEntity>
    implements $BaseNodeEntityCopyWith<$Res> {
  _$BaseNodeEntityCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseNodeEntityImplCopyWith<$Res>
    implements $BaseNodeEntityCopyWith<$Res> {
  factory _$$BaseNodeEntityImplCopyWith(_$BaseNodeEntityImpl value,
          $Res Function(_$BaseNodeEntityImpl) then) =
      __$$BaseNodeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String key, String name, String type});
}

/// @nodoc
class __$$BaseNodeEntityImplCopyWithImpl<$Res>
    extends _$BaseNodeEntityCopyWithImpl<$Res, _$BaseNodeEntityImpl>
    implements _$$BaseNodeEntityImplCopyWith<$Res> {
  __$$BaseNodeEntityImplCopyWithImpl(
      _$BaseNodeEntityImpl _value, $Res Function(_$BaseNodeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_$BaseNodeEntityImpl(
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
    ));
  }
}

/// @nodoc

class _$BaseNodeEntityImpl implements _BaseNodeEntity {
  const _$BaseNodeEntityImpl(
      {required this.id,
      required this.key,
      required this.name,
      required this.type});

  @override
  final String id;
  @override
  final String key;
  @override
  final String name;
  @override
  final String type;

  @override
  String toString() {
    return 'BaseNodeEntity(id: $id, key: $key, name: $name, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseNodeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, key, name, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseNodeEntityImplCopyWith<_$BaseNodeEntityImpl> get copyWith =>
      __$$BaseNodeEntityImplCopyWithImpl<_$BaseNodeEntityImpl>(
          this, _$identity);
}

abstract class _BaseNodeEntity implements BaseNodeEntity {
  const factory _BaseNodeEntity(
      {required final String id,
      required final String key,
      required final String name,
      required final String type}) = _$BaseNodeEntityImpl;

  @override
  String get id;
  @override
  String get key;
  @override
  String get name;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$BaseNodeEntityImplCopyWith<_$BaseNodeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
