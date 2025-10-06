// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_node_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseNodeEntity {
  String get id;
  String get key;
  String get name;
  String get type;

  /// Create a copy of BaseNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BaseNodeEntityCopyWith<BaseNodeEntity> get copyWith =>
      _$BaseNodeEntityCopyWithImpl<BaseNodeEntity>(
          this as BaseNodeEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BaseNodeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, key, name, type);

  @override
  String toString() {
    return 'BaseNodeEntity(id: $id, key: $key, name: $name, type: $type)';
  }
}

/// @nodoc
abstract mixin class $BaseNodeEntityCopyWith<$Res> {
  factory $BaseNodeEntityCopyWith(
          BaseNodeEntity value, $Res Function(BaseNodeEntity) _then) =
      _$BaseNodeEntityCopyWithImpl;
  @useResult
  $Res call({String id, String key, String name, String type});
}

/// @nodoc
class _$BaseNodeEntityCopyWithImpl<$Res>
    implements $BaseNodeEntityCopyWith<$Res> {
  _$BaseNodeEntityCopyWithImpl(this._self, this._then);

  final BaseNodeEntity _self;
  final $Res Function(BaseNodeEntity) _then;

  /// Create a copy of BaseNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [BaseNodeEntity].
extension BaseNodeEntityPatterns on BaseNodeEntity {
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
    TResult Function(_BaseNodeEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BaseNodeEntity() when $default != null:
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
    TResult Function(_BaseNodeEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BaseNodeEntity():
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
    TResult? Function(_BaseNodeEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BaseNodeEntity() when $default != null:
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
    TResult Function(String id, String key, String name, String type)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BaseNodeEntity() when $default != null:
        return $default(_that.id, _that.key, _that.name, _that.type);
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
    TResult Function(String id, String key, String name, String type) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BaseNodeEntity():
        return $default(_that.id, _that.key, _that.name, _that.type);
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
    TResult? Function(String id, String key, String name, String type)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BaseNodeEntity() when $default != null:
        return $default(_that.id, _that.key, _that.name, _that.type);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BaseNodeEntity implements BaseNodeEntity {
  const _BaseNodeEntity(
      {required this.id,
      required this.key,
      required this.name,
      required this.type});

  @override
  final String id;
  @override
  final String key;
  @override
  final String name;
  @override
  final String type;

  /// Create a copy of BaseNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BaseNodeEntityCopyWith<_BaseNodeEntity> get copyWith =>
      __$BaseNodeEntityCopyWithImpl<_BaseNodeEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BaseNodeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, key, name, type);

  @override
  String toString() {
    return 'BaseNodeEntity(id: $id, key: $key, name: $name, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$BaseNodeEntityCopyWith<$Res>
    implements $BaseNodeEntityCopyWith<$Res> {
  factory _$BaseNodeEntityCopyWith(
          _BaseNodeEntity value, $Res Function(_BaseNodeEntity) _then) =
      __$BaseNodeEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String key, String name, String type});
}

/// @nodoc
class __$BaseNodeEntityCopyWithImpl<$Res>
    implements _$BaseNodeEntityCopyWith<$Res> {
  __$BaseNodeEntityCopyWithImpl(this._self, this._then);

  final _BaseNodeEntity _self;
  final $Res Function(_BaseNodeEntity) _then;

  /// Create a copy of BaseNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_BaseNodeEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
