// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_variable_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DataVariableComponent {
  String get name => throw _privateConstructorUsedError;
  SwaggerType get type => throw _privateConstructorUsedError;
  bool get isRequired => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataVariableComponentCopyWith<DataVariableComponent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataVariableComponentCopyWith<$Res> {
  factory $DataVariableComponentCopyWith(DataVariableComponent value,
          $Res Function(DataVariableComponent) then) =
      _$DataVariableComponentCopyWithImpl<$Res, DataVariableComponent>;
  @useResult
  $Res call({String name, SwaggerType type, bool isRequired});
}

/// @nodoc
class _$DataVariableComponentCopyWithImpl<$Res,
        $Val extends DataVariableComponent>
    implements $DataVariableComponentCopyWith<$Res> {
  _$DataVariableComponentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SwaggerType,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataVariableComponentImplCopyWith<$Res>
    implements $DataVariableComponentCopyWith<$Res> {
  factory _$$DataVariableComponentImplCopyWith(
          _$DataVariableComponentImpl value,
          $Res Function(_$DataVariableComponentImpl) then) =
      __$$DataVariableComponentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, SwaggerType type, bool isRequired});
}

/// @nodoc
class __$$DataVariableComponentImplCopyWithImpl<$Res>
    extends _$DataVariableComponentCopyWithImpl<$Res,
        _$DataVariableComponentImpl>
    implements _$$DataVariableComponentImplCopyWith<$Res> {
  __$$DataVariableComponentImplCopyWithImpl(_$DataVariableComponentImpl _value,
      $Res Function(_$DataVariableComponentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
  }) {
    return _then(_$DataVariableComponentImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SwaggerType,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DataVariableComponentImpl extends _DataVariableComponent {
  const _$DataVariableComponentImpl(
      {required this.name, required this.type, required this.isRequired})
      : super._();

  @override
  final String name;
  @override
  final SwaggerType type;
  @override
  final bool isRequired;

  @override
  String toString() {
    return 'DataVariableComponent(name: $name, type: $type, isRequired: $isRequired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataVariableComponentImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, type, isRequired);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataVariableComponentImplCopyWith<_$DataVariableComponentImpl>
      get copyWith => __$$DataVariableComponentImplCopyWithImpl<
          _$DataVariableComponentImpl>(this, _$identity);
}

abstract class _DataVariableComponent extends DataVariableComponent {
  const factory _DataVariableComponent(
      {required final String name,
      required final SwaggerType type,
      required final bool isRequired}) = _$DataVariableComponentImpl;
  const _DataVariableComponent._() : super._();

  @override
  String get name;
  @override
  SwaggerType get type;
  @override
  bool get isRequired;
  @override
  @JsonKey(ignore: true)
  _$$DataVariableComponentImplCopyWith<_$DataVariableComponentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
