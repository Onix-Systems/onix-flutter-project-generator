// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'platforms_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlatformsList _$PlatformsListFromJson(Map<String, dynamic> json) {
  return _PlatformsList.fromJson(json);
}

/// @nodoc
mixin _$PlatformsList {
  bool get android => throw _privateConstructorUsedError;
  bool get ios => throw _privateConstructorUsedError;
  bool get web => throw _privateConstructorUsedError;
  bool get macos => throw _privateConstructorUsedError;
  bool get windows => throw _privateConstructorUsedError;
  bool get linux => throw _privateConstructorUsedError;

  /// Serializes this PlatformsList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlatformsList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlatformsListCopyWith<PlatformsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformsListCopyWith<$Res> {
  factory $PlatformsListCopyWith(
          PlatformsList value, $Res Function(PlatformsList) then) =
      _$PlatformsListCopyWithImpl<$Res, PlatformsList>;
  @useResult
  $Res call(
      {bool android, bool ios, bool web, bool macos, bool windows, bool linux});
}

/// @nodoc
class _$PlatformsListCopyWithImpl<$Res, $Val extends PlatformsList>
    implements $PlatformsListCopyWith<$Res> {
  _$PlatformsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlatformsList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? android = null,
    Object? ios = null,
    Object? web = null,
    Object? macos = null,
    Object? windows = null,
    Object? linux = null,
  }) {
    return _then(_value.copyWith(
      android: null == android
          ? _value.android
          : android // ignore: cast_nullable_to_non_nullable
              as bool,
      ios: null == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as bool,
      web: null == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as bool,
      macos: null == macos
          ? _value.macos
          : macos // ignore: cast_nullable_to_non_nullable
              as bool,
      windows: null == windows
          ? _value.windows
          : windows // ignore: cast_nullable_to_non_nullable
              as bool,
      linux: null == linux
          ? _value.linux
          : linux // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlatformsListImplCopyWith<$Res>
    implements $PlatformsListCopyWith<$Res> {
  factory _$$PlatformsListImplCopyWith(
          _$PlatformsListImpl value, $Res Function(_$PlatformsListImpl) then) =
      __$$PlatformsListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool android, bool ios, bool web, bool macos, bool windows, bool linux});
}

/// @nodoc
class __$$PlatformsListImplCopyWithImpl<$Res>
    extends _$PlatformsListCopyWithImpl<$Res, _$PlatformsListImpl>
    implements _$$PlatformsListImplCopyWith<$Res> {
  __$$PlatformsListImplCopyWithImpl(
      _$PlatformsListImpl _value, $Res Function(_$PlatformsListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlatformsList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? android = null,
    Object? ios = null,
    Object? web = null,
    Object? macos = null,
    Object? windows = null,
    Object? linux = null,
  }) {
    return _then(_$PlatformsListImpl(
      android: null == android
          ? _value.android
          : android // ignore: cast_nullable_to_non_nullable
              as bool,
      ios: null == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as bool,
      web: null == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as bool,
      macos: null == macos
          ? _value.macos
          : macos // ignore: cast_nullable_to_non_nullable
              as bool,
      windows: null == windows
          ? _value.windows
          : windows // ignore: cast_nullable_to_non_nullable
              as bool,
      linux: null == linux
          ? _value.linux
          : linux // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlatformsListImpl extends _PlatformsList {
  const _$PlatformsListImpl(
      {this.android = true,
      this.ios = true,
      this.web = false,
      this.macos = false,
      this.windows = false,
      this.linux = false})
      : super._();

  factory _$PlatformsListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlatformsListImplFromJson(json);

  @override
  @JsonKey()
  final bool android;
  @override
  @JsonKey()
  final bool ios;
  @override
  @JsonKey()
  final bool web;
  @override
  @JsonKey()
  final bool macos;
  @override
  @JsonKey()
  final bool windows;
  @override
  @JsonKey()
  final bool linux;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformsListImpl &&
            (identical(other.android, android) || other.android == android) &&
            (identical(other.ios, ios) || other.ios == ios) &&
            (identical(other.web, web) || other.web == web) &&
            (identical(other.macos, macos) || other.macos == macos) &&
            (identical(other.windows, windows) || other.windows == windows) &&
            (identical(other.linux, linux) || other.linux == linux));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, android, ios, web, macos, windows, linux);

  /// Create a copy of PlatformsList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformsListImplCopyWith<_$PlatformsListImpl> get copyWith =>
      __$$PlatformsListImplCopyWithImpl<_$PlatformsListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlatformsListImplToJson(
      this,
    );
  }
}

abstract class _PlatformsList extends PlatformsList {
  const factory _PlatformsList(
      {final bool android,
      final bool ios,
      final bool web,
      final bool macos,
      final bool windows,
      final bool linux}) = _$PlatformsListImpl;
  const _PlatformsList._() : super._();

  factory _PlatformsList.fromJson(Map<String, dynamic> json) =
      _$PlatformsListImpl.fromJson;

  @override
  bool get android;
  @override
  bool get ios;
  @override
  bool get web;
  @override
  bool get macos;
  @override
  bool get windows;
  @override
  bool get linux;

  /// Create a copy of PlatformsList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlatformsListImplCopyWith<_$PlatformsListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
