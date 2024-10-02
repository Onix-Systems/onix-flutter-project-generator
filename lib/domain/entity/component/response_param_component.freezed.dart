// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_param_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResponseParamComponent {
  String get name => throw _privateConstructorUsedError;
  SwaggerType get type => throw _privateConstructorUsedError;
  bool get isRequired => throw _privateConstructorUsedError;

  /// Create a copy of ResponseParamComponent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseParamComponentCopyWith<ResponseParamComponent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseParamComponentCopyWith<$Res> {
  factory $ResponseParamComponentCopyWith(ResponseParamComponent value,
          $Res Function(ResponseParamComponent) then) =
      _$ResponseParamComponentCopyWithImpl<$Res, ResponseParamComponent>;
  @useResult
  $Res call({String name, SwaggerType type, bool isRequired});
}

/// @nodoc
class _$ResponseParamComponentCopyWithImpl<$Res,
        $Val extends ResponseParamComponent>
    implements $ResponseParamComponentCopyWith<$Res> {
  _$ResponseParamComponentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseParamComponent
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$ResponseParamComponentImplCopyWith<$Res>
    implements $ResponseParamComponentCopyWith<$Res> {
  factory _$$ResponseParamComponentImplCopyWith(
          _$ResponseParamComponentImpl value,
          $Res Function(_$ResponseParamComponentImpl) then) =
      __$$ResponseParamComponentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, SwaggerType type, bool isRequired});
}

/// @nodoc
class __$$ResponseParamComponentImplCopyWithImpl<$Res>
    extends _$ResponseParamComponentCopyWithImpl<$Res,
        _$ResponseParamComponentImpl>
    implements _$$ResponseParamComponentImplCopyWith<$Res> {
  __$$ResponseParamComponentImplCopyWithImpl(
      _$ResponseParamComponentImpl _value,
      $Res Function(_$ResponseParamComponentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseParamComponent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
  }) {
    return _then(_$ResponseParamComponentImpl(
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

class _$ResponseParamComponentImpl extends _ResponseParamComponent {
  const _$ResponseParamComponentImpl(
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
    return 'ResponseParamComponent(name: $name, type: $type, isRequired: $isRequired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseParamComponentImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, type, isRequired);

  /// Create a copy of ResponseParamComponent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseParamComponentImplCopyWith<_$ResponseParamComponentImpl>
      get copyWith => __$$ResponseParamComponentImplCopyWithImpl<
          _$ResponseParamComponentImpl>(this, _$identity);
}

abstract class _ResponseParamComponent extends ResponseParamComponent {
  const factory _ResponseParamComponent(
      {required final String name,
      required final SwaggerType type,
      required final bool isRequired}) = _$ResponseParamComponentImpl;
  const _ResponseParamComponent._() : super._();

  @override
  String get name;
  @override
  SwaggerType get type;
  @override
  bool get isRequired;

  /// Create a copy of ResponseParamComponent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseParamComponentImplCopyWith<_$ResponseParamComponentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
