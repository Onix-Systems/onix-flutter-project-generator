// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vector_node_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VectorNodeEntity {
  String get id;
  String get key;
  String get name;
  String get type;
  List<PaintProperty> get fills;

  /// Create a copy of VectorNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VectorNodeEntityCopyWith<VectorNodeEntity> get copyWith =>
      _$VectorNodeEntityCopyWithImpl<VectorNodeEntity>(
          this as VectorNodeEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VectorNodeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.fills, fills));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, key, name, type,
      const DeepCollectionEquality().hash(fills));

  @override
  String toString() {
    return 'VectorNodeEntity(id: $id, key: $key, name: $name, type: $type, fills: $fills)';
  }
}

/// @nodoc
abstract mixin class $VectorNodeEntityCopyWith<$Res> {
  factory $VectorNodeEntityCopyWith(
          VectorNodeEntity value, $Res Function(VectorNodeEntity) _then) =
      _$VectorNodeEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String key,
      String name,
      String type,
      List<PaintProperty> fills});
}

/// @nodoc
class _$VectorNodeEntityCopyWithImpl<$Res>
    implements $VectorNodeEntityCopyWith<$Res> {
  _$VectorNodeEntityCopyWithImpl(this._self, this._then);

  final VectorNodeEntity _self;
  final $Res Function(VectorNodeEntity) _then;

  /// Create a copy of VectorNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
    Object? fills = null,
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
      fills: null == fills
          ? _self.fills
          : fills // ignore: cast_nullable_to_non_nullable
              as List<PaintProperty>,
    ));
  }
}

/// Adds pattern-matching-related methods to [VectorNodeEntity].
extension VectorNodeEntityPatterns on VectorNodeEntity {
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
    TResult Function(_VectorNodeEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VectorNodeEntity() when $default != null:
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
    TResult Function(_VectorNodeEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VectorNodeEntity():
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
    TResult? Function(_VectorNodeEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VectorNodeEntity() when $default != null:
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
    TResult Function(String id, String key, String name, String type,
            List<PaintProperty> fills)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VectorNodeEntity() when $default != null:
        return $default(
            _that.id, _that.key, _that.name, _that.type, _that.fills);
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
    TResult Function(String id, String key, String name, String type,
            List<PaintProperty> fills)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VectorNodeEntity():
        return $default(
            _that.id, _that.key, _that.name, _that.type, _that.fills);
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
    TResult? Function(String id, String key, String name, String type,
            List<PaintProperty> fills)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VectorNodeEntity() when $default != null:
        return $default(
            _that.id, _that.key, _that.name, _that.type, _that.fills);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VectorNodeEntity implements VectorNodeEntity {
  const _VectorNodeEntity(
      {required this.id,
      required this.key,
      required this.name,
      required this.type,
      required final List<PaintProperty> fills})
      : _fills = fills;

  @override
  final String id;
  @override
  final String key;
  @override
  final String name;
  @override
  final String type;
  final List<PaintProperty> _fills;
  @override
  List<PaintProperty> get fills {
    if (_fills is EqualUnmodifiableListView) return _fills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fills);
  }

  /// Create a copy of VectorNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VectorNodeEntityCopyWith<_VectorNodeEntity> get copyWith =>
      __$VectorNodeEntityCopyWithImpl<_VectorNodeEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VectorNodeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._fills, _fills));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, key, name, type,
      const DeepCollectionEquality().hash(_fills));

  @override
  String toString() {
    return 'VectorNodeEntity(id: $id, key: $key, name: $name, type: $type, fills: $fills)';
  }
}

/// @nodoc
abstract mixin class _$VectorNodeEntityCopyWith<$Res>
    implements $VectorNodeEntityCopyWith<$Res> {
  factory _$VectorNodeEntityCopyWith(
          _VectorNodeEntity value, $Res Function(_VectorNodeEntity) _then) =
      __$VectorNodeEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String key,
      String name,
      String type,
      List<PaintProperty> fills});
}

/// @nodoc
class __$VectorNodeEntityCopyWithImpl<$Res>
    implements _$VectorNodeEntityCopyWith<$Res> {
  __$VectorNodeEntityCopyWithImpl(this._self, this._then);

  final _VectorNodeEntity _self;
  final $Res Function(_VectorNodeEntity) _then;

  /// Create a copy of VectorNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
    Object? fills = null,
  }) {
    return _then(_VectorNodeEntity(
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
      fills: null == fills
          ? _self._fills
          : fills // ignore: cast_nullable_to_non_nullable
              as List<PaintProperty>,
    ));
  }
}

// dart format on
