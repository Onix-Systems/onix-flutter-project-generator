// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class_from_json_dialog_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClassFromJsonDialogSR {
  String get generatedCode;

  /// Create a copy of ClassFromJsonDialogSR
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClassFromJsonDialogSRCopyWith<ClassFromJsonDialogSR> get copyWith =>
      _$ClassFromJsonDialogSRCopyWithImpl<ClassFromJsonDialogSR>(
          this as ClassFromJsonDialogSR, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClassFromJsonDialogSR &&
            (identical(other.generatedCode, generatedCode) ||
                other.generatedCode == generatedCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, generatedCode);

  @override
  String toString() {
    return 'ClassFromJsonDialogSR(generatedCode: $generatedCode)';
  }
}

/// @nodoc
abstract mixin class $ClassFromJsonDialogSRCopyWith<$Res> {
  factory $ClassFromJsonDialogSRCopyWith(ClassFromJsonDialogSR value,
          $Res Function(ClassFromJsonDialogSR) _then) =
      _$ClassFromJsonDialogSRCopyWithImpl;
  @useResult
  $Res call({String generatedCode});
}

/// @nodoc
class _$ClassFromJsonDialogSRCopyWithImpl<$Res>
    implements $ClassFromJsonDialogSRCopyWith<$Res> {
  _$ClassFromJsonDialogSRCopyWithImpl(this._self, this._then);

  final ClassFromJsonDialogSR _self;
  final $Res Function(ClassFromJsonDialogSR) _then;

  /// Create a copy of ClassFromJsonDialogSR
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatedCode = null,
  }) {
    return _then(_self.copyWith(
      generatedCode: null == generatedCode
          ? _self.generatedCode
          : generatedCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ClassFromJsonDialogSR].
extension ClassFromJsonDialogSRPatterns on ClassFromJsonDialogSR {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ClassFromJsonDialogSRSuccess value)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ClassFromJsonDialogSRSuccess() when success != null:
        return success(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_ClassFromJsonDialogSRSuccess value) success,
  }) {
    final _that = this;
    switch (_that) {
      case _ClassFromJsonDialogSRSuccess():
        return success(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ClassFromJsonDialogSRSuccess value)? success,
  }) {
    final _that = this;
    switch (_that) {
      case _ClassFromJsonDialogSRSuccess() when success != null:
        return success(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String generatedCode)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ClassFromJsonDialogSRSuccess() when success != null:
        return success(_that.generatedCode);
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
  TResult when<TResult extends Object?>({
    required TResult Function(String generatedCode) success,
  }) {
    final _that = this;
    switch (_that) {
      case _ClassFromJsonDialogSRSuccess():
        return success(_that.generatedCode);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String generatedCode)? success,
  }) {
    final _that = this;
    switch (_that) {
      case _ClassFromJsonDialogSRSuccess() when success != null:
        return success(_that.generatedCode);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ClassFromJsonDialogSRSuccess implements ClassFromJsonDialogSR {
  const _ClassFromJsonDialogSRSuccess({required this.generatedCode});

  @override
  final String generatedCode;

  /// Create a copy of ClassFromJsonDialogSR
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClassFromJsonDialogSRSuccessCopyWith<_ClassFromJsonDialogSRSuccess>
      get copyWith => __$ClassFromJsonDialogSRSuccessCopyWithImpl<
          _ClassFromJsonDialogSRSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClassFromJsonDialogSRSuccess &&
            (identical(other.generatedCode, generatedCode) ||
                other.generatedCode == generatedCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, generatedCode);

  @override
  String toString() {
    return 'ClassFromJsonDialogSR.success(generatedCode: $generatedCode)';
  }
}

/// @nodoc
abstract mixin class _$ClassFromJsonDialogSRSuccessCopyWith<$Res>
    implements $ClassFromJsonDialogSRCopyWith<$Res> {
  factory _$ClassFromJsonDialogSRSuccessCopyWith(
          _ClassFromJsonDialogSRSuccess value,
          $Res Function(_ClassFromJsonDialogSRSuccess) _then) =
      __$ClassFromJsonDialogSRSuccessCopyWithImpl;
  @override
  @useResult
  $Res call({String generatedCode});
}

/// @nodoc
class __$ClassFromJsonDialogSRSuccessCopyWithImpl<$Res>
    implements _$ClassFromJsonDialogSRSuccessCopyWith<$Res> {
  __$ClassFromJsonDialogSRSuccessCopyWithImpl(this._self, this._then);

  final _ClassFromJsonDialogSRSuccess _self;
  final $Res Function(_ClassFromJsonDialogSRSuccess) _then;

  /// Create a copy of ClassFromJsonDialogSR
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? generatedCode = null,
  }) {
    return _then(_ClassFromJsonDialogSRSuccess(
      generatedCode: null == generatedCode
          ? _self.generatedCode
          : generatedCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
