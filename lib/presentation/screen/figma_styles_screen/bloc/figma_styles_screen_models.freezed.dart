// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'figma_styles_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FigmaStylesScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String figmaId, String token) onGetStyles,
    required TResult Function() onClear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String figmaId, String token)? onGetStyles,
    TResult? Function()? onClear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String figmaId, String token)? onGetStyles,
    TResult Function()? onClear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FigmaStylesScreenEventInit value) init,
    required TResult Function(FigmaStylesScreenEventOnGetStyles value)
        onGetStyles,
    required TResult Function(FigmaStylesScreenEventOnClear value) onClear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FigmaStylesScreenEventInit value)? init,
    TResult? Function(FigmaStylesScreenEventOnGetStyles value)? onGetStyles,
    TResult? Function(FigmaStylesScreenEventOnClear value)? onClear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FigmaStylesScreenEventInit value)? init,
    TResult Function(FigmaStylesScreenEventOnGetStyles value)? onGetStyles,
    TResult Function(FigmaStylesScreenEventOnClear value)? onClear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FigmaStylesScreenEventCopyWith<$Res> {
  factory $FigmaStylesScreenEventCopyWith(FigmaStylesScreenEvent value,
          $Res Function(FigmaStylesScreenEvent) then) =
      _$FigmaStylesScreenEventCopyWithImpl<$Res, FigmaStylesScreenEvent>;
}

