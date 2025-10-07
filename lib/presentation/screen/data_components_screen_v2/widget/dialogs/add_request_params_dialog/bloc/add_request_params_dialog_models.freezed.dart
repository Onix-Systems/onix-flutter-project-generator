// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_request_params_dialog_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddRequestParamsDialogSR {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddRequestParamsDialogSR);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddRequestParamsDialogSR()';
  }
}

/// @nodoc
class $AddRequestParamsDialogSRCopyWith<$Res> {
  $AddRequestParamsDialogSRCopyWith(
      AddRequestParamsDialogSR _, $Res Function(AddRequestParamsDialogSR) __);
}

/// Adds pattern-matching-related methods to [AddRequestParamsDialogSR].
extension AddRequestParamsDialogSRPatterns on AddRequestParamsDialogSR {
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
    TResult Function(_AddRequestParamsDialogSRSuccess value)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestParamsDialogSRSuccess() when success != null:
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
    required TResult Function(_AddRequestParamsDialogSRSuccess value) success,
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestParamsDialogSRSuccess():
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
    TResult? Function(_AddRequestParamsDialogSRSuccess value)? success,
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestParamsDialogSRSuccess() when success != null:
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
    TResult Function()? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestParamsDialogSRSuccess() when success != null:
        return success();
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
    required TResult Function() success,
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestParamsDialogSRSuccess():
        return success();
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
    TResult? Function()? success,
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestParamsDialogSRSuccess() when success != null:
        return success();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddRequestParamsDialogSRSuccess implements AddRequestParamsDialogSR {
  const _AddRequestParamsDialogSRSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddRequestParamsDialogSRSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddRequestParamsDialogSR.success()';
  }
}

/// @nodoc
mixin _$AddRequestParamsDialogState {
  List<RequestParamComponent> get params;
  List<String> get types;

  /// Create a copy of AddRequestParamsDialogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddRequestParamsDialogStateCopyWith<AddRequestParamsDialogState>
      get copyWith => _$AddRequestParamsDialogStateCopyWithImpl<
              AddRequestParamsDialogState>(
          this as AddRequestParamsDialogState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddRequestParamsDialogState &&
            const DeepCollectionEquality().equals(other.params, params) &&
            const DeepCollectionEquality().equals(other.types, types));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(params),
      const DeepCollectionEquality().hash(types));

  @override
  String toString() {
    return 'AddRequestParamsDialogState(params: $params, types: $types)';
  }
}

/// @nodoc
abstract mixin class $AddRequestParamsDialogStateCopyWith<$Res> {
  factory $AddRequestParamsDialogStateCopyWith(
          AddRequestParamsDialogState value,
          $Res Function(AddRequestParamsDialogState) _then) =
      _$AddRequestParamsDialogStateCopyWithImpl;
  @useResult
  $Res call({List<RequestParamComponent> params, List<String> types});
}

/// @nodoc
class _$AddRequestParamsDialogStateCopyWithImpl<$Res>
    implements $AddRequestParamsDialogStateCopyWith<$Res> {
  _$AddRequestParamsDialogStateCopyWithImpl(this._self, this._then);

  final AddRequestParamsDialogState _self;
  final $Res Function(AddRequestParamsDialogState) _then;

  /// Create a copy of AddRequestParamsDialogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
    Object? types = null,
  }) {
    return _then(_self.copyWith(
      params: null == params
          ? _self.params
          : params // ignore: cast_nullable_to_non_nullable
              as List<RequestParamComponent>,
      types: null == types
          ? _self.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [AddRequestParamsDialogState].
extension AddRequestParamsDialogStatePatterns on AddRequestParamsDialogState {
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
    TResult Function(_AddRequestParamsDialogState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestParamsDialogState() when $default != null:
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
    TResult Function(_AddRequestParamsDialogState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddRequestParamsDialogState():
        return $default(_that);
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
    TResult? Function(_AddRequestParamsDialogState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddRequestParamsDialogState() when $default != null:
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
    TResult Function(List<RequestParamComponent> params, List<String> types)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestParamsDialogState() when $default != null:
        return $default(_that.params, _that.types);
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
    TResult Function(List<RequestParamComponent> params, List<String> types)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddRequestParamsDialogState():
        return $default(_that.params, _that.types);
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
    TResult? Function(List<RequestParamComponent> params, List<String> types)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddRequestParamsDialogState() when $default != null:
        return $default(_that.params, _that.types);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddRequestParamsDialogState implements AddRequestParamsDialogState {
  const _AddRequestParamsDialogState(
      {final List<RequestParamComponent> params = const [],
      final List<String> types = const []})
      : _params = params,
        _types = types;

  final List<RequestParamComponent> _params;
  @override
  @JsonKey()
  List<RequestParamComponent> get params {
    if (_params is EqualUnmodifiableListView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_params);
  }

  final List<String> _types;
  @override
  @JsonKey()
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  /// Create a copy of AddRequestParamsDialogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddRequestParamsDialogStateCopyWith<_AddRequestParamsDialogState>
      get copyWith => __$AddRequestParamsDialogStateCopyWithImpl<
          _AddRequestParamsDialogState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddRequestParamsDialogState &&
            const DeepCollectionEquality().equals(other._params, _params) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_params),
      const DeepCollectionEquality().hash(_types));

  @override
  String toString() {
    return 'AddRequestParamsDialogState(params: $params, types: $types)';
  }
}

/// @nodoc
abstract mixin class _$AddRequestParamsDialogStateCopyWith<$Res>
    implements $AddRequestParamsDialogStateCopyWith<$Res> {
  factory _$AddRequestParamsDialogStateCopyWith(
          _AddRequestParamsDialogState value,
          $Res Function(_AddRequestParamsDialogState) _then) =
      __$AddRequestParamsDialogStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<RequestParamComponent> params, List<String> types});
}

/// @nodoc
class __$AddRequestParamsDialogStateCopyWithImpl<$Res>
    implements _$AddRequestParamsDialogStateCopyWith<$Res> {
  __$AddRequestParamsDialogStateCopyWithImpl(this._self, this._then);

  final _AddRequestParamsDialogState _self;
  final $Res Function(_AddRequestParamsDialogState) _then;

  /// Create a copy of AddRequestParamsDialogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? params = null,
    Object? types = null,
  }) {
    return _then(_AddRequestParamsDialogState(
      params: null == params
          ? _self._params
          : params // ignore: cast_nullable_to_non_nullable
              as List<RequestParamComponent>,
      types: null == types
          ? _self._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
