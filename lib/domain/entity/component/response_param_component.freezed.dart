// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_param_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResponseParamComponent {
  String get name;
  SwaggerType get type;
  bool get isRequired;
  bool get isEnum;
  bool get fromSwagger;

  /// Create a copy of ResponseParamComponent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseParamComponentCopyWith<ResponseParamComponent> get copyWith =>
      _$ResponseParamComponentCopyWithImpl<ResponseParamComponent>(
          this as ResponseParamComponent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseParamComponent &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.isEnum, isEnum) || other.isEnum == isEnum) &&
            (identical(other.fromSwagger, fromSwagger) ||
                other.fromSwagger == fromSwagger));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, type, isRequired, isEnum, fromSwagger);

  @override
  String toString() {
    return 'ResponseParamComponent(name: $name, type: $type, isRequired: $isRequired, isEnum: $isEnum, fromSwagger: $fromSwagger)';
  }
}

/// @nodoc
abstract mixin class $ResponseParamComponentCopyWith<$Res> {
  factory $ResponseParamComponentCopyWith(ResponseParamComponent value,
          $Res Function(ResponseParamComponent) _then) =
      _$ResponseParamComponentCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      SwaggerType type,
      bool isRequired,
      bool isEnum,
      bool fromSwagger});
}

/// @nodoc
class _$ResponseParamComponentCopyWithImpl<$Res>
    implements $ResponseParamComponentCopyWith<$Res> {
  _$ResponseParamComponentCopyWithImpl(this._self, this._then);

  final ResponseParamComponent _self;
  final $Res Function(ResponseParamComponent) _then;

  /// Create a copy of ResponseParamComponent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
    Object? isEnum = null,
    Object? fromSwagger = null,
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
      fromSwagger: null == fromSwagger
          ? _self.fromSwagger
          : fromSwagger // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ResponseParamComponent].
extension ResponseParamComponentPatterns on ResponseParamComponent {
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
    TResult Function(_ResponseParamComponent value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResponseParamComponent() when $default != null:
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
    TResult Function(_ResponseParamComponent value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseParamComponent():
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
    TResult? Function(_ResponseParamComponent value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseParamComponent() when $default != null:
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
    TResult Function(String name, SwaggerType type, bool isRequired,
            bool isEnum, bool fromSwagger)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResponseParamComponent() when $default != null:
        return $default(_that.name, _that.type, _that.isRequired, _that.isEnum,
            _that.fromSwagger);
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
    TResult Function(String name, SwaggerType type, bool isRequired,
            bool isEnum, bool fromSwagger)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseParamComponent():
        return $default(_that.name, _that.type, _that.isRequired, _that.isEnum,
            _that.fromSwagger);
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
    TResult? Function(String name, SwaggerType type, bool isRequired,
            bool isEnum, bool fromSwagger)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseParamComponent() when $default != null:
        return $default(_that.name, _that.type, _that.isRequired, _that.isEnum,
            _that.fromSwagger);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ResponseParamComponent extends ResponseParamComponent {
  const _ResponseParamComponent(
      {required this.name,
      required this.type,
      required this.isRequired,
      this.isEnum = false,
      this.fromSwagger = true})
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
  @override
  @JsonKey()
  final bool fromSwagger;

  /// Create a copy of ResponseParamComponent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResponseParamComponentCopyWith<_ResponseParamComponent> get copyWith =>
      __$ResponseParamComponentCopyWithImpl<_ResponseParamComponent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResponseParamComponent &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.isEnum, isEnum) || other.isEnum == isEnum) &&
            (identical(other.fromSwagger, fromSwagger) ||
                other.fromSwagger == fromSwagger));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, type, isRequired, isEnum, fromSwagger);

  @override
  String toString() {
    return 'ResponseParamComponent(name: $name, type: $type, isRequired: $isRequired, isEnum: $isEnum, fromSwagger: $fromSwagger)';
  }
}

/// @nodoc
abstract mixin class _$ResponseParamComponentCopyWith<$Res>
    implements $ResponseParamComponentCopyWith<$Res> {
  factory _$ResponseParamComponentCopyWith(_ResponseParamComponent value,
          $Res Function(_ResponseParamComponent) _then) =
      __$ResponseParamComponentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      SwaggerType type,
      bool isRequired,
      bool isEnum,
      bool fromSwagger});
}

/// @nodoc
class __$ResponseParamComponentCopyWithImpl<$Res>
    implements _$ResponseParamComponentCopyWith<$Res> {
  __$ResponseParamComponentCopyWithImpl(this._self, this._then);

  final _ResponseParamComponent _self;
  final $Res Function(_ResponseParamComponent) _then;

  /// Create a copy of ResponseParamComponent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
    Object? isEnum = null,
    Object? fromSwagger = null,
  }) {
    return _then(_ResponseParamComponent(
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
      fromSwagger: null == fromSwagger
          ? _self.fromSwagger
          : fromSwagger // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
