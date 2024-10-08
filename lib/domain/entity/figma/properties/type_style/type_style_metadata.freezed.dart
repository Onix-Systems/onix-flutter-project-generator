// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_style_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TypeStyleMetadata {
  String get fontFamily => throw _privateConstructorUsedError;
  num get fontWeight => throw _privateConstructorUsedError;
  num get fontSize => throw _privateConstructorUsedError;
  num get letterSpacing => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TypeStyleMetadataCopyWith<TypeStyleMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeStyleMetadataCopyWith<$Res> {
  factory $TypeStyleMetadataCopyWith(
          TypeStyleMetadata value, $Res Function(TypeStyleMetadata) then) =
      _$TypeStyleMetadataCopyWithImpl<$Res, TypeStyleMetadata>;
  @useResult
  $Res call(
      {String fontFamily, num fontWeight, num fontSize, num letterSpacing});
}

/// @nodoc
class _$TypeStyleMetadataCopyWithImpl<$Res, $Val extends TypeStyleMetadata>
    implements $TypeStyleMetadataCopyWith<$Res> {
  _$TypeStyleMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontFamily = null,
    Object? fontWeight = null,
    Object? fontSize = null,
    Object? letterSpacing = null,
  }) {
    return _then(_value.copyWith(
      fontFamily: null == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String,
      fontWeight: null == fontWeight
          ? _value.fontWeight
          : fontWeight // ignore: cast_nullable_to_non_nullable
              as num,
      fontSize: null == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as num,
      letterSpacing: null == letterSpacing
          ? _value.letterSpacing
          : letterSpacing // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeStyleMetadataImplCopyWith<$Res>
    implements $TypeStyleMetadataCopyWith<$Res> {
  factory _$$TypeStyleMetadataImplCopyWith(_$TypeStyleMetadataImpl value,
          $Res Function(_$TypeStyleMetadataImpl) then) =
      __$$TypeStyleMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fontFamily, num fontWeight, num fontSize, num letterSpacing});
}

/// @nodoc
class __$$TypeStyleMetadataImplCopyWithImpl<$Res>
    extends _$TypeStyleMetadataCopyWithImpl<$Res, _$TypeStyleMetadataImpl>
    implements _$$TypeStyleMetadataImplCopyWith<$Res> {
  __$$TypeStyleMetadataImplCopyWithImpl(_$TypeStyleMetadataImpl _value,
      $Res Function(_$TypeStyleMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontFamily = null,
    Object? fontWeight = null,
    Object? fontSize = null,
    Object? letterSpacing = null,
  }) {
    return _then(_$TypeStyleMetadataImpl(
      fontFamily: null == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String,
      fontWeight: null == fontWeight
          ? _value.fontWeight
          : fontWeight // ignore: cast_nullable_to_non_nullable
              as num,
      fontSize: null == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as num,
      letterSpacing: null == letterSpacing
          ? _value.letterSpacing
          : letterSpacing // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$TypeStyleMetadataImpl implements _TypeStyleMetadata {
  const _$TypeStyleMetadataImpl(
      {required this.fontFamily,
      required this.fontWeight,
      required this.fontSize,
      required this.letterSpacing});

  @override
  final String fontFamily;
  @override
  final num fontWeight;
  @override
  final num fontSize;
  @override
  final num letterSpacing;

  @override
  String toString() {
    return 'TypeStyleMetadata(fontFamily: $fontFamily, fontWeight: $fontWeight, fontSize: $fontSize, letterSpacing: $letterSpacing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeStyleMetadataImpl &&
            (identical(other.fontFamily, fontFamily) ||
                other.fontFamily == fontFamily) &&
            (identical(other.fontWeight, fontWeight) ||
                other.fontWeight == fontWeight) &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize) &&
            (identical(other.letterSpacing, letterSpacing) ||
                other.letterSpacing == letterSpacing));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, fontFamily, fontWeight, fontSize, letterSpacing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeStyleMetadataImplCopyWith<_$TypeStyleMetadataImpl> get copyWith =>
      __$$TypeStyleMetadataImplCopyWithImpl<_$TypeStyleMetadataImpl>(
          this, _$identity);
}

abstract class _TypeStyleMetadata implements TypeStyleMetadata {
  const factory _TypeStyleMetadata(
      {required final String fontFamily,
      required final num fontWeight,
      required final num fontSize,
      required final num letterSpacing}) = _$TypeStyleMetadataImpl;

  @override
  String get fontFamily;
  @override
  num get fontWeight;
  @override
  num get fontSize;
  @override
  num get letterSpacing;
  @override
  @JsonKey(ignore: true)
  _$$TypeStyleMetadataImplCopyWith<_$TypeStyleMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