/// @nodoc
class _$FigmaStylesScreenEventCopyWithImpl<$Res,
        $Val extends FigmaStylesScreenEvent>
    implements $FigmaStylesScreenEventCopyWith<$Res> {
  _$FigmaStylesScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FigmaStylesScreenEventInitImplCopyWith<$Res> {
  factory _$$FigmaStylesScreenEventInitImplCopyWith(
          _$FigmaStylesScreenEventInitImpl value,
          $Res Function(_$FigmaStylesScreenEventInitImpl) then) =
      __$$FigmaStylesScreenEventInitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$FigmaStylesScreenEventInitImplCopyWithImpl<$Res>
    extends _$FigmaStylesScreenEventCopyWithImpl<$Res,
        _$FigmaStylesScreenEventInitImpl>
    implements _$$FigmaStylesScreenEventInitImplCopyWith<$Res> {
  __$$FigmaStylesScreenEventInitImplCopyWithImpl(
      _$FigmaStylesScreenEventInitImpl _value,
      $Res Function(_$FigmaStylesScreenEventInitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$FigmaStylesScreenEventInitImpl(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<$Res> get config {
    return $ConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc

class _$FigmaStylesScreenEventInitImpl implements FigmaStylesScreenEventInit {
  const _$FigmaStylesScreenEventInitImpl({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'FigmaStylesScreenEvent.init(config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FigmaStylesScreenEventInitImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FigmaStylesScreenEventInitImplCopyWith<_$FigmaStylesScreenEventInitImpl>
      get copyWith => __$$FigmaStylesScreenEventInitImplCopyWithImpl<
          _$FigmaStylesScreenEventInitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String figmaId, String token) onGetStyles,
    required TResult Function() onClear,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String figmaId, String token)? onGetStyles,
    TResult? Function()? onClear,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String figmaId, String token)? onGetStyles,
    TResult Function()? onClear,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FigmaStylesScreenEventInit value) init,
    required TResult Function(FigmaStylesScreenEventOnGetStyles value)
        onGetStyles,
    required TResult Function(FigmaStylesScreenEventOnClear value) onClear,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FigmaStylesScreenEventInit value)? init,
    TResult? Function(FigmaStylesScreenEventOnGetStyles value)? onGetStyles,
    TResult? Function(FigmaStylesScreenEventOnClear value)? onClear,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FigmaStylesScreenEventInit value)? init,
    TResult Function(FigmaStylesScreenEventOnGetStyles value)? onGetStyles,
    TResult Function(FigmaStylesScreenEventOnClear value)? onClear,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class FigmaStylesScreenEventInit implements FigmaStylesScreenEvent {
  const factory FigmaStylesScreenEventInit({required final Config config}) =
      _$FigmaStylesScreenEventInitImpl;

  Config get config;
  @JsonKey(ignore: true)
  _$$FigmaStylesScreenEventInitImplCopyWith<_$FigmaStylesScreenEventInitImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FigmaStylesScreenEventOnGetStylesImplCopyWith<$Res> {
  factory _$$FigmaStylesScreenEventOnGetStylesImplCopyWith(
          _$FigmaStylesScreenEventOnGetStylesImpl value,
          $Res Function(_$FigmaStylesScreenEventOnGetStylesImpl) then) =
      __$$FigmaStylesScreenEventOnGetStylesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String figmaId, String token});
}

/// @nodoc
class __$$FigmaStylesScreenEventOnGetStylesImplCopyWithImpl<$Res>
    extends _$FigmaStylesScreenEventCopyWithImpl<$Res,
        _$FigmaStylesScreenEventOnGetStylesImpl>
    implements _$$FigmaStylesScreenEventOnGetStylesImplCopyWith<$Res> {
  __$$FigmaStylesScreenEventOnGetStylesImplCopyWithImpl(
      _$FigmaStylesScreenEventOnGetStylesImpl _value,
      $Res Function(_$FigmaStylesScreenEventOnGetStylesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? figmaId = null,
    Object? token = null,
  }) {
    return _then(_$FigmaStylesScreenEventOnGetStylesImpl(
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

class _$FigmaStylesScreenEventOnGetStylesImpl
    implements FigmaStylesScreenEventOnGetStyles {
  const _$FigmaStylesScreenEventOnGetStylesImpl(
      {required this.figmaId, required this.token});

  @override
  final String figmaId;
  @override
  final String token;

  @override
  String toString() {
    return 'FigmaStylesScreenEvent.onGetStyles(figmaId: $figmaId, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FigmaStylesScreenEventOnGetStylesImpl &&
            (identical(other.figmaId, figmaId) || other.figmaId == figmaId) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, figmaId, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FigmaStylesScreenEventOnGetStylesImplCopyWith<
          _$FigmaStylesScreenEventOnGetStylesImpl>
      get copyWith => __$$FigmaStylesScreenEventOnGetStylesImplCopyWithImpl<
          _$FigmaStylesScreenEventOnGetStylesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String figmaId, String token) onGetStyles,
    required TResult Function() onClear,
  }) {
    return onGetStyles(figmaId, token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String figmaId, String token)? onGetStyles,
    TResult? Function()? onClear,
  }) {
    return onGetStyles?.call(figmaId, token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String figmaId, String token)? onGetStyles,
    TResult Function()? onClear,
    required TResult orElse(),
  }) {
    if (onGetStyles != null) {
      return onGetStyles(figmaId, token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FigmaStylesScreenEventInit value) init,
    required TResult Function(FigmaStylesScreenEventOnGetStyles value)
        onGetStyles,
    required TResult Function(FigmaStylesScreenEventOnClear value) onClear,
  }) {
    return onGetStyles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FigmaStylesScreenEventInit value)? init,
    TResult? Function(FigmaStylesScreenEventOnGetStyles value)? onGetStyles,
    TResult? Function(FigmaStylesScreenEventOnClear value)? onClear,
  }) {
    return onGetStyles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FigmaStylesScreenEventInit value)? init,
    TResult Function(FigmaStylesScreenEventOnGetStyles value)? onGetStyles,
    TResult Function(FigmaStylesScreenEventOnClear value)? onClear,
    required TResult orElse(),
  }) {
    if (onGetStyles != null) {
      return onGetStyles(this);
    }
    return orElse();
  }
}

