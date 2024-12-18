// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_object_reference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DataObjectReference {
  DataFileType get type => throw _privateConstructorUsedError;
  SwaggerReference get fileReference => throw _privateConstructorUsedError;

  /// Create a copy of DataObjectReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataObjectReferenceCopyWith<DataObjectReference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataObjectReferenceCopyWith<$Res> {
  factory $DataObjectReferenceCopyWith(
          DataObjectReference value, $Res Function(DataObjectReference) then) =
      _$DataObjectReferenceCopyWithImpl<$Res, DataObjectReference>;
  @useResult
  $Res call({DataFileType type, SwaggerReference fileReference});
}

/// @nodoc
class _$DataObjectReferenceCopyWithImpl<$Res, $Val extends DataObjectReference>
    implements $DataObjectReferenceCopyWith<$Res> {
  _$DataObjectReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataObjectReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? fileReference = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DataFileType,
      fileReference: null == fileReference
          ? _value.fileReference
          : fileReference // ignore: cast_nullable_to_non_nullable
              as SwaggerReference,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataObjectReferenceImplCopyWith<$Res>
    implements $DataObjectReferenceCopyWith<$Res> {
  factory _$$DataObjectReferenceImplCopyWith(_$DataObjectReferenceImpl value,
          $Res Function(_$DataObjectReferenceImpl) then) =
      __$$DataObjectReferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DataFileType type, SwaggerReference fileReference});
}

/// @nodoc
class __$$DataObjectReferenceImplCopyWithImpl<$Res>
    extends _$DataObjectReferenceCopyWithImpl<$Res, _$DataObjectReferenceImpl>
    implements _$$DataObjectReferenceImplCopyWith<$Res> {
  __$$DataObjectReferenceImplCopyWithImpl(_$DataObjectReferenceImpl _value,
      $Res Function(_$DataObjectReferenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataObjectReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? fileReference = null,
  }) {
    return _then(_$DataObjectReferenceImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DataFileType,
      fileReference: null == fileReference
          ? _value.fileReference
          : fileReference // ignore: cast_nullable_to_non_nullable
              as SwaggerReference,
    ));
  }
}

/// @nodoc

class _$DataObjectReferenceImpl extends _DataObjectReference {
  const _$DataObjectReferenceImpl(
      {required this.type, required this.fileReference})
      : super._();

  @override
  final DataFileType type;
  @override
  final SwaggerReference fileReference;

  @override
  String toString() {
    return 'DataObjectReference(type: $type, fileReference: $fileReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataObjectReferenceImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.fileReference, fileReference) ||
                other.fileReference == fileReference));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, fileReference);

  /// Create a copy of DataObjectReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataObjectReferenceImplCopyWith<_$DataObjectReferenceImpl> get copyWith =>
      __$$DataObjectReferenceImplCopyWithImpl<_$DataObjectReferenceImpl>(
          this, _$identity);
}

abstract class _DataObjectReference extends DataObjectReference {
  const factory _DataObjectReference(
          {required final DataFileType type,
          required final SwaggerReference fileReference}) =
      _$DataObjectReferenceImpl;
  const _DataObjectReference._() : super._();

  @override
  DataFileType get type;
  @override
  SwaggerReference get fileReference;

  /// Create a copy of DataObjectReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataObjectReferenceImplCopyWith<_$DataObjectReferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
