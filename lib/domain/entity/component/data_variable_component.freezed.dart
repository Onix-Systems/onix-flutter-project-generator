// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_variable_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DataVariableComponent {
  String get name;
  SwaggerType get type;
  bool get isRequired;
  bool get isEnum;

  /// Create a copy of DataVariableComponent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataVariableComponentCopyWith<DataVariableComponent> get copyWith =>
      _$DataVariableComponentCopyWithImpl<DataVariableComponent>(
          this as DataVariableComponent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataVariableComponent &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.isEnum, isEnum) || other.isEnum == isEnum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, type, isRequired, isEnum);

  @override
  String toString() {
    return 'DataVariableComponent(name: $name, type: $type, isRequired: $isRequired, isEnum: $isEnum)';
  }
}

/// @nodoc
abstract mixin class $DataVariableComponentCopyWith<$Res> {
  factory $DataVariableComponentCopyWith(DataVariableComponent value,
          $Res Function(DataVariableComponent) _then) =
      _$DataVariableComponentCopyWithImpl;
  @useResult
  $Res call({String name, SwaggerType type, bool isRequired, bool isEnum});
}

/// @nodoc
class _$DataVariableComponentCopyWithImpl<$Res>
    implements $DataVariableComponentCopyWith<$Res> {
  _$DataVariableComponentCopyWithImpl(this._self, this._then);

  final DataVariableComponent _self;
  final $Res Function(DataVariableComponent) _then;

  /// Create a copy of DataVariableComponent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
    Object? isEnum = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as SwaggerType,
      isRequired: null == isRequired
          ? _self.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnum: null == isEnum
          ? _self.isEnum
          : isEnum // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [DataVariableComponent].
extension DataVariableComponentPatterns on DataVariableComponent {
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
    TResult Function(_DataVariableComponent value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DataVariableComponent() when $default != null:
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
    TResult Function(_DataVariableComponent value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DataVariableComponent():
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
    TResult? Function(_DataVariableComponent value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DataVariableComponent() when $default != null:
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
    TResult Function(
            String name, SwaggerType type, bool isRequired, bool isEnum)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DataVariableComponent() when $default != null:
        return $default(_that.name, _that.type, _that.isRequired, _that.isEnum);
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
    TResult Function(
            String name, SwaggerType type, bool isRequired, bool isEnum)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DataVariableComponent():
        return $default(_that.name, _that.type, _that.isRequired, _that.isEnum);
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
    TResult? Function(
            String name, SwaggerType type, bool isRequired, bool isEnum)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DataVariableComponent() when $default != null:
        return $default(_that.name, _that.type, _that.isRequired, _that.isEnum);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DataVariableComponent extends DataVariableComponent {
  const _DataVariableComponent(
      {required this.name,
      required this.type,
      required this.isRequired,
      this.isEnum = false})
      : super._();

  @override
  final String name;
  @override
  final SwaggerType type;
  @override
  final bool isRequired;
  @override
  @JsonKey()
  final bool isEnum;

  /// Create a copy of DataVariableComponent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataVariableComponentCopyWith<_DataVariableComponent> get copyWith =>
      __$DataVariableComponentCopyWithImpl<_DataVariableComponent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataVariableComponent &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.isEnum, isEnum) || other.isEnum == isEnum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, type, isRequired, isEnum);

  @override
  String toString() {
    return 'DataVariableComponent(name: $name, type: $type, isRequired: $isRequired, isEnum: $isEnum)';
  }
}

/// @nodoc
abstract mixin class _$DataVariableComponentCopyWith<$Res>
    implements $DataVariableComponentCopyWith<$Res> {
  factory _$DataVariableComponentCopyWith(_DataVariableComponent value,
          $Res Function(_DataVariableComponent) _then) =
      __$DataVariableComponentCopyWithImpl;
  @override
  @useResult
  $Res call({String name, SwaggerType type, bool isRequired, bool isEnum});
}

/// @nodoc
class __$DataVariableComponentCopyWithImpl<$Res>
    implements _$DataVariableComponentCopyWith<$Res> {
  __$DataVariableComponentCopyWithImpl(this._self, this._then);

  final _DataVariableComponent _self;
  final $Res Function(_DataVariableComponent) _then;

  /// Create a copy of DataVariableComponent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
    Object? isEnum = null,
  }) {
    return _then(_DataVariableComponent(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as SwaggerType,
      isRequired: null == isRequired
          ? _self.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      isEnum: null == isEnum
          ? _self.isEnum
          : isEnum // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
