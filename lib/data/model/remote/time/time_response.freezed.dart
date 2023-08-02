// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeResponse _$TimeResponseFromJson(Map<String, dynamic> json) {
  return _TimeResponse.fromJson(json);
}

/// @nodoc
mixin _$TimeResponse {
  DateTime get currentDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeResponseCopyWith<TimeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeResponseCopyWith<$Res> {
  factory $TimeResponseCopyWith(
          TimeResponse value, $Res Function(TimeResponse) then) =
      _$TimeResponseCopyWithImpl<$Res, TimeResponse>;
  @useResult
  $Res call({DateTime currentDateTime});
}

/// @nodoc
class _$TimeResponseCopyWithImpl<$Res, $Val extends TimeResponse>
    implements $TimeResponseCopyWith<$Res> {
  _$TimeResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$_TimeResponseCopyWith<$Res>
    implements $TimeResponseCopyWith<$Res> {
  factory _$$_TimeResponseCopyWith(
          _$_TimeResponse value, $Res Function(_$_TimeResponse) then) =
      __$$_TimeResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime currentDateTime});
}

/// @nodoc
class __$$_TimeResponseCopyWithImpl<$Res>
    extends _$TimeResponseCopyWithImpl<$Res, _$_TimeResponse>
    implements _$$_TimeResponseCopyWith<$Res> {
  __$$_TimeResponseCopyWithImpl(
      _$_TimeResponse _value, $Res Function(_$_TimeResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentDateTime = null,
  }) {
    return _then(_$_TimeResponse(
      currentDateTime: null == currentDateTime
          ? _value.currentDateTime
          : currentDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeResponse implements _TimeResponse {
  const _$_TimeResponse({required this.currentDateTime});

  factory _$_TimeResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TimeResponseFromJson(json);

  @override
  final DateTime currentDateTime;

  @override
  String toString() {
    return 'TimeResponse(currentDateTime: $currentDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeResponse &&
            (identical(other.currentDateTime, currentDateTime) ||
                other.currentDateTime == currentDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currentDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimeResponseCopyWith<_$_TimeResponse> get copyWith =>
      __$$_TimeResponseCopyWithImpl<_$_TimeResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeResponseToJson(
      this,
    );
  }
}

abstract class _TimeResponse implements TimeResponse {
  const factory _TimeResponse({required final DateTime currentDateTime}) =
      _$_TimeResponse;

  factory _TimeResponse.fromJson(Map<String, dynamic> json) =
      _$_TimeResponse.fromJson;

  @override
  DateTime get currentDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_TimeResponseCopyWith<_$_TimeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
