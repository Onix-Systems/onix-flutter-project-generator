// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node_style_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NodeStyleProperty {
  String get key;
  String get name;
  String get description;
  NodeStyleType get style;

  /// Create a copy of NodeStyleProperty
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NodeStylePropertyCopyWith<NodeStyleProperty> get copyWith =>
      _$NodeStylePropertyCopyWithImpl<NodeStyleProperty>(
          this as NodeStyleProperty, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NodeStyleProperty &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.style, style) || other.style == style));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, name, description, style);

  @override
  String toString() {
    return 'NodeStyleProperty(key: $key, name: $name, description: $description, style: $style)';
  }
}

/// @nodoc
abstract mixin class $NodeStylePropertyCopyWith<$Res> {
  factory $NodeStylePropertyCopyWith(
          NodeStyleProperty value, $Res Function(NodeStyleProperty) _then) =
      _$NodeStylePropertyCopyWithImpl;
  @useResult
  $Res call({String key, String name, String description, NodeStyleType style});
}

/// @nodoc
class _$NodeStylePropertyCopyWithImpl<$Res>
    implements $NodeStylePropertyCopyWith<$Res> {
  _$NodeStylePropertyCopyWithImpl(this._self, this._then);

  final NodeStyleProperty _self;
  final $Res Function(NodeStyleProperty) _then;

  /// Create a copy of NodeStyleProperty
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? description = null,
    Object? style = null,
  }) {
    return _then(_self.copyWith(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      style: null == style
          ? _self.style
          : style // ignore: cast_nullable_to_non_nullable
              as NodeStyleType,
    ));
  }
}

/// Adds pattern-matching-related methods to [NodeStyleProperty].
extension NodeStylePropertyPatterns on NodeStyleProperty {
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
    TResult Function(_NodeStyleProperty value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NodeStyleProperty() when $default != null:
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
    TResult Function(_NodeStyleProperty value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NodeStyleProperty():
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
    TResult? Function(_NodeStyleProperty value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NodeStyleProperty() when $default != null:
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
            String key, String name, String description, NodeStyleType style)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NodeStyleProperty() when $default != null:
        return $default(_that.key, _that.name, _that.description, _that.style);
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
            String key, String name, String description, NodeStyleType style)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NodeStyleProperty():
        return $default(_that.key, _that.name, _that.description, _that.style);
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
            String key, String name, String description, NodeStyleType style)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NodeStyleProperty() when $default != null:
        return $default(_that.key, _that.name, _that.description, _that.style);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NodeStyleProperty implements NodeStyleProperty {
  const _NodeStyleProperty(
      {required this.key,
      required this.name,
      required this.description,
      required this.style});

  @override
  final String key;
  @override
  final String name;
  @override
  final String description;
  @override
  final NodeStyleType style;

  /// Create a copy of NodeStyleProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NodeStylePropertyCopyWith<_NodeStyleProperty> get copyWith =>
      __$NodeStylePropertyCopyWithImpl<_NodeStyleProperty>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NodeStyleProperty &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.style, style) || other.style == style));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, name, description, style);

  @override
  String toString() {
    return 'NodeStyleProperty(key: $key, name: $name, description: $description, style: $style)';
  }
}

/// @nodoc
abstract mixin class _$NodeStylePropertyCopyWith<$Res>
    implements $NodeStylePropertyCopyWith<$Res> {
  factory _$NodeStylePropertyCopyWith(
          _NodeStyleProperty value, $Res Function(_NodeStyleProperty) _then) =
      __$NodeStylePropertyCopyWithImpl;
  @override
  @useResult
  $Res call({String key, String name, String description, NodeStyleType style});
}

/// @nodoc
class __$NodeStylePropertyCopyWithImpl<$Res>
    implements _$NodeStylePropertyCopyWith<$Res> {
  __$NodeStylePropertyCopyWithImpl(this._self, this._then);

  final _NodeStyleProperty _self;
  final $Res Function(_NodeStyleProperty) _then;

  /// Create a copy of NodeStyleProperty
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? description = null,
    Object? style = null,
  }) {
    return _then(_NodeStyleProperty(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      style: null == style
          ? _self.style
          : style // ignore: cast_nullable_to_non_nullable
              as NodeStyleType,
    ));
  }
}

// dart format on
