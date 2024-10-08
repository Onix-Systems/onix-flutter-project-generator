// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_object_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DataObjectComponent {
  String get name => throw _privateConstructorUsedError;
  SwaggerReference get fileReference => throw _privateConstructorUsedError;
  List<DataVariableComponent> get variables =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataObjectComponentCopyWith<DataObjectComponent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataObjectComponentCopyWith<$Res> {
  factory $DataObjectComponentCopyWith(
          DataObjectComponent value, $Res Function(DataObjectComponent) then) =
      _$DataObjectComponentCopyWithImpl<$Res, DataObjectComponent>;
  @useResult
  $Res call(
      {String name,
      SwaggerReference fileReference,
      List<DataVariableComponent> variables});
}

/// @nodoc
class _$DataObjectComponentCopyWithImpl<$Res, $Val extends DataObjectComponent>
    implements $DataObjectComponentCopyWith<$Res> {
  _$DataObjectComponentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fileReference = null,
    Object? variables = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fileReference: null == fileReference
          ? _value.fileReference
          : fileReference // ignore: cast_nullable_to_non_nullable
              as SwaggerReference,
      variables: null == variables
          ? _value.variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<DataVariableComponent>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataObjectComponentImplCopyWith<$Res>
    implements $DataObjectComponentCopyWith<$Res> {
  factory _$$DataObjectComponentImplCopyWith(_$DataObjectComponentImpl value,
          $Res Function(_$DataObjectComponentImpl) then) =
      __$$DataObjectComponentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      SwaggerReference fileReference,
      List<DataVariableComponent> variables});
}

/// @nodoc
class __$$DataObjectComponentImplCopyWithImpl<$Res>
    extends _$DataObjectComponentCopyWithImpl<$Res, _$DataObjectComponentImpl>
    implements _$$DataObjectComponentImplCopyWith<$Res> {
  __$$DataObjectComponentImplCopyWithImpl(_$DataObjectComponentImpl _value,
      $Res Function(_$DataObjectComponentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fileReference = null,
    Object? variables = null,
  }) {
    return _then(_$DataObjectComponentImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fileReference: null == fileReference
          ? _value.fileReference
          : fileReference // ignore: cast_nullable_to_non_nullable
              as SwaggerReference,
      variables: null == variables
          ? _value._variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<DataVariableComponent>,
    ));
  }
}

/// @nodoc

class _$DataObjectComponentImpl extends _DataObjectComponent {
  const _$DataObjectComponentImpl(
      {required this.name,
      required this.fileReference,
      required final List<DataVariableComponent> variables})
      : _variables = variables,
        super._();

  @override
  final String name;
  @override
  final SwaggerReference fileReference;
  final List<DataVariableComponent> _variables;
  @override
  List<DataVariableComponent> get variables {
    if (_variables is EqualUnmodifiableListView) return _variables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variables);
  }

  @override
  String toString() {
    return 'DataObjectComponent(name: $name, fileReference: $fileReference, variables: $variables)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataObjectComponentImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fileReference, fileReference) ||
                other.fileReference == fileReference) &&
            const DeepCollectionEquality()
                .equals(other._variables, _variables));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, fileReference,
      const DeepCollectionEquality().hash(_variables));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataObjectComponentImplCopyWith<_$DataObjectComponentImpl> get copyWith =>
      __$$DataObjectComponentImplCopyWithImpl<_$DataObjectComponentImpl>(
          this, _$identity);
}

abstract class _DataObjectComponent extends DataObjectComponent {
  const factory _DataObjectComponent(
          {required final String name,
          required final SwaggerReference fileReference,
          required final List<DataVariableComponent> variables}) =
      _$DataObjectComponentImpl;
  const _DataObjectComponent._() : super._();

  @override
  String get name;
  @override
  SwaggerReference get fileReference;
  @override
  List<DataVariableComponent> get variables;
  @override
  @JsonKey(ignore: true)
  _$$DataObjectComponentImplCopyWith<_$DataObjectComponentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
