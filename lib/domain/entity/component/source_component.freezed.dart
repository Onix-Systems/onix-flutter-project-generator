// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SourceComponent {
  String get name => throw _privateConstructorUsedError;
  List<RequestComponent> get requests => throw _privateConstructorUsedError;
  Arch get arch => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SourceComponentCopyWith<SourceComponent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceComponentCopyWith<$Res> {
  factory $SourceComponentCopyWith(
          SourceComponent value, $Res Function(SourceComponent) then) =
      _$SourceComponentCopyWithImpl<$Res, SourceComponent>;
  @useResult
  $Res call({String name, List<RequestComponent> requests, Arch arch});
}

/// @nodoc
class _$SourceComponentCopyWithImpl<$Res, $Val extends SourceComponent>
    implements $SourceComponentCopyWith<$Res> {
  _$SourceComponentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? requests = null,
    Object? arch = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      requests: null == requests
          ? _value.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<RequestComponent>,
      arch: null == arch
          ? _value.arch
          : arch // ignore: cast_nullable_to_non_nullable
              as Arch,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourceComponentImplCopyWith<$Res>
    implements $SourceComponentCopyWith<$Res> {
  factory _$$SourceComponentImplCopyWith(_$SourceComponentImpl value,
          $Res Function(_$SourceComponentImpl) then) =
      __$$SourceComponentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<RequestComponent> requests, Arch arch});
}

/// @nodoc
class __$$SourceComponentImplCopyWithImpl<$Res>
    extends _$SourceComponentCopyWithImpl<$Res, _$SourceComponentImpl>
    implements _$$SourceComponentImplCopyWith<$Res> {
  __$$SourceComponentImplCopyWithImpl(
      _$SourceComponentImpl _value, $Res Function(_$SourceComponentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? requests = null,
    Object? arch = null,
  }) {
    return _then(_$SourceComponentImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      requests: null == requests
          ? _value._requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<RequestComponent>,
      arch: null == arch
          ? _value.arch
          : arch // ignore: cast_nullable_to_non_nullable
              as Arch,
    ));
  }
}

/// @nodoc

class _$SourceComponentImpl extends _SourceComponent {
  const _$SourceComponentImpl(
      {required this.name,
      required final List<RequestComponent> requests,
      required this.arch})
      : _requests = requests,
        super._();

  @override
  final String name;
  final List<RequestComponent> _requests;
  @override
  List<RequestComponent> get requests {
    if (_requests is EqualUnmodifiableListView) return _requests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requests);
  }

  @override
  final Arch arch;

  @override
  String toString() {
    return 'SourceComponent(name: $name, requests: $requests, arch: $arch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceComponentImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._requests, _requests) &&
            (identical(other.arch, arch) || other.arch == arch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_requests), arch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceComponentImplCopyWith<_$SourceComponentImpl> get copyWith =>
      __$$SourceComponentImplCopyWithImpl<_$SourceComponentImpl>(
          this, _$identity);
}

abstract class _SourceComponent extends SourceComponent {
  const factory _SourceComponent(
      {required final String name,
      required final List<RequestComponent> requests,
      required final Arch arch}) = _$SourceComponentImpl;
  const _SourceComponent._() : super._();

  @override
  String get name;
  @override
  List<RequestComponent> get requests;
  @override
  Arch get arch;
  @override
  @JsonKey(ignore: true)
  _$$SourceComponentImplCopyWith<_$SourceComponentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
