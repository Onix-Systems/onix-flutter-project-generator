// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'component_dialog_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComponentDialogState {
  Component? get component;
  Components? get components;
  List<String> get componentNames;
  List<DataVariableComponent> get variables;
  List<DataObjectComponent> get children;

  /// Create a copy of ComponentDialogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ComponentDialogStateCopyWith<ComponentDialogState> get copyWith =>
      _$ComponentDialogStateCopyWithImpl<ComponentDialogState>(
          this as ComponentDialogState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComponentDialogState &&
            (identical(other.component, component) ||
                other.component == component) &&
            (identical(other.components, components) ||
                other.components == components) &&
            const DeepCollectionEquality()
                .equals(other.componentNames, componentNames) &&
            const DeepCollectionEquality().equals(other.variables, variables) &&
            const DeepCollectionEquality().equals(other.children, children));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      component,
      components,
      const DeepCollectionEquality().hash(componentNames),
      const DeepCollectionEquality().hash(variables),
      const DeepCollectionEquality().hash(children));

  @override
  String toString() {
    return 'ComponentDialogState(component: $component, components: $components, componentNames: $componentNames, variables: $variables, children: $children)';
  }
}

/// @nodoc
abstract mixin class $ComponentDialogStateCopyWith<$Res> {
  factory $ComponentDialogStateCopyWith(ComponentDialogState value,
          $Res Function(ComponentDialogState) _then) =
      _$ComponentDialogStateCopyWithImpl;
  @useResult
  $Res call(
      {Component? component,
      Components? components,
      List<String> componentNames,
      List<DataVariableComponent> variables,
      List<DataObjectComponent> children});

  $ComponentsCopyWith<$Res>? get components;
}

/// @nodoc
class _$ComponentDialogStateCopyWithImpl<$Res>
    implements $ComponentDialogStateCopyWith<$Res> {
  _$ComponentDialogStateCopyWithImpl(this._self, this._then);

  final ComponentDialogState _self;
  final $Res Function(ComponentDialogState) _then;

  /// Create a copy of ComponentDialogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? component = freezed,
    Object? components = freezed,
    Object? componentNames = null,
    Object? variables = null,
    Object? children = null,
  }) {
    return _then(_self.copyWith(
      component: freezed == component
          ? _self.component
          : component // ignore: cast_nullable_to_non_nullable
              as Component?,
      components: freezed == components
          ? _self.components
          : components // ignore: cast_nullable_to_non_nullable
              as Components?,
      componentNames: null == componentNames
          ? _self.componentNames
          : componentNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      variables: null == variables
          ? _self.variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<DataVariableComponent>,
      children: null == children
          ? _self.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<DataObjectComponent>,
    ));
  }

  /// Create a copy of ComponentDialogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ComponentsCopyWith<$Res>? get components {
    if (_self.components == null) {
      return null;
    }

    return $ComponentsCopyWith<$Res>(_self.components!, (value) {
      return _then(_self.copyWith(components: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ComponentDialogState].
extension ComponentDialogStatePatterns on ComponentDialogState {
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
    TResult Function(_ComponentDialogState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ComponentDialogState() when $default != null:
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
    TResult Function(_ComponentDialogState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComponentDialogState():
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
    TResult? Function(_ComponentDialogState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComponentDialogState() when $default != null:
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
            Component? component,
            Components? components,
            List<String> componentNames,
            List<DataVariableComponent> variables,
            List<DataObjectComponent> children)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ComponentDialogState() when $default != null:
        return $default(_that.component, _that.components, _that.componentNames,
            _that.variables, _that.children);
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
            Component? component,
            Components? components,
            List<String> componentNames,
            List<DataVariableComponent> variables,
            List<DataObjectComponent> children)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComponentDialogState():
        return $default(_that.component, _that.components, _that.componentNames,
            _that.variables, _that.children);
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
            Component? component,
            Components? components,
            List<String> componentNames,
            List<DataVariableComponent> variables,
            List<DataObjectComponent> children)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComponentDialogState() when $default != null:
        return $default(_that.component, _that.components, _that.componentNames,
            _that.variables, _that.children);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ComponentDialogState implements ComponentDialogState {
  const _ComponentDialogState(
      {this.component,
      this.components,
      final List<String> componentNames = const [],
      final List<DataVariableComponent> variables = const [],
      final List<DataObjectComponent> children = const []})
      : _componentNames = componentNames,
        _variables = variables,
        _children = children;

  @override
  final Component? component;
  @override
  final Components? components;
  final List<String> _componentNames;
  @override
  @JsonKey()
  List<String> get componentNames {
    if (_componentNames is EqualUnmodifiableListView) return _componentNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_componentNames);
  }

  final List<DataVariableComponent> _variables;
  @override
  @JsonKey()
  List<DataVariableComponent> get variables {
    if (_variables is EqualUnmodifiableListView) return _variables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variables);
  }

  final List<DataObjectComponent> _children;
  @override
  @JsonKey()
  List<DataObjectComponent> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  /// Create a copy of ComponentDialogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ComponentDialogStateCopyWith<_ComponentDialogState> get copyWith =>
      __$ComponentDialogStateCopyWithImpl<_ComponentDialogState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ComponentDialogState &&
            (identical(other.component, component) ||
                other.component == component) &&
            (identical(other.components, components) ||
                other.components == components) &&
            const DeepCollectionEquality()
                .equals(other._componentNames, _componentNames) &&
            const DeepCollectionEquality()
                .equals(other._variables, _variables) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      component,
      components,
      const DeepCollectionEquality().hash(_componentNames),
      const DeepCollectionEquality().hash(_variables),
      const DeepCollectionEquality().hash(_children));

  @override
  String toString() {
    return 'ComponentDialogState(component: $component, components: $components, componentNames: $componentNames, variables: $variables, children: $children)';
  }
}

/// @nodoc
abstract mixin class _$ComponentDialogStateCopyWith<$Res>
    implements $ComponentDialogStateCopyWith<$Res> {
  factory _$ComponentDialogStateCopyWith(_ComponentDialogState value,
          $Res Function(_ComponentDialogState) _then) =
      __$ComponentDialogStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Component? component,
      Components? components,
      List<String> componentNames,
      List<DataVariableComponent> variables,
      List<DataObjectComponent> children});

  @override
  $ComponentsCopyWith<$Res>? get components;
}

/// @nodoc
class __$ComponentDialogStateCopyWithImpl<$Res>
    implements _$ComponentDialogStateCopyWith<$Res> {
  __$ComponentDialogStateCopyWithImpl(this._self, this._then);

  final _ComponentDialogState _self;
  final $Res Function(_ComponentDialogState) _then;

  /// Create a copy of ComponentDialogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? component = freezed,
    Object? components = freezed,
    Object? componentNames = null,
    Object? variables = null,
    Object? children = null,
  }) {
    return _then(_ComponentDialogState(
      component: freezed == component
          ? _self.component
          : component // ignore: cast_nullable_to_non_nullable
              as Component?,
      components: freezed == components
          ? _self.components
          : components // ignore: cast_nullable_to_non_nullable
              as Components?,
      componentNames: null == componentNames
          ? _self._componentNames
          : componentNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      variables: null == variables
          ? _self._variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<DataVariableComponent>,
      children: null == children
          ? _self._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<DataObjectComponent>,
    ));
  }

  /// Create a copy of ComponentDialogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ComponentsCopyWith<$Res>? get components {
    if (_self.components == null) {
      return null;
    }

    return $ComponentsCopyWith<$Res>(_self.components!, (value) {
      return _then(_self.copyWith(components: value));
    });
  }
}

// dart format on
