// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_node_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TextNodeEntity {
  TypeStyleMetadata get style;
  String get id;
  String get key;
  String get name;
  String get type;
  List<PaintProperty> get fills;

  /// Create a copy of TextNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TextNodeEntityCopyWith<TextNodeEntity> get copyWith =>
      _$TextNodeEntityCopyWithImpl<TextNodeEntity>(
          this as TextNodeEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextNodeEntity &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.fills, fills));
  }

  @override
  int get hashCode => Object.hash(runtimeType, style, id, key, name, type,
      const DeepCollectionEquality().hash(fills));

  @override
  String toString() {
    return 'TextNodeEntity(style: $style, id: $id, key: $key, name: $name, type: $type, fills: $fills)';
  }
}

/// @nodoc
abstract mixin class $TextNodeEntityCopyWith<$Res> {
  factory $TextNodeEntityCopyWith(
          TextNodeEntity value, $Res Function(TextNodeEntity) _then) =
      _$TextNodeEntityCopyWithImpl;
  @useResult
  $Res call(
      {TypeStyleMetadata style,
      String id,
      String key,
      String name,
      String type,
      List<PaintProperty> fills});

  $TypeStyleMetadataCopyWith<$Res> get style;
}

/// @nodoc
class _$TextNodeEntityCopyWithImpl<$Res>
    implements $TextNodeEntityCopyWith<$Res> {
  _$TextNodeEntityCopyWithImpl(this._self, this._then);

  final TextNodeEntity _self;
  final $Res Function(TextNodeEntity) _then;

  /// Create a copy of TextNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? style = null,
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
    Object? fills = null,
  }) {
    return _then(_self.copyWith(
      style: null == style
          ? _self.style
          : style // ignore: cast_nullable_to_non_nullable
              as TypeStyleMetadata,
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

  /// Create a copy of TextNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TypeStyleMetadataCopyWith<$Res> get style {
    return $TypeStyleMetadataCopyWith<$Res>(_self.style, (value) {
      return _then(_self.copyWith(style: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TextNodeEntity].
extension TextNodeEntityPatterns on TextNodeEntity {
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
    TResult Function(_TextNodeEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TextNodeEntity() when $default != null:
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
    TResult Function(_TextNodeEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TextNodeEntity():
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
    TResult? Function(_TextNodeEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TextNodeEntity() when $default != null:
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
    TResult Function(TypeStyleMetadata style, String id, String key,
            String name, String type, List<PaintProperty> fills)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TextNodeEntity() when $default != null:
        return $default(_that.style, _that.id, _that.key, _that.name,
            _that.type, _that.fills);
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
    TResult Function(TypeStyleMetadata style, String id, String key,
            String name, String type, List<PaintProperty> fills)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TextNodeEntity():
        return $default(_that.style, _that.id, _that.key, _that.name,
            _that.type, _that.fills);
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
    TResult? Function(TypeStyleMetadata style, String id, String key,
            String name, String type, List<PaintProperty> fills)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TextNodeEntity() when $default != null:
        return $default(_that.style, _that.id, _that.key, _that.name,
            _that.type, _that.fills);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TextNodeEntity implements TextNodeEntity {
  const _TextNodeEntity(
      {required this.style,
      required this.id,
      required this.key,
      required this.name,
      required this.type,
      required final List<PaintProperty> fills})
      : _fills = fills;

  @override
  final TypeStyleMetadata style;
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

  /// Create a copy of TextNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TextNodeEntityCopyWith<_TextNodeEntity> get copyWith =>
      __$TextNodeEntityCopyWithImpl<_TextNodeEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TextNodeEntity &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._fills, _fills));
  }

  @override
  int get hashCode => Object.hash(runtimeType, style, id, key, name, type,
      const DeepCollectionEquality().hash(_fills));

  @override
  String toString() {
    return 'TextNodeEntity(style: $style, id: $id, key: $key, name: $name, type: $type, fills: $fills)';
  }
}

/// @nodoc
abstract mixin class _$TextNodeEntityCopyWith<$Res>
    implements $TextNodeEntityCopyWith<$Res> {
  factory _$TextNodeEntityCopyWith(
          _TextNodeEntity value, $Res Function(_TextNodeEntity) _then) =
      __$TextNodeEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {TypeStyleMetadata style,
      String id,
      String key,
      String name,
      String type,
      List<PaintProperty> fills});

  @override
  $TypeStyleMetadataCopyWith<$Res> get style;
}

/// @nodoc
class __$TextNodeEntityCopyWithImpl<$Res>
    implements _$TextNodeEntityCopyWith<$Res> {
  __$TextNodeEntityCopyWithImpl(this._self, this._then);

  final _TextNodeEntity _self;
  final $Res Function(_TextNodeEntity) _then;

  /// Create a copy of TextNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? style = null,
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
    Object? fills = null,
  }) {
    return _then(_TextNodeEntity(
      style: null == style
          ? _self.style
          : style // ignore: cast_nullable_to_non_nullable
              as TypeStyleMetadata,
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

  /// Create a copy of TextNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TypeStyleMetadataCopyWith<$Res> get style {
    return $TypeStyleMetadataCopyWith<$Res>(_self.style, (value) {
      return _then(_self.copyWith(style: value));
    });
  }
}

// dart format on
