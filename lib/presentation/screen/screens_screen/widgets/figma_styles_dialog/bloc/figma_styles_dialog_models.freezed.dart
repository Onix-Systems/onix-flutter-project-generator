// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'figma_styles_dialog_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FigmaStylesDialogEvent {
  String get figmaId => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String figmaId, String token) getStyles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String figmaId, String token)? getStyles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String figmaId, String token)? getStyles,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FigmaStylesEventInit value) getStyles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FigmaStylesEventInit value)? getStyles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FigmaStylesEventInit value)? getStyles,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FigmaStylesDialogEventCopyWith<FigmaStylesDialogEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FigmaStylesDialogEventCopyWith<$Res> {
  factory $FigmaStylesDialogEventCopyWith(FigmaStylesDialogEvent value,
          $Res Function(FigmaStylesDialogEvent) then) =
      _$FigmaStylesDialogEventCopyWithImpl<$Res, FigmaStylesDialogEvent>;
  @useResult
  $Res call({String figmaId, String token});
}

/// @nodoc
class _$FigmaStylesDialogEventCopyWithImpl<$Res,
        $Val extends FigmaStylesDialogEvent>
    implements $FigmaStylesDialogEventCopyWith<$Res> {
  _$FigmaStylesDialogEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? figmaId = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      figmaId: null == figmaId
          ? _value.figmaId
          : figmaId // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FigmaStylesEventInitImplCopyWith<$Res>
    implements $FigmaStylesDialogEventCopyWith<$Res> {
  factory _$$FigmaStylesEventInitImplCopyWith(_$FigmaStylesEventInitImpl value,
          $Res Function(_$FigmaStylesEventInitImpl) then) =
      __$$FigmaStylesEventInitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String figmaId, String token});
}

/// @nodoc
class __$$FigmaStylesEventInitImplCopyWithImpl<$Res>
    extends _$FigmaStylesDialogEventCopyWithImpl<$Res,
        _$FigmaStylesEventInitImpl>
    implements _$$FigmaStylesEventInitImplCopyWith<$Res> {
  __$$FigmaStylesEventInitImplCopyWithImpl(_$FigmaStylesEventInitImpl _value,
      $Res Function(_$FigmaStylesEventInitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? figmaId = null,
    Object? token = null,
  }) {
    return _then(_$FigmaStylesEventInitImpl(
      figmaId: null == figmaId
          ? _value.figmaId
          : figmaId // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FigmaStylesEventInitImpl implements FigmaStylesEventInit {
  const _$FigmaStylesEventInitImpl(
      {required this.figmaId, required this.token});

  @override
  final String figmaId;
  @override
  final String token;

  @override
  String toString() {
    return 'FigmaStylesDialogEvent.getStyles(figmaId: $figmaId, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FigmaStylesEventInitImpl &&
            (identical(other.figmaId, figmaId) || other.figmaId == figmaId) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, figmaId, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FigmaStylesEventInitImplCopyWith<_$FigmaStylesEventInitImpl>
      get copyWith =>
          __$$FigmaStylesEventInitImplCopyWithImpl<_$FigmaStylesEventInitImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String figmaId, String token) getStyles,
  }) {
    return getStyles(figmaId, token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String figmaId, String token)? getStyles,
  }) {
    return getStyles?.call(figmaId, token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String figmaId, String token)? getStyles,
    required TResult orElse(),
  }) {
    if (getStyles != null) {
      return getStyles(figmaId, token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FigmaStylesEventInit value) getStyles,
  }) {
    return getStyles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FigmaStylesEventInit value)? getStyles,
  }) {
    return getStyles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FigmaStylesEventInit value)? getStyles,
    required TResult orElse(),
  }) {
    if (getStyles != null) {
      return getStyles(this);
    }
    return orElse();
  }
}

abstract class FigmaStylesEventInit implements FigmaStylesDialogEvent {
  const factory FigmaStylesEventInit(
      {required final String figmaId,
      required final String token}) = _$FigmaStylesEventInitImpl;

  @override
  String get figmaId;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$FigmaStylesEventInitImplCopyWith<_$FigmaStylesEventInitImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FigmaStylesDialogSR {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() stub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? stub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? stub,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FigmaStylesStubSR value) stub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FigmaStylesStubSR value)? stub,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FigmaStylesStubSR value)? stub,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FigmaStylesDialogSRCopyWith<$Res> {
  factory $FigmaStylesDialogSRCopyWith(
          FigmaStylesDialogSR value, $Res Function(FigmaStylesDialogSR) then) =
      _$FigmaStylesDialogSRCopyWithImpl<$Res, FigmaStylesDialogSR>;
}