abstract class FigmaStylesScreenEventOnGetStyles
    implements FigmaStylesScreenEvent {
  const factory FigmaStylesScreenEventOnGetStyles(
      {required final String figmaId,
      required final String token}) = _$FigmaStylesScreenEventOnGetStylesImpl;

  String get figmaId;
  String get token;
  @JsonKey(ignore: true)
  _$$FigmaStylesScreenEventOnGetStylesImplCopyWith<
          _$FigmaStylesScreenEventOnGetStylesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FigmaStylesScreenEventOnClearImplCopyWith<$Res> {
  factory _$$FigmaStylesScreenEventOnClearImplCopyWith(
          _$FigmaStylesScreenEventOnClearImpl value,
          $Res Function(_$FigmaStylesScreenEventOnClearImpl) then) =
      __$$FigmaStylesScreenEventOnClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FigmaStylesScreenEventOnClearImplCopyWithImpl<$Res>
    extends _$FigmaStylesScreenEventCopyWithImpl<$Res,
        _$FigmaStylesScreenEventOnClearImpl>
    implements _$$FigmaStylesScreenEventOnClearImplCopyWith<$Res> {
  __$$FigmaStylesScreenEventOnClearImplCopyWithImpl(
      _$FigmaStylesScreenEventOnClearImpl _value,
      $Res Function(_$FigmaStylesScreenEventOnClearImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FigmaStylesScreenEventOnClearImpl
    implements FigmaStylesScreenEventOnClear {
  const _$FigmaStylesScreenEventOnClearImpl();

  @override
  String toString() {
    return 'FigmaStylesScreenEvent.onClear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FigmaStylesScreenEventOnClearImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String figmaId, String token) onGetStyles,
    required TResult Function() onClear,
  }) {
    return onClear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String figmaId, String token)? onGetStyles,
    TResult? Function()? onClear,
  }) {
    return onClear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String figmaId, String token)? onGetStyles,
    TResult Function()? onClear,
    required TResult orElse(),
  }) {
    if (onClear != null) {
      return onClear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FigmaStylesScreenEventInit value) init,
    required TResult Function(FigmaStylesScreenEventOnGetStyles value)
        onGetStyles,
    required TResult Function(FigmaStylesScreenEventOnClear value) onClear,
  }) {
    return onClear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FigmaStylesScreenEventInit value)? init,
    TResult? Function(FigmaStylesScreenEventOnGetStyles value)? onGetStyles,
    TResult? Function(FigmaStylesScreenEventOnClear value)? onClear,
  }) {
    return onClear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FigmaStylesScreenEventInit value)? init,
    TResult Function(FigmaStylesScreenEventOnGetStyles value)? onGetStyles,
    TResult Function(FigmaStylesScreenEventOnClear value)? onClear,
    required TResult orElse(),
  }) {
    if (onClear != null) {
      return onClear(this);
    }
    return orElse();
  }
}

abstract class FigmaStylesScreenEventOnClear implements FigmaStylesScreenEvent {
  const factory FigmaStylesScreenEventOnClear() =
      _$FigmaStylesScreenEventOnClearImpl;
}

/// @nodoc
mixin _$FigmaStylesScreenSR {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FigmaStylesScreenSRCopyWith<$Res> {
  factory $FigmaStylesScreenSRCopyWith(
          FigmaStylesScreenSR value, $Res Function(FigmaStylesScreenSR) then) =
      _$FigmaStylesScreenSRCopyWithImpl<$Res, FigmaStylesScreenSR>;
}

/// @nodoc
class _$FigmaStylesScreenSRCopyWithImpl<$Res, $Val extends FigmaStylesScreenSR>
    implements $FigmaStylesScreenSRCopyWith<$Res> {
  _$FigmaStylesScreenSRCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadFinishedImplCopyWith<$Res> {
  factory _$$LoadFinishedImplCopyWith(
          _$LoadFinishedImpl value, $Res Function(_$LoadFinishedImpl) then) =
      __$$LoadFinishedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFinishedImplCopyWithImpl<$Res>
    extends _$FigmaStylesScreenSRCopyWithImpl<$Res, _$LoadFinishedImpl>
    implements _$$LoadFinishedImplCopyWith<$Res> {
  __$$LoadFinishedImplCopyWithImpl(
      _$LoadFinishedImpl _value, $Res Function(_$LoadFinishedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadFinishedImpl implements _LoadFinished {
  const _$LoadFinishedImpl();

  @override
  String toString() {
    return 'FigmaStylesScreenSR.loadFinished()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadFinishedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function(String error) error,
  }) {
    return loadFinished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function(String error)? error,
  }) {
    return loadFinished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loadFinished != null) {
      return loadFinished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_Error value) error,
  }) {
    return loadFinished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_Error value)? error,
  }) {
    return loadFinished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loadFinished != null) {
      return loadFinished(this);
    }
    return orElse();
  }
}

