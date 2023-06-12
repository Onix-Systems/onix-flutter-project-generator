// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return _Config.fromJson(json);
}

/// @nodoc
mixin _$Config {
  List<SourceWrapper> get sources => throw _privateConstructorUsedError;
  List<ScreenEntity> get screens => throw _privateConstructorUsedError;
  List<EntityWrapper> get entities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigCopyWith<Config> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) then) =
      _$ConfigCopyWithImpl<$Res, Config>;
  @useResult
  $Res call(
      {List<SourceWrapper> sources,
      List<ScreenEntity> screens,
      List<EntityWrapper> entities});
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res, $Val extends Config>
    implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sources = null,
    Object? screens = null,
    Object? entities = null,
  }) {
    return _then(_value.copyWith(
      sources: null == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<SourceWrapper>,
      screens: null == screens
          ? _value.screens
          : screens // ignore: cast_nullable_to_non_nullable
              as List<ScreenEntity>,
      entities: null == entities
          ? _value.entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<EntityWrapper>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$$_ConfigCopyWith(_$_Config value, $Res Function(_$_Config) then) =
      __$$_ConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SourceWrapper> sources,
      List<ScreenEntity> screens,
      List<EntityWrapper> entities});
}

/// @nodoc
class __$$_ConfigCopyWithImpl<$Res>
    extends _$ConfigCopyWithImpl<$Res, _$_Config>
    implements _$$_ConfigCopyWith<$Res> {
  __$$_ConfigCopyWithImpl(_$_Config _value, $Res Function(_$_Config) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sources = null,
    Object? screens = null,
    Object? entities = null,
  }) {
    return _then(_$_Config(
      sources: null == sources
          ? _value._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<SourceWrapper>,
      screens: null == screens
          ? _value._screens
          : screens // ignore: cast_nullable_to_non_nullable
              as List<ScreenEntity>,
      entities: null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<EntityWrapper>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Config implements _Config {
  const _$_Config(
      {required final List<SourceWrapper> sources,
      required final List<ScreenEntity> screens,
      required final List<EntityWrapper> entities})
      : _sources = sources,
        _screens = screens,
        _entities = entities;

  factory _$_Config.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigFromJson(json);

  final List<SourceWrapper> _sources;
  @override
  List<SourceWrapper> get sources {
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

  final List<ScreenEntity> _screens;
  @override
  List<ScreenEntity> get screens {
    if (_screens is EqualUnmodifiableListView) return _screens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_screens);
  }

  final List<EntityWrapper> _entities;
  @override
  List<EntityWrapper> get entities {
    if (_entities is EqualUnmodifiableListView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entities);
  }

  @override
  String toString() {
    return 'Config(sources: $sources, screens: $screens, entities: $entities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Config &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
            const DeepCollectionEquality().equals(other._screens, _screens) &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sources),
      const DeepCollectionEquality().hash(_screens),
      const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      __$$_ConfigCopyWithImpl<_$_Config>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigToJson(
      this,
    );
  }
}

abstract class _Config implements Config {
  const factory _Config(
      {required final List<SourceWrapper> sources,
      required final List<ScreenEntity> screens,
      required final List<EntityWrapper> entities}) = _$_Config;

  factory _Config.fromJson(Map<String, dynamic> json) = _$_Config.fromJson;

  @override
  List<SourceWrapper> get sources;
  @override
  List<ScreenEntity> get screens;
  @override
  List<EntityWrapper> get entities;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      throw _privateConstructorUsedError;
}
