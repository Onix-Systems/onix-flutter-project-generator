// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'components.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Components {
  List<SourceComponent> get sources;
  List<EnumParamComponent> get enums;
  List<DataObjectComponent> get dataObjects;

  /// Create a copy of Components
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ComponentsCopyWith<Components> get copyWith =>
      _$ComponentsCopyWithImpl<Components>(this as Components, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Components &&
            const DeepCollectionEquality().equals(other.sources, sources) &&
            const DeepCollectionEquality().equals(other.enums, enums) &&
            const DeepCollectionEquality()
                .equals(other.dataObjects, dataObjects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sources),
      const DeepCollectionEquality().hash(enums),
      const DeepCollectionEquality().hash(dataObjects));

  @override
  String toString() {
    return 'Components(sources: $sources, enums: $enums, dataObjects: $dataObjects)';
  }
}

/// @nodoc
abstract mixin class $ComponentsCopyWith<$Res> {
  factory $ComponentsCopyWith(
          Components value, $Res Function(Components) _then) =
      _$ComponentsCopyWithImpl;
  @useResult
  $Res call(
      {List<SourceComponent> sources,
      List<EnumParamComponent> enums,
      List<DataObjectComponent> dataObjects});
}

/// @nodoc
class _$ComponentsCopyWithImpl<$Res> implements $ComponentsCopyWith<$Res> {
  _$ComponentsCopyWithImpl(this._self, this._then);

  final Components _self;
  final $Res Function(Components) _then;

  /// Create a copy of Components
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sources = null,
    Object? enums = null,
    Object? dataObjects = null,
  }) {
    return _then(_self.copyWith(
      sources: null == sources
          ? _self.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<SourceComponent>,
      enums: null == enums
          ? _self.enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<EnumParamComponent>,
      dataObjects: null == dataObjects
          ? _self.dataObjects
          : dataObjects // ignore: cast_nullable_to_non_nullable
              as List<DataObjectComponent>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Components].
extension ComponentsPatterns on Components {
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
    TResult Function(_Components value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Components() when $default != null:
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
    TResult Function(_Components value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Components():
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
    TResult? Function(_Components value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Components() when $default != null:
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
            List<SourceComponent> sources,
            List<EnumParamComponent> enums,
            List<DataObjectComponent> dataObjects)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Components() when $default != null:
        return $default(_that.sources, _that.enums, _that.dataObjects);
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
            List<SourceComponent> sources,
            List<EnumParamComponent> enums,
            List<DataObjectComponent> dataObjects)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Components():
        return $default(_that.sources, _that.enums, _that.dataObjects);
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
    TResult? Function(
            List<SourceComponent> sources,
            List<EnumParamComponent> enums,
            List<DataObjectComponent> dataObjects)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Components() when $default != null:
        return $default(_that.sources, _that.enums, _that.dataObjects);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Components extends Components {
  const _Components(
      {required final List<SourceComponent> sources,
      required final List<EnumParamComponent> enums,
      required final List<DataObjectComponent> dataObjects})
      : _sources = sources,
        _enums = enums,
        _dataObjects = dataObjects,
        super._();

  final List<SourceComponent> _sources;
  @override
  List<SourceComponent> get sources {
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

  final List<EnumParamComponent> _enums;
  @override
  List<EnumParamComponent> get enums {
    if (_enums is EqualUnmodifiableListView) return _enums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enums);
  }

  final List<DataObjectComponent> _dataObjects;
  @override
  List<DataObjectComponent> get dataObjects {
    if (_dataObjects is EqualUnmodifiableListView) return _dataObjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataObjects);
  }

  /// Create a copy of Components
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ComponentsCopyWith<_Components> get copyWith =>
      __$ComponentsCopyWithImpl<_Components>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Components &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
            const DeepCollectionEquality().equals(other._enums, _enums) &&
            const DeepCollectionEquality()
                .equals(other._dataObjects, _dataObjects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sources),
      const DeepCollectionEquality().hash(_enums),
      const DeepCollectionEquality().hash(_dataObjects));

  @override
  String toString() {
    return 'Components(sources: $sources, enums: $enums, dataObjects: $dataObjects)';
  }
}

/// @nodoc
abstract mixin class _$ComponentsCopyWith<$Res>
    implements $ComponentsCopyWith<$Res> {
  factory _$ComponentsCopyWith(
          _Components value, $Res Function(_Components) _then) =
      __$ComponentsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<SourceComponent> sources,
      List<EnumParamComponent> enums,
      List<DataObjectComponent> dataObjects});
}

/// @nodoc
class __$ComponentsCopyWithImpl<$Res> implements _$ComponentsCopyWith<$Res> {
  __$ComponentsCopyWithImpl(this._self, this._then);

  final _Components _self;
  final $Res Function(_Components) _then;

  /// Create a copy of Components
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sources = null,
    Object? enums = null,
    Object? dataObjects = null,
  }) {
    return _then(_Components(
      sources: null == sources
          ? _self._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<SourceComponent>,
      enums: null == enums
          ? _self._enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<EnumParamComponent>,
      dataObjects: null == dataObjects
          ? _self._dataObjects
          : dataObjects // ignore: cast_nullable_to_non_nullable
              as List<DataObjectComponent>,
    ));
  }
}

// dart format on
