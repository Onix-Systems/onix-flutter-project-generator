// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'output_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OutputLine {
  String get line => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  OutputType get tag => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OutputLineCopyWith<OutputLine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutputLineCopyWith<$Res> {
  factory $OutputLineCopyWith(
          OutputLine value, $Res Function(OutputLine) then) =
      _$OutputLineCopyWithImpl<$Res, OutputLine>;
  @useResult
  $Res call({String line, Color color, OutputType tag});
}

/// @nodoc
class _$OutputLineCopyWithImpl<$Res, $Val extends OutputLine>
    implements $OutputLineCopyWith<$Res> {
  _$OutputLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line = null,
    Object? color = null,
    Object? tag = null,
  }) {
    return _then(_value.copyWith(
      line: null == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as OutputType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutputLineImplCopyWith<$Res>
    implements $OutputLineCopyWith<$Res> {
  factory _$$OutputLineImplCopyWith(
          _$OutputLineImpl value, $Res Function(_$OutputLineImpl) then) =
      __$$OutputLineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String line, Color color, OutputType tag});
}

/// @nodoc
class __$$OutputLineImplCopyWithImpl<$Res>
    extends _$OutputLineCopyWithImpl<$Res, _$OutputLineImpl>
    implements _$$OutputLineImplCopyWith<$Res> {
  __$$OutputLineImplCopyWithImpl(
      _$OutputLineImpl _value, $Res Function(_$OutputLineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line = null,
    Object? color = null,
    Object? tag = null,
  }) {
    return _then(_$OutputLineImpl(
      line: null == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as OutputType,
    ));
  }
}

/// @nodoc

class _$OutputLineImpl implements _OutputLine {
  const _$OutputLineImpl(
      {required this.line, required this.color, required this.tag});

  @override
  final String line;
  @override
  final Color color;
  @override
  final OutputType tag;

  @override
  String toString() {
    return 'OutputLine(line: $line, color: $color, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutputLineImpl &&
            (identical(other.line, line) || other.line == line) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, line, color, tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OutputLineImplCopyWith<_$OutputLineImpl> get copyWith =>
      __$$OutputLineImplCopyWithImpl<_$OutputLineImpl>(this, _$identity);
}

abstract class _OutputLine implements OutputLine {
  const factory _OutputLine(
      {required final String line,
      required final Color color,
      required final OutputType tag}) = _$OutputLineImpl;

  @override
  String get line;
  @override
  Color get color;
  @override
  OutputType get tag;
  @override
  @JsonKey(ignore: true)
  _$$OutputLineImplCopyWith<_$OutputLineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