abstract class _LoadFinished implements FigmaStylesScreenSR {
  const factory _LoadFinished() = _$LoadFinishedImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$FigmaStylesScreenSRCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'FigmaStylesScreenSR.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements FigmaStylesScreenSR {
  const factory _Error({required final String error}) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FigmaStylesScreenState {
  Config get config => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FigmaStylesScreenStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FigmaStylesScreenStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FigmaStylesScreenStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FigmaStylesScreenStateCopyWith<FigmaStylesScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FigmaStylesScreenStateCopyWith<$Res> {
  factory $FigmaStylesScreenStateCopyWith(FigmaStylesScreenState value,
          $Res Function(FigmaStylesScreenState) then) =
      _$FigmaStylesScreenStateCopyWithImpl<$Res, FigmaStylesScreenState>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$FigmaStylesScreenStateCopyWithImpl<$Res,
        $Val extends FigmaStylesScreenState>
    implements $FigmaStylesScreenStateCopyWith<$Res> {
  _$FigmaStylesScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_value.copyWith(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<$Res> get config {
    return $ConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FigmaStylesScreenStateDataImplCopyWith<$Res>
    implements $FigmaStylesScreenStateCopyWith<$Res> {
  factory _$$FigmaStylesScreenStateDataImplCopyWith(
          _$FigmaStylesScreenStateDataImpl value,
          $Res Function(_$FigmaStylesScreenStateDataImpl) then) =
      __$$FigmaStylesScreenStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$FigmaStylesScreenStateDataImplCopyWithImpl<$Res>
    extends _$FigmaStylesScreenStateCopyWithImpl<$Res,
        _$FigmaStylesScreenStateDataImpl>
    implements _$$FigmaStylesScreenStateDataImplCopyWith<$Res> {
  __$$FigmaStylesScreenStateDataImplCopyWithImpl(
      _$FigmaStylesScreenStateDataImpl _value,
      $Res Function(_$FigmaStylesScreenStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$FigmaStylesScreenStateDataImpl(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ));
  }
}

/// @nodoc

class _$FigmaStylesScreenStateDataImpl implements FigmaStylesScreenStateData {
  const _$FigmaStylesScreenStateDataImpl({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'FigmaStylesScreenState.data(config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FigmaStylesScreenStateDataImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FigmaStylesScreenStateDataImplCopyWith<_$FigmaStylesScreenStateDataImpl>
      get copyWith => __$$FigmaStylesScreenStateDataImplCopyWithImpl<
          _$FigmaStylesScreenStateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) data,
  }) {
    return data(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? data,
  }) {
    return data?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FigmaStylesScreenStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FigmaStylesScreenStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FigmaStylesScreenStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class FigmaStylesScreenStateData implements FigmaStylesScreenState {
  const factory FigmaStylesScreenStateData({required final Config config}) =
      _$FigmaStylesScreenStateDataImpl;

  @override
  Config get config;
  @override
  @JsonKey(ignore: true)
  _$$FigmaStylesScreenStateDataImplCopyWith<_$FigmaStylesScreenStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
