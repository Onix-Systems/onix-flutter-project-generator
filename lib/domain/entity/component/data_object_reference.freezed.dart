// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_object_reference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DataObjectReference {
  DataFileType get type;
  SwaggerReference get fileReference;

  /// Create a copy of DataObjectReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataObjectReferenceCopyWith<DataObjectReference> get copyWith =>
      _$DataObjectReferenceCopyWithImpl<DataObjectReference>(
          this as DataObjectReference, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataObjectReference &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.fileReference, fileReference) ||
                other.fileReference == fileReference));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, fileReference);

  @override
  String toString() {
    return 'DataObjectReference(type: $type, fileReference: $fileReference)';
  }
}

/// @nodoc
abstract mixin class $DataObjectReferenceCopyWith<$Res> {
  factory $DataObjectReferenceCopyWith(
          DataObjectReference value, $Res Function(DataObjectReference) _then) =
      _$DataObjectReferenceCopyWithImpl;
  @useResult
  $Res call({DataFileType type, SwaggerReference fileReference});
}

/// @nodoc
class _$DataObjectReferenceCopyWithImpl<$Res>
    implements $DataObjectReferenceCopyWith<$Res> {
  _$DataObjectReferenceCopyWithImpl(this._self, this._then);

  final DataObjectReference _self;
  final $Res Function(DataObjectReference) _then;

  /// Create a copy of DataObjectReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? fileReference = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as DataFileType,
      fileReference: null == fileReference
          ? _self.fileReference
          : fileReference // ignore: cast_nullable_to_non_nullable
              as SwaggerReference,
    ));
  }
}

/// Adds pattern-matching-related methods to [DataObjectReference].
extension DataObjectReferencePatterns on DataObjectReference {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DataObjectReference value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DataObjectReference() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DataObjectReference value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DataObjectReference():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DataObjectReference value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DataObjectReference() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(DataFileType type, SwaggerReference fileReference)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DataObjectReference() when $default != null:
        return $default(_that.type, _that.fileReference);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(DataFileType type, SwaggerReference fileReference)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DataObjectReference():
        return $default(_that.type, _that.fileReference);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(DataFileType type, SwaggerReference fileReference)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DataObjectReference() when $default != null:
        return $default(_that.type, _that.fileReference);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DataObjectReference extends DataObjectReference {
  const _DataObjectReference({required this.type, required this.fileReference})
      : super._();

  @override
  final DataFileType type;
  @override
  final SwaggerReference fileReference;

  /// Create a copy of DataObjectReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataObjectReferenceCopyWith<_DataObjectReference> get copyWith =>
      __$DataObjectReferenceCopyWithImpl<_DataObjectReference>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataObjectReference &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.fileReference, fileReference) ||
                other.fileReference == fileReference));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, fileReference);

  @override
  String toString() {
    return 'DataObjectReference(type: $type, fileReference: $fileReference)';
  }
}

/// @nodoc
abstract mixin class _$DataObjectReferenceCopyWith<$Res>
    implements $DataObjectReferenceCopyWith<$Res> {
  factory _$DataObjectReferenceCopyWith(_DataObjectReference value,
          $Res Function(_DataObjectReference) _then) =
      __$DataObjectReferenceCopyWithImpl;
  @override
  @useResult
  $Res call({DataFileType type, SwaggerReference fileReference});
}

/// @nodoc
class __$DataObjectReferenceCopyWithImpl<$Res>
    implements _$DataObjectReferenceCopyWith<$Res> {
  __$DataObjectReferenceCopyWithImpl(this._self, this._then);

  final _DataObjectReference _self;
  final $Res Function(_DataObjectReference) _then;

  /// Create a copy of DataObjectReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? fileReference = null,
  }) {
    return _then(_DataObjectReference(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as DataFileType,
      fileReference: null == fileReference
          ? _self.fileReference
          : fileReference // ignore: cast_nullable_to_non_nullable
              as SwaggerReference,
    ));
  }
}

// dart format on
