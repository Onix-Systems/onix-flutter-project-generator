// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'frame_node_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FrameNodeEntity {
  List<PaintProperty> get fills;
  String get id;
  String get key;
  String get name;
  String get type;

  /// Create a copy of FrameNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FrameNodeEntityCopyWith<FrameNodeEntity> get copyWith =>
      _$FrameNodeEntityCopyWithImpl<FrameNodeEntity>(
          this as FrameNodeEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FrameNodeEntity &&
            const DeepCollectionEquality().equals(other.fills, fills) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(fills), id, key, name, type);

  @override
  String toString() {
    return 'FrameNodeEntity(fills: $fills, id: $id, key: $key, name: $name, type: $type)';
  }
}

/// @nodoc
abstract mixin class $FrameNodeEntityCopyWith<$Res> {
  factory $FrameNodeEntityCopyWith(
          FrameNodeEntity value, $Res Function(FrameNodeEntity) _then) =
      _$FrameNodeEntityCopyWithImpl;
  @useResult
  $Res call(
      {List<PaintProperty> fills,
      String id,
      String key,
      String name,
      String type});
}

/// @nodoc
class _$FrameNodeEntityCopyWithImpl<$Res>
    implements $FrameNodeEntityCopyWith<$Res> {
  _$FrameNodeEntityCopyWithImpl(this._self, this._then);

  final FrameNodeEntity _self;
  final $Res Function(FrameNodeEntity) _then;

  /// Create a copy of FrameNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fills = null,
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      fills: null == fills
          ? _self.fills
          : fills // ignore: cast_nullable_to_non_nullable
              as List<PaintProperty>,
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

/// Adds pattern-matching-related methods to [FrameNodeEntity].
extension FrameNodeEntityPatterns on FrameNodeEntity {
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
    TResult Function(_FrameNodeEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FrameNodeEntity() when $default != null:
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
    TResult Function(_FrameNodeEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FrameNodeEntity():
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
    TResult? Function(_FrameNodeEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FrameNodeEntity() when $default != null:
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
    TResult Function(List<PaintProperty> fills, String id, String key,
            String name, String type)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FrameNodeEntity() when $default != null:
        return $default(
            _that.fills, _that.id, _that.key, _that.name, _that.type);
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
    TResult Function(List<PaintProperty> fills, String id, String key,
            String name, String type)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FrameNodeEntity():
        return $default(
            _that.fills, _that.id, _that.key, _that.name, _that.type);
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
    TResult? Function(List<PaintProperty> fills, String id, String key,
            String name, String type)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FrameNodeEntity() when $default != null:
        return $default(
            _that.fills, _that.id, _that.key, _that.name, _that.type);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FrameNodeEntity implements FrameNodeEntity {
  const _FrameNodeEntity(
      {required final List<PaintProperty> fills,
      required this.id,
      required this.key,
      required this.name,
      required this.type})
      : _fills = fills;

  final List<PaintProperty> _fills;
  @override
  List<PaintProperty> get fills {
    if (_fills is EqualUnmodifiableListView) return _fills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fills);
  }

  @override
  final String id;
  @override
  final String key;
  @override
  final String name;
  @override
  final String type;

  /// Create a copy of FrameNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FrameNodeEntityCopyWith<_FrameNodeEntity> get copyWith =>
      __$FrameNodeEntityCopyWithImpl<_FrameNodeEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FrameNodeEntity &&
            const DeepCollectionEquality().equals(other._fills, _fills) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_fills), id, key, name, type);

  @override
  String toString() {
    return 'FrameNodeEntity(fills: $fills, id: $id, key: $key, name: $name, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$FrameNodeEntityCopyWith<$Res>
    implements $FrameNodeEntityCopyWith<$Res> {
  factory _$FrameNodeEntityCopyWith(
          _FrameNodeEntity value, $Res Function(_FrameNodeEntity) _then) =
      __$FrameNodeEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<PaintProperty> fills,
      String id,
      String key,
      String name,
      String type});
}

/// @nodoc
class __$FrameNodeEntityCopyWithImpl<$Res>
    implements _$FrameNodeEntityCopyWith<$Res> {
  __$FrameNodeEntityCopyWithImpl(this._self, this._then);

  final _FrameNodeEntity _self;
  final $Res Function(_FrameNodeEntity) _then;

  /// Create a copy of FrameNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fills = null,
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_FrameNodeEntity(
      fills: null == fills
          ? _self._fills
          : fills // ignore: cast_nullable_to_non_nullable
              as List<PaintProperty>,
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
