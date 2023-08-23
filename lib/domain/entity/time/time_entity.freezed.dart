// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimeEntity {
  DateTime get currentDateTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimeEntityCopyWith<TimeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeEntityCopyWith<$Res> {
  factory $TimeEntityCopyWith(
          TimeEntity value, $Res Function(TimeEntity) then) =
      _$TimeEntityCopyWithImpl<$Res, TimeEntity>;
  @useResult
  $Res call({DateTime currentDateTime});
}

/// @nodoc
class _$TimeEntityCopyWithImpl<$Res, $Val extends TimeEntity>
    implements $TimeEntityCopyWith<$Res> {
  _$TimeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentDateTime = null,
  }) {
    return _then(_value.copyWith(
      currentDateTime: null == currentDateTime
          ? _value.currentDateTime
          : currentDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimeEntityCopyWith<$Res>
    implements $TimeEntityCopyWith<$Res> {
  factory _$$_TimeEntityCopyWith(
          _$_TimeEntity value, $Res Function(_$_TimeEntity) then) =
      __$$_TimeEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime currentDateTime});
}

/// @nodoc
class __$$_TimeEntityCopyWithImpl<$Res>
    extends _$TimeEntityCopyWithImpl<$Res, _$_TimeEntity>
    implements _$$_TimeEntityCopyWith<$Res> {
  __$$_TimeEntityCopyWithImpl(
      _$_TimeEntity _value, $Res Function(_$_TimeEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentDateTime = null,
  }) {
    return _then(_$_TimeEntity(
      currentDateTime: null == currentDateTime
          ? _value.currentDateTime
          : currentDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_TimeEntity implements _TimeEntity {
  const _$_TimeEntity({required this.currentDateTime});

  @override
  final DateTime currentDateTime;

  @override
  String toString() {
    return 'TimeEntity(currentDateTime: $currentDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeEntity &&
            (identical(other.currentDateTime, currentDateTime) ||
                other.currentDateTime == currentDateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimeEntityCopyWith<_$_TimeEntity> get copyWith =>
      __$$_TimeEntityCopyWithImpl<_$_TimeEntity>(this, _$identity);
}

abstract class _TimeEntity implements TimeEntity {
  const factory _TimeEntity({required final DateTime currentDateTime}) =
      _$_TimeEntity;

  @override
  DateTime get currentDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_TimeEntityCopyWith<_$_TimeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
