// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'component_dialog_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ComponentDialogState {
  Component? get component => throw _privateConstructorUsedError;
  Components? get components => throw _privateConstructorUsedError;
  List<String> get componentNames => throw _privateConstructorUsedError;
  List<DataVariableComponent> get variables =>
      throw _privateConstructorUsedError;
  List<DataObjectComponent> get children => throw _privateConstructorUsedError;

  /// Create a copy of ComponentDialogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComponentDialogStateCopyWith<ComponentDialogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComponentDialogStateCopyWith<$Res> {
  factory $ComponentDialogStateCopyWith(ComponentDialogState value,
          $Res Function(ComponentDialogState) then) =
      _$ComponentDialogStateCopyWithImpl<$Res, ComponentDialogState>;
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
class _$ComponentDialogStateCopyWithImpl<$Res,
        $Val extends ComponentDialogState>
    implements $ComponentDialogStateCopyWith<$Res> {
  _$ComponentDialogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      component: freezed == component
          ? _value.component
          : component // ignore: cast_nullable_to_non_nullable
              as Component?,
      components: freezed == components
          ? _value.components
          : components // ignore: cast_nullable_to_non_nullable
              as Components?,
      componentNames: null == componentNames
          ? _value.componentNames
          : componentNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      variables: null == variables
          ? _value.variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<DataVariableComponent>,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<DataObjectComponent>,
    ) as $Val);
  }

  /// Create a copy of ComponentDialogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ComponentsCopyWith<$Res>? get components {
    if (_value.components == null) {
      return null;
    }

    return $ComponentsCopyWith<$Res>(_value.components!, (value) {
      return _then(_value.copyWith(components: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ComponentDialogStateImplCopyWith<$Res>
    implements $ComponentDialogStateCopyWith<$Res> {
  factory _$$ComponentDialogStateImplCopyWith(_$ComponentDialogStateImpl value,
          $Res Function(_$ComponentDialogStateImpl) then) =
      __$$ComponentDialogStateImplCopyWithImpl<$Res>;
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
class __$$ComponentDialogStateImplCopyWithImpl<$Res>
    extends _$ComponentDialogStateCopyWithImpl<$Res, _$ComponentDialogStateImpl>
    implements _$$ComponentDialogStateImplCopyWith<$Res> {
  __$$ComponentDialogStateImplCopyWithImpl(_$ComponentDialogStateImpl _value,
      $Res Function(_$ComponentDialogStateImpl) _then)
      : super(_value, _then);

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
    return _then(_$ComponentDialogStateImpl(
      component: freezed == component
          ? _value.component
          : component // ignore: cast_nullable_to_non_nullable
              as Component?,
      components: freezed == components
          ? _value.components
          : components // ignore: cast_nullable_to_non_nullable
              as Components?,
      componentNames: null == componentNames
          ? _value._componentNames
          : componentNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      variables: null == variables
          ? _value._variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<DataVariableComponent>,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<DataObjectComponent>,
    ));
  }
}

/// @nodoc

class _$ComponentDialogStateImpl implements _ComponentDialogState {
  const _$ComponentDialogStateImpl(
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

  @override
  String toString() {
    return 'ComponentDialogState(component: $component, components: $components, componentNames: $componentNames, variables: $variables, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComponentDialogStateImpl &&
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

  /// Create a copy of ComponentDialogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComponentDialogStateImplCopyWith<_$ComponentDialogStateImpl>
      get copyWith =>
          __$$ComponentDialogStateImplCopyWithImpl<_$ComponentDialogStateImpl>(
              this, _$identity);
}

abstract class _ComponentDialogState implements ComponentDialogState {
  const factory _ComponentDialogState(
      {final Component? component,
      final Components? components,
      final List<String> componentNames,
      final List<DataVariableComponent> variables,
      final List<DataObjectComponent> children}) = _$ComponentDialogStateImpl;

  @override
  Component? get component;
  @override
  Components? get components;
  @override
  List<String> get componentNames;
  @override
  List<DataVariableComponent> get variables;
  @override
  List<DataObjectComponent> get children;

  /// Create a copy of ComponentDialogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComponentDialogStateImplCopyWith<_$ComponentDialogStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
