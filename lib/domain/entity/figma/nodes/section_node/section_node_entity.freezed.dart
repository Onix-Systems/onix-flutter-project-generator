// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'section_node_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SectionNodeEntity {
  List<PaintProperty> get fills => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SectionNodeEntityCopyWith<SectionNodeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectionNodeEntityCopyWith<$Res> {
  factory $SectionNodeEntityCopyWith(
          SectionNodeEntity value, $Res Function(SectionNodeEntity) then) =
      _$SectionNodeEntityCopyWithImpl<$Res, SectionNodeEntity>;
  @useResult
  $Res call(
      {List<PaintProperty> fills,
      String id,
      String key,
      String name,
      String type});
}

/// @nodoc
class _$SectionNodeEntityCopyWithImpl<$Res, $Val extends SectionNodeEntity>
    implements $SectionNodeEntityCopyWith<$Res> {
  _$SectionNodeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fills = null,
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      fills: null == fills
          ? _value.fills
          : fills // ignore: cast_nullable_to_non_nullable
              as List<PaintProperty>,
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
abstract class _$$SectionNodeEntityImplCopyWith<$Res>
    implements $SectionNodeEntityCopyWith<$Res> {
  factory _$$SectionNodeEntityImplCopyWith(_$SectionNodeEntityImpl value,
          $Res Function(_$SectionNodeEntityImpl) then) =
      __$$SectionNodeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PaintProperty> fills,
      String id,
      String key,
      String name,
      String type});
}

/// @nodoc
class __$$SectionNodeEntityImplCopyWithImpl<$Res>
    extends _$SectionNodeEntityCopyWithImpl<$Res, _$SectionNodeEntityImpl>
    implements _$$SectionNodeEntityImplCopyWith<$Res> {
  __$$SectionNodeEntityImplCopyWithImpl(_$SectionNodeEntityImpl _value,
      $Res Function(_$SectionNodeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fills = null,
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_$SectionNodeEntityImpl(
      fills: null == fills
          ? _value._fills
          : fills // ignore: cast_nullable_to_non_nullable
              as List<PaintProperty>,
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

class _$SectionNodeEntityImpl implements _SectionNodeEntity {
  const _$SectionNodeEntityImpl(
      {required final List<PaintProperty> fills,
      required this.id,
      required this.key,
      required this.name,
      required this.type})
      : _fills = fills;

  final List<PaintProperty> _fills;
  @override
  List<PaintProperty> get fills {
    if (_fills is EqualUnmodifiableListView) return _fills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fills);
  }

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
    return 'SectionNodeEntity(fills: $fills, id: $id, key: $key, name: $name, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SectionNodeEntityImpl &&
            const DeepCollectionEquality().equals(other._fills, _fills) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_fills), id, key, name, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SectionNodeEntityImplCopyWith<_$SectionNodeEntityImpl> get copyWith =>
      __$$SectionNodeEntityImplCopyWithImpl<_$SectionNodeEntityImpl>(
          this, _$identity);
}

abstract class _SectionNodeEntity implements SectionNodeEntity {
  const factory _SectionNodeEntity(
      {required final List<PaintProperty> fills,
      required final String id,
      required final String key,
      required final String name,
      required final String type}) = _$SectionNodeEntityImpl;

  @override
  List<PaintProperty> get fills;
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
  _$$SectionNodeEntityImplCopyWith<_$SectionNodeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
