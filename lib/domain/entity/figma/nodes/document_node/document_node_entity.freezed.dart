// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_node_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DocumentNodeEntity {
  String get id => throw _privateConstructorUsedError;

  String get key => throw _privateConstructorUsedError;

  String get name => throw _privateConstructorUsedError;

  String get type => throw _privateConstructorUsedError;

  List<BaseNode> get children => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DocumentNodeEntityCopyWith<DocumentNodeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentNodeEntityCopyWith<$Res> {
  factory $DocumentNodeEntityCopyWith(
          DocumentNodeEntity value, $Res Function(DocumentNodeEntity) then) =
      _$DocumentNodeEntityCopyWithImpl<$Res, DocumentNodeEntity>;

  @useResult
  $Res call(
      {String id,
      String key,
      String name,
      String type,
      List<BaseNode> children});
}

/// @nodoc
class _$DocumentNodeEntityCopyWithImpl<$Res, $Val extends DocumentNodeEntity>
    implements $DocumentNodeEntityCopyWith<$Res> {
  _$DocumentNodeEntityCopyWithImpl(this._value, this._then);

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
    Object? children = null,
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
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<BaseNode>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentNodeEntityImplCopyWith<$Res>
    implements $DocumentNodeEntityCopyWith<$Res> {
  factory _$$DocumentNodeEntityImplCopyWith(_$DocumentNodeEntityImpl value,
          $Res Function(_$DocumentNodeEntityImpl) then) =
      __$$DocumentNodeEntityImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {String id,
      String key,
      String name,
      String type,
      List<BaseNode> children});
}

/// @nodoc
class __$$DocumentNodeEntityImplCopyWithImpl<$Res>
    extends _$DocumentNodeEntityCopyWithImpl<$Res, _$DocumentNodeEntityImpl>
    implements _$$DocumentNodeEntityImplCopyWith<$Res> {
  __$$DocumentNodeEntityImplCopyWithImpl(_$DocumentNodeEntityImpl _value,
      $Res Function(_$DocumentNodeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
    Object? children = null,
  }) {
    return _then(_$DocumentNodeEntityImpl(
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
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<BaseNode>,
    ));
  }
}

/// @nodoc

class _$DocumentNodeEntityImpl implements _DocumentNodeEntity {
  const _$DocumentNodeEntityImpl(
      {required this.id,
      required this.key,
      required this.name,
      required this.type,
      required final List<BaseNode> children})
      : _children = children;

  @override
  final String id;
  @override
  final String key;
  @override
  final String name;
  @override
  final String type;
  final List<BaseNode> _children;

  @override
  List<BaseNode> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString() {
    return 'DocumentNodeEntity(id: $id, key: $key, name: $name, type: $type, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentNodeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, key, name, type,
      const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentNodeEntityImplCopyWith<_$DocumentNodeEntityImpl> get copyWith =>
      __$$DocumentNodeEntityImplCopyWithImpl<_$DocumentNodeEntityImpl>(
          this, _$identity);
}

abstract class _DocumentNodeEntity implements DocumentNodeEntity {
  const factory _DocumentNodeEntity(
      {required final String id,
      required final String key,
      required final String name,
      required final String type,
      required final List<BaseNode> children}) = _$DocumentNodeEntityImpl;

  @override
  String get id;

  @override
  String get key;

  @override
  String get name;

  @override
  String get type;

  @override
  List<BaseNode> get children;

  @override
  @JsonKey(ignore: true)
  _$$DocumentNodeEntityImplCopyWith<_$DocumentNodeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
