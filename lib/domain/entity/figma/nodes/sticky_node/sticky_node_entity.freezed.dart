// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sticky_node_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StickyNodeEntity {
  String get id;
  String get key;
  String get name;
  String get type;
  List<PaintProperty> get fills;

  /// Create a copy of StickyNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StickyNodeEntityCopyWith<StickyNodeEntity> get copyWith =>
      _$StickyNodeEntityCopyWithImpl<StickyNodeEntity>(
          this as StickyNodeEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StickyNodeEntity &&
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
    return 'StickyNodeEntity(id: $id, key: $key, name: $name, type: $type, fills: $fills)';
  }
}

/// @nodoc
abstract mixin class $StickyNodeEntityCopyWith<$Res> {
  factory $StickyNodeEntityCopyWith(
          StickyNodeEntity value, $Res Function(StickyNodeEntity) _then) =
      _$StickyNodeEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String key,
      String name,
      String type,
      List<PaintProperty> fills});
}

/// @nodoc
class _$StickyNodeEntityCopyWithImpl<$Res>
    implements $StickyNodeEntityCopyWith<$Res> {
  _$StickyNodeEntityCopyWithImpl(this._self, this._then);

  final StickyNodeEntity _self;
  final $Res Function(StickyNodeEntity) _then;

  /// Create a copy of StickyNodeEntity
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

/// Adds pattern-matching-related methods to [StickyNodeEntity].
extension StickyNodeEntityPatterns on StickyNodeEntity {
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
    TResult Function(_StickyNodeEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StickyNodeEntity() when $default != null:
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
    TResult Function(_StickyNodeEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StickyNodeEntity():
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
    TResult? Function(_StickyNodeEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StickyNodeEntity() when $default != null:
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
      case _StickyNodeEntity() when $default != null:
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
      case _StickyNodeEntity():
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
      case _StickyNodeEntity() when $default != null:
        return $default(
            _that.id, _that.key, _that.name, _that.type, _that.fills);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StickyNodeEntity implements StickyNodeEntity {
  const _StickyNodeEntity(
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

  /// Create a copy of StickyNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StickyNodeEntityCopyWith<_StickyNodeEntity> get copyWith =>
      __$StickyNodeEntityCopyWithImpl<_StickyNodeEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StickyNodeEntity &&
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
    return 'StickyNodeEntity(id: $id, key: $key, name: $name, type: $type, fills: $fills)';
  }
}

/// @nodoc
abstract mixin class _$StickyNodeEntityCopyWith<$Res>
    implements $StickyNodeEntityCopyWith<$Res> {
  factory _$StickyNodeEntityCopyWith(
          _StickyNodeEntity value, $Res Function(_StickyNodeEntity) _then) =
      __$StickyNodeEntityCopyWithImpl;
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
class __$StickyNodeEntityCopyWithImpl<$Res>
    implements _$StickyNodeEntityCopyWith<$Res> {
  __$StickyNodeEntityCopyWithImpl(this._self, this._then);

  final _StickyNodeEntity _self;
  final $Res Function(_StickyNodeEntity) _then;

  /// Create a copy of StickyNodeEntity
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
    return _then(_StickyNodeEntity(
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
