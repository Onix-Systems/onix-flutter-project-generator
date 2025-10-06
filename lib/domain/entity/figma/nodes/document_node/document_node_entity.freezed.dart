// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_node_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocumentNodeEntity {
  String get id;
  String get key;
  String get name;
  String get type;
  List<BaseNode> get children;

  /// Create a copy of DocumentNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DocumentNodeEntityCopyWith<DocumentNodeEntity> get copyWith =>
      _$DocumentNodeEntityCopyWithImpl<DocumentNodeEntity>(
          this as DocumentNodeEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DocumentNodeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.children, children));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, key, name, type,
      const DeepCollectionEquality().hash(children));

  @override
  String toString() {
    return 'DocumentNodeEntity(id: $id, key: $key, name: $name, type: $type, children: $children)';
  }
}

/// @nodoc
abstract mixin class $DocumentNodeEntityCopyWith<$Res> {
  factory $DocumentNodeEntityCopyWith(
          DocumentNodeEntity value, $Res Function(DocumentNodeEntity) _then) =
      _$DocumentNodeEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String key,
      String name,
      String type,
      List<BaseNode> children});
}

/// @nodoc
class _$DocumentNodeEntityCopyWithImpl<$Res>
    implements $DocumentNodeEntityCopyWith<$Res> {
  _$DocumentNodeEntityCopyWithImpl(this._self, this._then);

  final DocumentNodeEntity _self;
  final $Res Function(DocumentNodeEntity) _then;

  /// Create a copy of DocumentNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
    Object? children = null,
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
      children: null == children
          ? _self.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<BaseNode>,
    ));
  }
}

/// Adds pattern-matching-related methods to [DocumentNodeEntity].
extension DocumentNodeEntityPatterns on DocumentNodeEntity {
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
    TResult Function(_DocumentNodeEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentNodeEntity() when $default != null:
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
    TResult Function(_DocumentNodeEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentNodeEntity():
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
    TResult? Function(_DocumentNodeEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentNodeEntity() when $default != null:
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
            List<BaseNode> children)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentNodeEntity() when $default != null:
        return $default(
            _that.id, _that.key, _that.name, _that.type, _that.children);
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
            List<BaseNode> children)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentNodeEntity():
        return $default(
            _that.id, _that.key, _that.name, _that.type, _that.children);
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
            List<BaseNode> children)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentNodeEntity() when $default != null:
        return $default(
            _that.id, _that.key, _that.name, _that.type, _that.children);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DocumentNodeEntity implements DocumentNodeEntity {
  const _DocumentNodeEntity(
      {required this.id,
      required this.key,
      required this.name,
      required this.type,
      required final List<BaseNode> children})
      : _children = children;

  @override
  final String id;
  @override
  final String key;
  @override
  final String name;
  @override
  final String type;
  final List<BaseNode> _children;
  @override
  List<BaseNode> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  /// Create a copy of DocumentNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DocumentNodeEntityCopyWith<_DocumentNodeEntity> get copyWith =>
      __$DocumentNodeEntityCopyWithImpl<_DocumentNodeEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DocumentNodeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, key, name, type,
      const DeepCollectionEquality().hash(_children));

  @override
  String toString() {
    return 'DocumentNodeEntity(id: $id, key: $key, name: $name, type: $type, children: $children)';
  }
}

/// @nodoc
abstract mixin class _$DocumentNodeEntityCopyWith<$Res>
    implements $DocumentNodeEntityCopyWith<$Res> {
  factory _$DocumentNodeEntityCopyWith(
          _DocumentNodeEntity value, $Res Function(_DocumentNodeEntity) _then) =
      __$DocumentNodeEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String key,
      String name,
      String type,
      List<BaseNode> children});
}

/// @nodoc
class __$DocumentNodeEntityCopyWithImpl<$Res>
    implements _$DocumentNodeEntityCopyWith<$Res> {
  __$DocumentNodeEntityCopyWithImpl(this._self, this._then);

  final _DocumentNodeEntity _self;
  final $Res Function(_DocumentNodeEntity) _then;

  /// Create a copy of DocumentNodeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? type = null,
    Object? children = null,
  }) {
    return _then(_DocumentNodeEntity(
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
      children: null == children
          ? _self._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<BaseNode>,
    ));
  }
}

// dart format on