/// @nodoc
class _$FigmaStylesDialogSRCopyWithImpl<$Res, $Val extends FigmaStylesDialogSR>
    implements $FigmaStylesDialogSRCopyWith<$Res> {
  _$FigmaStylesDialogSRCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FigmaStylesStubSRImplCopyWith<$Res> {
  factory _$$FigmaStylesStubSRImplCopyWith(_$FigmaStylesStubSRImpl value,
          $Res Function(_$FigmaStylesStubSRImpl) then) =
      __$$FigmaStylesStubSRImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FigmaStylesStubSRImplCopyWithImpl<$Res>
    extends _$FigmaStylesDialogSRCopyWithImpl<$Res, _$FigmaStylesStubSRImpl>
    implements _$$FigmaStylesStubSRImplCopyWith<$Res> {
  __$$FigmaStylesStubSRImplCopyWithImpl(_$FigmaStylesStubSRImpl _value,
      $Res Function(_$FigmaStylesStubSRImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FigmaStylesStubSRImpl implements FigmaStylesStubSR {
  const _$FigmaStylesStubSRImpl();

  @override
  String toString() {
    return 'FigmaStylesDialogSR.stub()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FigmaStylesStubSRImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() stub,
  }) {
    return stub();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? stub,
  }) {
    return stub?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? stub,
    required TResult orElse(),
  }) {
    if (stub != null) {
      return stub();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FigmaStylesStubSR value) stub,
  }) {
    return stub(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FigmaStylesStubSR value)? stub,
  }) {
    return stub?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FigmaStylesStubSR value)? stub,
    required TResult orElse(),
  }) {
    if (stub != null) {
      return stub(this);
    }
    return orElse();
  }
}

abstract class FigmaStylesStubSR implements FigmaStylesDialogSR {
  const factory FigmaStylesStubSR() = _$FigmaStylesStubSRImpl;
}

