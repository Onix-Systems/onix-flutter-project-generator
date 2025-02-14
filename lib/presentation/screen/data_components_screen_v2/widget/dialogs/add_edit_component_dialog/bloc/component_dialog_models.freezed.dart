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
  List<String> get components => throw _privateConstructorUsedError;
  List<DataVariableComponent> get variables =>
      throw _privateConstructorUsedError;

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
  $Res call({List<String> components, List<DataVariableComponent> variables});
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
    Object? components = null,
    Object? variables = null,
  }) {
    return _then(_value.copyWith(
      components: null == components
          ? _value.components
          : components // ignore: cast_nullable_to_non_nullable
              as List<String>,
      variables: null == variables
          ? _value.variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<DataVariableComponent>,
    ) as $Val);
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
  $Res call({List<String> components, List<DataVariableComponent> variables});
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
    Object? components = null,
    Object? variables = null,
  }) {
    return _then(_$ComponentDialogStateImpl(
      components: null == components
          ? _value._components
          : components // ignore: cast_nullable_to_non_nullable
              as List<String>,
      variables: null == variables
          ? _value._variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<DataVariableComponent>,
    ));
  }
}

/// @nodoc

class _$ComponentDialogStateImpl implements _ComponentDialogState {
  const _$ComponentDialogStateImpl(
      {final List<String> components = const [],
      final List<DataVariableComponent> variables = const []})
      : _components = components,
        _variables = variables;

  final List<String> _components;
  @override
  @JsonKey()
  List<String> get components {
    if (_components is EqualUnmodifiableListView) return _components;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_components);
  }

  final List<DataVariableComponent> _variables;
  @override
  @JsonKey()
  List<DataVariableComponent> get variables {
    if (_variables is EqualUnmodifiableListView) return _variables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variables);
  }

  @override
  String toString() {
    return 'ComponentDialogState(components: $components, variables: $variables)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComponentDialogStateImpl &&
            const DeepCollectionEquality()
                .equals(other._components, _components) &&
            const DeepCollectionEquality()
                .equals(other._variables, _variables));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_components),
      const DeepCollectionEquality().hash(_variables));

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
          {final List<String> components,
          final List<DataVariableComponent> variables}) =
      _$ComponentDialogStateImpl;

  @override
  List<String> get components;
  @override
  List<DataVariableComponent> get variables;

  /// Create a copy of ComponentDialogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComponentDialogStateImplCopyWith<_$ComponentDialogStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
