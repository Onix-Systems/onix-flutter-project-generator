// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enum_param_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EnumParamComponent {
  String get name => throw _privateConstructorUsedError;
  SwaggerEnum get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EnumParamComponentCopyWith<EnumParamComponent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnumParamComponentCopyWith<$Res> {
  factory $EnumParamComponentCopyWith(
          EnumParamComponent value, $Res Function(EnumParamComponent) then) =
      _$EnumParamComponentCopyWithImpl<$Res, EnumParamComponent>;
  @useResult
  $Res call({String name, SwaggerEnum type});
}

/// @nodoc
class _$EnumParamComponentCopyWithImpl<$Res, $Val extends EnumParamComponent>
    implements $EnumParamComponentCopyWith<$Res> {
  _$EnumParamComponentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SwaggerEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnumParamComponentImplCopyWith<$Res>
    implements $EnumParamComponentCopyWith<$Res> {
  factory _$$EnumParamComponentImplCopyWith(_$EnumParamComponentImpl value,
          $Res Function(_$EnumParamComponentImpl) then) =
      __$$EnumParamComponentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, SwaggerEnum type});
}

/// @nodoc
class __$$EnumParamComponentImplCopyWithImpl<$Res>
    extends _$EnumParamComponentCopyWithImpl<$Res, _$EnumParamComponentImpl>
    implements _$$EnumParamComponentImplCopyWith<$Res> {
  __$$EnumParamComponentImplCopyWithImpl(_$EnumParamComponentImpl _value,
      $Res Function(_$EnumParamComponentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_$EnumParamComponentImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SwaggerEnum,
    ));
  }
}

/// @nodoc

class _$EnumParamComponentImpl extends _EnumParamComponent {
  const _$EnumParamComponentImpl({required this.name, required this.type})
      : super._();

  @override
  final String name;
  @override
  final SwaggerEnum type;

  @override
  String toString() {
    return 'EnumParamComponent(name: $name, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnumParamComponentImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnumParamComponentImplCopyWith<_$EnumParamComponentImpl> get copyWith =>
      __$$EnumParamComponentImplCopyWithImpl<_$EnumParamComponentImpl>(
          this, _$identity);
}

abstract class _EnumParamComponent extends EnumParamComponent {
  const factory _EnumParamComponent(
      {required final String name,
      required final SwaggerEnum type}) = _$EnumParamComponentImpl;
  const _EnumParamComponent._() : super._();

  @override
  String get name;
  @override
  SwaggerEnum get type;
  @override
  @JsonKey(ignore: true)
  _$$EnumParamComponentImplCopyWith<_$EnumParamComponentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