/// @nodoc
mixin _$FigmaStylesDialogState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function(List<AppColorStyle> colorStyles,
            List<AppTextStyle> textStyles, bool isLoading)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function(List<AppColorStyle> colorStyles,
            List<AppTextStyle> textStyles, bool isLoading)?
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function(List<AppColorStyle> colorStyles,
            List<AppTextStyle> textStyles, bool isLoading)?
        data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FigmaStylesDialogStateError value) error,
    required TResult Function(FigmaStylesDialogStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FigmaStylesDialogStateError value)? error,
    TResult? Function(FigmaStylesDialogStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FigmaStylesDialogStateError value)? error,
    TResult Function(FigmaStylesDialogStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FigmaStylesDialogStateCopyWith<$Res> {
  factory $FigmaStylesDialogStateCopyWith(FigmaStylesDialogState value,
          $Res Function(FigmaStylesDialogState) then) =
      _$FigmaStylesDialogStateCopyWithImpl<$Res, FigmaStylesDialogState>;
}

/// @nodoc
class _$FigmaStylesDialogStateCopyWithImpl<$Res,
        $Val extends FigmaStylesDialogState>
    implements $FigmaStylesDialogStateCopyWith<$Res> {
  _$FigmaStylesDialogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FigmaStylesDialogStateErrorImplCopyWith<$Res> {
  factory _$$FigmaStylesDialogStateErrorImplCopyWith(
          _$FigmaStylesDialogStateErrorImpl value,
          $Res Function(_$FigmaStylesDialogStateErrorImpl) then) =
      __$$FigmaStylesDialogStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FigmaStylesDialogStateErrorImplCopyWithImpl<$Res>
    extends _$FigmaStylesDialogStateCopyWithImpl<$Res,
        _$FigmaStylesDialogStateErrorImpl>
    implements _$$FigmaStylesDialogStateErrorImplCopyWith<$Res> {
  __$$FigmaStylesDialogStateErrorImplCopyWithImpl(
      _$FigmaStylesDialogStateErrorImpl _value,
      $Res Function(_$FigmaStylesDialogStateErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FigmaStylesDialogStateErrorImpl implements FigmaStylesDialogStateError {
  const _$FigmaStylesDialogStateErrorImpl();

  @override
  String toString() {
    return 'FigmaStylesDialogState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FigmaStylesDialogStateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function(List<AppColorStyle> colorStyles,
            List<AppTextStyle> textStyles, bool isLoading)
        data,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function(List<AppColorStyle> colorStyles,
            List<AppTextStyle> textStyles, bool isLoading)?
        data,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function(List<AppColorStyle> colorStyles,
            List<AppTextStyle> textStyles, bool isLoading)?
        data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FigmaStylesDialogStateError value) error,
    required TResult Function(FigmaStylesDialogStateData value) data,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FigmaStylesDialogStateError value)? error,
    TResult? Function(FigmaStylesDialogStateData value)? data,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FigmaStylesDialogStateError value)? error,
    TResult Function(FigmaStylesDialogStateData value)? data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FigmaStylesDialogStateError implements FigmaStylesDialogState {
  const factory FigmaStylesDialogStateError() =
      _$FigmaStylesDialogStateErrorImpl;
}

/// @nodoc
abstract class _$$FigmaStylesDialogStateDataImplCopyWith<$Res> {
  factory _$$FigmaStylesDialogStateDataImplCopyWith(
          _$FigmaStylesDialogStateDataImpl value,
          $Res Function(_$FigmaStylesDialogStateDataImpl) then) =
      __$$FigmaStylesDialogStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<AppColorStyle> colorStyles,
      List<AppTextStyle> textStyles,
      bool isLoading});
}

/// @nodoc
class __$$FigmaStylesDialogStateDataImplCopyWithImpl<$Res>
    extends _$FigmaStylesDialogStateCopyWithImpl<$Res,
        _$FigmaStylesDialogStateDataImpl>
    implements _$$FigmaStylesDialogStateDataImplCopyWith<$Res> {
  __$$FigmaStylesDialogStateDataImplCopyWithImpl(
      _$FigmaStylesDialogStateDataImpl _value,
      $Res Function(_$FigmaStylesDialogStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorStyles = null,
    Object? textStyles = null,
    Object? isLoading = null,
  }) {
    return _then(_$FigmaStylesDialogStateDataImpl(
      colorStyles: null == colorStyles
          ? _value._colorStyles
          : colorStyles // ignore: cast_nullable_to_non_nullable
              as List<AppColorStyle>,
      textStyles: null == textStyles
          ? _value._textStyles
          : textStyles // ignore: cast_nullable_to_non_nullable
              as List<AppTextStyle>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FigmaStylesDialogStateDataImpl implements FigmaStylesDialogStateData {
  const _$FigmaStylesDialogStateDataImpl(
      {final List<AppColorStyle> colorStyles = const [],
      final List<AppTextStyle> textStyles = const [],
      this.isLoading = false})
      : _colorStyles = colorStyles,
        _textStyles = textStyles;

  final List<AppColorStyle> _colorStyles;
  @override
  @JsonKey()
  List<AppColorStyle> get colorStyles {
    if (_colorStyles is EqualUnmodifiableListView) return _colorStyles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colorStyles);
  }

  final List<AppTextStyle> _textStyles;
  @override
  @JsonKey()
  List<AppTextStyle> get textStyles {
    if (_textStyles is EqualUnmodifiableListView) return _textStyles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_textStyles);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'FigmaStylesDialogState.data(colorStyles: $colorStyles, textStyles: $textStyles, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FigmaStylesDialogStateDataImpl &&
            const DeepCollectionEquality()
                .equals(other._colorStyles, _colorStyles) &&
            const DeepCollectionEquality()
                .equals(other._textStyles, _textStyles) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_colorStyles),
      const DeepCollectionEquality().hash(_textStyles),
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FigmaStylesDialogStateDataImplCopyWith<_$FigmaStylesDialogStateDataImpl>
      get copyWith => __$$FigmaStylesDialogStateDataImplCopyWithImpl<
          _$FigmaStylesDialogStateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function(List<AppColorStyle> colorStyles,
            List<AppTextStyle> textStyles, bool isLoading)
        data,
  }) {
    return data(colorStyles, textStyles, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function(List<AppColorStyle> colorStyles,
            List<AppTextStyle> textStyles, bool isLoading)?
        data,
  }) {
    return data?.call(colorStyles, textStyles, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function(List<AppColorStyle> colorStyles,
            List<AppTextStyle> textStyles, bool isLoading)?
        data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(colorStyles, textStyles, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FigmaStylesDialogStateError value) error,
    required TResult Function(FigmaStylesDialogStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FigmaStylesDialogStateError value)? error,
    TResult? Function(FigmaStylesDialogStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FigmaStylesDialogStateError value)? error,
    TResult Function(FigmaStylesDialogStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class FigmaStylesDialogStateData implements FigmaStylesDialogState {
  const factory FigmaStylesDialogStateData(
      {final List<AppColorStyle> colorStyles,
      final List<AppTextStyle> textStyles,
      final bool isLoading}) = _$FigmaStylesDialogStateDataImpl;

  List<AppColorStyle> get colorStyles;
  List<AppTextStyle> get textStyles;
  bool get isLoading;
  @JsonKey(ignore: true)
  _$$FigmaStylesDialogStateDataImplCopyWith<_$FigmaStylesDialogStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
