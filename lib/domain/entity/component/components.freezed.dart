// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'components.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Components {
  List<SourceComponent> get sources => throw _privateConstructorUsedError;
  List<EnumParamComponent> get enums => throw _privateConstructorUsedError;
  List<DataObjectComponent> get dataObjects =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComponentsCopyWith<Components> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComponentsCopyWith<$Res> {
  factory $ComponentsCopyWith(
          Components value, $Res Function(Components) then) =
      _$ComponentsCopyWithImpl<$Res, Components>;
  @useResult
  $Res call(
      {List<SourceComponent> sources,
      List<EnumParamComponent> enums,
      List<DataObjectComponent> dataObjects});
}

/// @nodoc
class _$ComponentsCopyWithImpl<$Res, $Val extends Components>
    implements $ComponentsCopyWith<$Res> {
  _$ComponentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sources = null,
    Object? enums = null,
    Object? dataObjects = null,
  }) {
    return _then(_value.copyWith(
      sources: null == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<SourceComponent>,
      enums: null == enums
          ? _value.enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<EnumParamComponent>,
      dataObjects: null == dataObjects
          ? _value.dataObjects
          : dataObjects // ignore: cast_nullable_to_non_nullable
              as List<DataObjectComponent>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComponentsImplCopyWith<$Res>
    implements $ComponentsCopyWith<$Res> {
  factory _$$ComponentsImplCopyWith(
          _$ComponentsImpl value, $Res Function(_$ComponentsImpl) then) =
      __$$ComponentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SourceComponent> sources,
      List<EnumParamComponent> enums,
      List<DataObjectComponent> dataObjects});
}

/// @nodoc
class __$$ComponentsImplCopyWithImpl<$Res>
    extends _$ComponentsCopyWithImpl<$Res, _$ComponentsImpl>
    implements _$$ComponentsImplCopyWith<$Res> {
  __$$ComponentsImplCopyWithImpl(
      _$ComponentsImpl _value, $Res Function(_$ComponentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sources = null,
    Object? enums = null,
    Object? dataObjects = null,
  }) {
    return _then(_$ComponentsImpl(
      sources: null == sources
          ? _value._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<SourceComponent>,
      enums: null == enums
          ? _value._enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<EnumParamComponent>,
      dataObjects: null == dataObjects
          ? _value._dataObjects
          : dataObjects // ignore: cast_nullable_to_non_nullable
              as List<DataObjectComponent>,
    ));
  }
}

/// @nodoc

class _$ComponentsImpl extends _Components {
  const _$ComponentsImpl(
      {required final List<SourceComponent> sources,
      required final List<EnumParamComponent> enums,
      required final List<DataObjectComponent> dataObjects})
      : _sources = sources,
        _enums = enums,
        _dataObjects = dataObjects,
        super._();

  final List<SourceComponent> _sources;
  @override
  List<SourceComponent> get sources {
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

  final List<EnumParamComponent> _enums;
  @override
  List<EnumParamComponent> get enums {
    if (_enums is EqualUnmodifiableListView) return _enums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enums);
  }

  final List<DataObjectComponent> _dataObjects;
  @override
  List<DataObjectComponent> get dataObjects {
    if (_dataObjects is EqualUnmodifiableListView) return _dataObjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataObjects);
  }

  @override
  String toString() {
    return 'Components(sources: $sources, enums: $enums, dataObjects: $dataObjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComponentsImpl &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
            const DeepCollectionEquality().equals(other._enums, _enums) &&
            const DeepCollectionEquality()
                .equals(other._dataObjects, _dataObjects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sources),
      const DeepCollectionEquality().hash(_enums),
      const DeepCollectionEquality().hash(_dataObjects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComponentsImplCopyWith<_$ComponentsImpl> get copyWith =>
      __$$ComponentsImplCopyWithImpl<_$ComponentsImpl>(this, _$identity);
}

abstract class _Components extends Components {
  const factory _Components(
      {required final List<SourceComponent> sources,
      required final List<EnumParamComponent> enums,
      required final List<DataObjectComponent> dataObjects}) = _$ComponentsImpl;
  const _Components._() : super._();

  @override
  List<SourceComponent> get sources;
  @override
  List<EnumParamComponent> get enums;
  @override
  List<DataObjectComponent> get dataObjects;
  @override
  @JsonKey(ignore: true)
  _$$ComponentsImplCopyWith<_$ComponentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
