// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'swagger_parser_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SwaggerParserScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() onReplace,
    required TResult Function() onIgnore,
    required TResult Function(String url) parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? onReplace,
    TResult? Function()? onIgnore,
    TResult? Function(String url)? parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? onReplace,
    TResult Function()? onIgnore,
    TResult Function(String url)? parse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwaggerParserScreenEventInit value) init,
    required TResult Function(SwaggerParserScreenEventOnReplace value)
        onReplace,
    required TResult Function(SwaggerParserScreenEventOnIgnore value) onIgnore,
    required TResult Function(SwaggerParserScreenEventParse value) parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenEventInit value)? init,
    TResult? Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult? Function(SwaggerParserScreenEventOnIgnore value)? onIgnore,
    TResult? Function(SwaggerParserScreenEventParse value)? parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenEventInit value)? init,
    TResult Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult Function(SwaggerParserScreenEventOnIgnore value)? onIgnore,
    TResult Function(SwaggerParserScreenEventParse value)? parse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwaggerParserScreenEventCopyWith<$Res> {
  factory $SwaggerParserScreenEventCopyWith(SwaggerParserScreenEvent value,
          $Res Function(SwaggerParserScreenEvent) then) =
      _$SwaggerParserScreenEventCopyWithImpl<$Res, SwaggerParserScreenEvent>;
}

/// @nodoc
class _$SwaggerParserScreenEventCopyWithImpl<$Res,
        $Val extends SwaggerParserScreenEvent>
    implements $SwaggerParserScreenEventCopyWith<$Res> {
  _$SwaggerParserScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SwaggerParserScreenEventInitImplCopyWith<$Res> {
  factory _$$SwaggerParserScreenEventInitImplCopyWith(
          _$SwaggerParserScreenEventInitImpl value,
          $Res Function(_$SwaggerParserScreenEventInitImpl) then) =
      __$$SwaggerParserScreenEventInitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$SwaggerParserScreenEventInitImplCopyWithImpl<$Res>
    extends _$SwaggerParserScreenEventCopyWithImpl<$Res,
        _$SwaggerParserScreenEventInitImpl>
    implements _$$SwaggerParserScreenEventInitImplCopyWith<$Res> {
  __$$SwaggerParserScreenEventInitImplCopyWithImpl(
      _$SwaggerParserScreenEventInitImpl _value,
      $Res Function(_$SwaggerParserScreenEventInitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$SwaggerParserScreenEventInitImpl(
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

class _$SwaggerParserScreenEventInitImpl
    implements SwaggerParserScreenEventInit {
  const _$SwaggerParserScreenEventInitImpl({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'SwaggerParserScreenEvent.init(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwaggerParserScreenEventInitImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwaggerParserScreenEventInitImplCopyWith<
          _$SwaggerParserScreenEventInitImpl>
      get copyWith => __$$SwaggerParserScreenEventInitImplCopyWithImpl<
          _$SwaggerParserScreenEventInitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() onReplace,
    required TResult Function() onIgnore,
    required TResult Function(String url) parse,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? onReplace,
    TResult? Function()? onIgnore,
    TResult? Function(String url)? parse,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? onReplace,
    TResult Function()? onIgnore,
    TResult Function(String url)? parse,
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
    required TResult Function(SwaggerParserScreenEventInit value) init,
    required TResult Function(SwaggerParserScreenEventOnReplace value)
        onReplace,
    required TResult Function(SwaggerParserScreenEventOnIgnore value) onIgnore,
    required TResult Function(SwaggerParserScreenEventParse value) parse,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenEventInit value)? init,
    TResult? Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult? Function(SwaggerParserScreenEventOnIgnore value)? onIgnore,
    TResult? Function(SwaggerParserScreenEventParse value)? parse,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenEventInit value)? init,
    TResult Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult Function(SwaggerParserScreenEventOnIgnore value)? onIgnore,
    TResult Function(SwaggerParserScreenEventParse value)? parse,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class SwaggerParserScreenEventInit
    implements SwaggerParserScreenEvent {
  const factory SwaggerParserScreenEventInit({required final Config config}) =
      _$SwaggerParserScreenEventInitImpl;

  Config get config;
  @JsonKey(ignore: true)
  _$$SwaggerParserScreenEventInitImplCopyWith<
          _$SwaggerParserScreenEventInitImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SwaggerParserScreenEventOnReplaceImplCopyWith<$Res> {
  factory _$$SwaggerParserScreenEventOnReplaceImplCopyWith(
          _$SwaggerParserScreenEventOnReplaceImpl value,
          $Res Function(_$SwaggerParserScreenEventOnReplaceImpl) then) =
      __$$SwaggerParserScreenEventOnReplaceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwaggerParserScreenEventOnReplaceImplCopyWithImpl<$Res>
    extends _$SwaggerParserScreenEventCopyWithImpl<$Res,
        _$SwaggerParserScreenEventOnReplaceImpl>
    implements _$$SwaggerParserScreenEventOnReplaceImplCopyWith<$Res> {
  __$$SwaggerParserScreenEventOnReplaceImplCopyWithImpl(
      _$SwaggerParserScreenEventOnReplaceImpl _value,
      $Res Function(_$SwaggerParserScreenEventOnReplaceImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwaggerParserScreenEventOnReplaceImpl
    implements SwaggerParserScreenEventOnReplace {
  const _$SwaggerParserScreenEventOnReplaceImpl();

  @override
  String toString() {
    return 'SwaggerParserScreenEvent.onReplace()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwaggerParserScreenEventOnReplaceImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() onReplace,
    required TResult Function() onIgnore,
    required TResult Function(String url) parse,
  }) {
    return onReplace();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? onReplace,
    TResult? Function()? onIgnore,
    TResult? Function(String url)? parse,
  }) {
    return onReplace?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? onReplace,
    TResult Function()? onIgnore,
    TResult Function(String url)? parse,
    required TResult orElse(),
  }) {
    if (onReplace != null) {
      return onReplace();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwaggerParserScreenEventInit value) init,
    required TResult Function(SwaggerParserScreenEventOnReplace value)
        onReplace,
    required TResult Function(SwaggerParserScreenEventOnIgnore value) onIgnore,
    required TResult Function(SwaggerParserScreenEventParse value) parse,
  }) {
    return onReplace(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenEventInit value)? init,
    TResult? Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult? Function(SwaggerParserScreenEventOnIgnore value)? onIgnore,
    TResult? Function(SwaggerParserScreenEventParse value)? parse,
  }) {
    return onReplace?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenEventInit value)? init,
    TResult Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult Function(SwaggerParserScreenEventOnIgnore value)? onIgnore,
    TResult Function(SwaggerParserScreenEventParse value)? parse,
    required TResult orElse(),
  }) {
    if (onReplace != null) {
      return onReplace(this);
    }
    return orElse();
  }
}

abstract class SwaggerParserScreenEventOnReplace
    implements SwaggerParserScreenEvent {
  const factory SwaggerParserScreenEventOnReplace() =
      _$SwaggerParserScreenEventOnReplaceImpl;
}

/// @nodoc
abstract class _$$SwaggerParserScreenEventOnIgnoreImplCopyWith<$Res> {
  factory _$$SwaggerParserScreenEventOnIgnoreImplCopyWith(
          _$SwaggerParserScreenEventOnIgnoreImpl value,
          $Res Function(_$SwaggerParserScreenEventOnIgnoreImpl) then) =
      __$$SwaggerParserScreenEventOnIgnoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwaggerParserScreenEventOnIgnoreImplCopyWithImpl<$Res>
    extends _$SwaggerParserScreenEventCopyWithImpl<$Res,
        _$SwaggerParserScreenEventOnIgnoreImpl>
    implements _$$SwaggerParserScreenEventOnIgnoreImplCopyWith<$Res> {
  __$$SwaggerParserScreenEventOnIgnoreImplCopyWithImpl(
      _$SwaggerParserScreenEventOnIgnoreImpl _value,
      $Res Function(_$SwaggerParserScreenEventOnIgnoreImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwaggerParserScreenEventOnIgnoreImpl
    implements SwaggerParserScreenEventOnIgnore {
  const _$SwaggerParserScreenEventOnIgnoreImpl();

  @override
  String toString() {
    return 'SwaggerParserScreenEvent.onIgnore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwaggerParserScreenEventOnIgnoreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() onReplace,
    required TResult Function() onIgnore,
    required TResult Function(String url) parse,
  }) {
    return onIgnore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? onReplace,
    TResult? Function()? onIgnore,
    TResult? Function(String url)? parse,
  }) {
    return onIgnore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? onReplace,
    TResult Function()? onIgnore,
    TResult Function(String url)? parse,
    required TResult orElse(),
  }) {
    if (onIgnore != null) {
      return onIgnore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwaggerParserScreenEventInit value) init,
    required TResult Function(SwaggerParserScreenEventOnReplace value)
        onReplace,
    required TResult Function(SwaggerParserScreenEventOnIgnore value) onIgnore,
    required TResult Function(SwaggerParserScreenEventParse value) parse,
  }) {
    return onIgnore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenEventInit value)? init,
    TResult? Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult? Function(SwaggerParserScreenEventOnIgnore value)? onIgnore,
    TResult? Function(SwaggerParserScreenEventParse value)? parse,
  }) {
    return onIgnore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenEventInit value)? init,
    TResult Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult Function(SwaggerParserScreenEventOnIgnore value)? onIgnore,
    TResult Function(SwaggerParserScreenEventParse value)? parse,
    required TResult orElse(),
  }) {
    if (onIgnore != null) {
      return onIgnore(this);
    }
    return orElse();
  }
}

abstract class SwaggerParserScreenEventOnIgnore
    implements SwaggerParserScreenEvent {
  const factory SwaggerParserScreenEventOnIgnore() =
      _$SwaggerParserScreenEventOnIgnoreImpl;
}

/// @nodoc
abstract class _$$SwaggerParserScreenEventParseImplCopyWith<$Res> {
  factory _$$SwaggerParserScreenEventParseImplCopyWith(
          _$SwaggerParserScreenEventParseImpl value,
          $Res Function(_$SwaggerParserScreenEventParseImpl) then) =
      __$$SwaggerParserScreenEventParseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$SwaggerParserScreenEventParseImplCopyWithImpl<$Res>
    extends _$SwaggerParserScreenEventCopyWithImpl<$Res,
        _$SwaggerParserScreenEventParseImpl>
    implements _$$SwaggerParserScreenEventParseImplCopyWith<$Res> {
  __$$SwaggerParserScreenEventParseImplCopyWithImpl(
      _$SwaggerParserScreenEventParseImpl _value,
      $Res Function(_$SwaggerParserScreenEventParseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$SwaggerParserScreenEventParseImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SwaggerParserScreenEventParseImpl
    implements SwaggerParserScreenEventParse {
  const _$SwaggerParserScreenEventParseImpl({required this.url});

  @override
  final String url;

  @override
  String toString() {
    return 'SwaggerParserScreenEvent.parse(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwaggerParserScreenEventParseImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwaggerParserScreenEventParseImplCopyWith<
          _$SwaggerParserScreenEventParseImpl>
      get copyWith => __$$SwaggerParserScreenEventParseImplCopyWithImpl<
          _$SwaggerParserScreenEventParseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() onReplace,
    required TResult Function() onIgnore,
    required TResult Function(String url) parse,
  }) {
    return parse(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? onReplace,
    TResult? Function()? onIgnore,
    TResult? Function(String url)? parse,
  }) {
    return parse?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? onReplace,
    TResult Function()? onIgnore,
    TResult Function(String url)? parse,
    required TResult orElse(),
  }) {
    if (parse != null) {
      return parse(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwaggerParserScreenEventInit value) init,
    required TResult Function(SwaggerParserScreenEventOnReplace value)
        onReplace,
    required TResult Function(SwaggerParserScreenEventOnIgnore value) onIgnore,
    required TResult Function(SwaggerParserScreenEventParse value) parse,
  }) {
    return parse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenEventInit value)? init,
    TResult? Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult? Function(SwaggerParserScreenEventOnIgnore value)? onIgnore,
    TResult? Function(SwaggerParserScreenEventParse value)? parse,
  }) {
    return parse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenEventInit value)? init,
    TResult Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult Function(SwaggerParserScreenEventOnIgnore value)? onIgnore,
    TResult Function(SwaggerParserScreenEventParse value)? parse,
    required TResult orElse(),
  }) {
    if (parse != null) {
      return parse(this);
    }
    return orElse();
  }
}

abstract class SwaggerParserScreenEventParse
    implements SwaggerParserScreenEvent {
  const factory SwaggerParserScreenEventParse({required final String url}) =
      _$SwaggerParserScreenEventParseImpl;

  String get url;
  @JsonKey(ignore: true)
  _$$SwaggerParserScreenEventParseImplCopyWith<
          _$SwaggerParserScreenEventParseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SwaggerParserScreenSR {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) onError,
    required TResult Function() onConflicting,
    required TResult Function() onContinue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? onError,
    TResult? Function()? onConflicting,
    TResult? Function()? onContinue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? onError,
    TResult Function()? onConflicting,
    TResult Function()? onContinue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnError value) onError,
    required TResult Function(_OnConflicting value) onConflicting,
    required TResult Function(_OnContinue value) onContinue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnError value)? onError,
    TResult? Function(_OnConflicting value)? onConflicting,
    TResult? Function(_OnContinue value)? onContinue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnError value)? onError,
    TResult Function(_OnConflicting value)? onConflicting,
    TResult Function(_OnContinue value)? onContinue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwaggerParserScreenSRCopyWith<$Res> {
  factory $SwaggerParserScreenSRCopyWith(SwaggerParserScreenSR value,
          $Res Function(SwaggerParserScreenSR) then) =
      _$SwaggerParserScreenSRCopyWithImpl<$Res, SwaggerParserScreenSR>;
}

/// @nodoc
class _$SwaggerParserScreenSRCopyWithImpl<$Res,
        $Val extends SwaggerParserScreenSR>
    implements $SwaggerParserScreenSRCopyWith<$Res> {
  _$SwaggerParserScreenSRCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnErrorImplCopyWith<$Res> {
  factory _$$OnErrorImplCopyWith(
          _$OnErrorImpl value, $Res Function(_$OnErrorImpl) then) =
      __$$OnErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OnErrorImplCopyWithImpl<$Res>
    extends _$SwaggerParserScreenSRCopyWithImpl<$Res, _$OnErrorImpl>
    implements _$$OnErrorImplCopyWith<$Res> {
  __$$OnErrorImplCopyWithImpl(
      _$OnErrorImpl _value, $Res Function(_$OnErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$OnErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnErrorImpl implements _OnError {
  const _$OnErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'SwaggerParserScreenSR.onError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnErrorImplCopyWith<_$OnErrorImpl> get copyWith =>
      __$$OnErrorImplCopyWithImpl<_$OnErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) onError,
    required TResult Function() onConflicting,
    required TResult Function() onContinue,
  }) {
    return onError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? onError,
    TResult? Function()? onConflicting,
    TResult? Function()? onContinue,
  }) {
    return onError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? onError,
    TResult Function()? onConflicting,
    TResult Function()? onContinue,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnError value) onError,
    required TResult Function(_OnConflicting value) onConflicting,
    required TResult Function(_OnContinue value) onContinue,
  }) {
    return onError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnError value)? onError,
    TResult? Function(_OnConflicting value)? onConflicting,
    TResult? Function(_OnContinue value)? onContinue,
  }) {
    return onError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnError value)? onError,
    TResult Function(_OnConflicting value)? onConflicting,
    TResult Function(_OnContinue value)? onContinue,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(this);
    }
    return orElse();
  }
}

abstract class _OnError implements SwaggerParserScreenSR {
  const factory _OnError({required final String message}) = _$OnErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$OnErrorImplCopyWith<_$OnErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnConflictingImplCopyWith<$Res> {
  factory _$$OnConflictingImplCopyWith(
          _$OnConflictingImpl value, $Res Function(_$OnConflictingImpl) then) =
      __$$OnConflictingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnConflictingImplCopyWithImpl<$Res>
    extends _$SwaggerParserScreenSRCopyWithImpl<$Res, _$OnConflictingImpl>
    implements _$$OnConflictingImplCopyWith<$Res> {
  __$$OnConflictingImplCopyWithImpl(
      _$OnConflictingImpl _value, $Res Function(_$OnConflictingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnConflictingImpl implements _OnConflicting {
  const _$OnConflictingImpl();

  @override
  String toString() {
    return 'SwaggerParserScreenSR.onConflicting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnConflictingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) onError,
    required TResult Function() onConflicting,
    required TResult Function() onContinue,
  }) {
    return onConflicting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? onError,
    TResult? Function()? onConflicting,
    TResult? Function()? onContinue,
  }) {
    return onConflicting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? onError,
    TResult Function()? onConflicting,
    TResult Function()? onContinue,
    required TResult orElse(),
  }) {
    if (onConflicting != null) {
      return onConflicting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnError value) onError,
    required TResult Function(_OnConflicting value) onConflicting,
    required TResult Function(_OnContinue value) onContinue,
  }) {
    return onConflicting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnError value)? onError,
    TResult? Function(_OnConflicting value)? onConflicting,
    TResult? Function(_OnContinue value)? onContinue,
  }) {
    return onConflicting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnError value)? onError,
    TResult Function(_OnConflicting value)? onConflicting,
    TResult Function(_OnContinue value)? onContinue,
    required TResult orElse(),
  }) {
    if (onConflicting != null) {
      return onConflicting(this);
    }
    return orElse();
  }
}

abstract class _OnConflicting implements SwaggerParserScreenSR {
  const factory _OnConflicting() = _$OnConflictingImpl;
}

/// @nodoc
abstract class _$$OnContinueImplCopyWith<$Res> {
  factory _$$OnContinueImplCopyWith(
          _$OnContinueImpl value, $Res Function(_$OnContinueImpl) then) =
      __$$OnContinueImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnContinueImplCopyWithImpl<$Res>
    extends _$SwaggerParserScreenSRCopyWithImpl<$Res, _$OnContinueImpl>
    implements _$$OnContinueImplCopyWith<$Res> {
  __$$OnContinueImplCopyWithImpl(
      _$OnContinueImpl _value, $Res Function(_$OnContinueImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnContinueImpl implements _OnContinue {
  const _$OnContinueImpl();

  @override
  String toString() {
    return 'SwaggerParserScreenSR.onContinue()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnContinueImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) onError,
    required TResult Function() onConflicting,
    required TResult Function() onContinue,
  }) {
    return onContinue();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? onError,
    TResult? Function()? onConflicting,
    TResult? Function()? onContinue,
  }) {
    return onContinue?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? onError,
    TResult Function()? onConflicting,
    TResult Function()? onContinue,
    required TResult orElse(),
  }) {
    if (onContinue != null) {
      return onContinue();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnError value) onError,
    required TResult Function(_OnConflicting value) onConflicting,
    required TResult Function(_OnContinue value) onContinue,
  }) {
    return onContinue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnError value)? onError,
    TResult? Function(_OnConflicting value)? onConflicting,
    TResult? Function(_OnContinue value)? onContinue,
  }) {
    return onContinue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnError value)? onError,
    TResult Function(_OnConflicting value)? onConflicting,
    TResult Function(_OnContinue value)? onContinue,
    required TResult orElse(),
  }) {
    if (onContinue != null) {
      return onContinue(this);
    }
    return orElse();
  }
}

abstract class _OnContinue implements SwaggerParserScreenSR {
  const factory _OnContinue() = _$OnContinueImpl;
}

/// @nodoc
mixin _$SwaggerParserScreenState {
  Config get config => throw _privateConstructorUsedError;
  Set<Source> get alreadyParsedSources => throw _privateConstructorUsedError;
  Set<DataComponent> get alreadyParsedComponents =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, Set<Source> alreadyParsedSources,
            Set<DataComponent> alreadyParsedComponents)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, Set<Source> alreadyParsedSources,
            Set<DataComponent> alreadyParsedComponents)?
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, Set<Source> alreadyParsedSources,
            Set<DataComponent> alreadyParsedComponents)?
        data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwaggerParserScreenStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SwaggerParserScreenStateCopyWith<SwaggerParserScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwaggerParserScreenStateCopyWith<$Res> {
  factory $SwaggerParserScreenStateCopyWith(SwaggerParserScreenState value,
          $Res Function(SwaggerParserScreenState) then) =
      _$SwaggerParserScreenStateCopyWithImpl<$Res, SwaggerParserScreenState>;
  @useResult
  $Res call(
      {Config config,
      Set<Source> alreadyParsedSources,
      Set<DataComponent> alreadyParsedComponents});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$SwaggerParserScreenStateCopyWithImpl<$Res,
        $Val extends SwaggerParserScreenState>
    implements $SwaggerParserScreenStateCopyWith<$Res> {
  _$SwaggerParserScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? alreadyParsedSources = null,
    Object? alreadyParsedComponents = null,
  }) {
    return _then(_value.copyWith(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      alreadyParsedSources: null == alreadyParsedSources
          ? _value.alreadyParsedSources
          : alreadyParsedSources // ignore: cast_nullable_to_non_nullable
              as Set<Source>,
      alreadyParsedComponents: null == alreadyParsedComponents
          ? _value.alreadyParsedComponents
          : alreadyParsedComponents // ignore: cast_nullable_to_non_nullable
              as Set<DataComponent>,
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
abstract class _$$SwaggerParserScreenStateDataImplCopyWith<$Res>
    implements $SwaggerParserScreenStateCopyWith<$Res> {
  factory _$$SwaggerParserScreenStateDataImplCopyWith(
          _$SwaggerParserScreenStateDataImpl value,
          $Res Function(_$SwaggerParserScreenStateDataImpl) then) =
      __$$SwaggerParserScreenStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Config config,
      Set<Source> alreadyParsedSources,
      Set<DataComponent> alreadyParsedComponents});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$SwaggerParserScreenStateDataImplCopyWithImpl<$Res>
    extends _$SwaggerParserScreenStateCopyWithImpl<$Res,
        _$SwaggerParserScreenStateDataImpl>
    implements _$$SwaggerParserScreenStateDataImplCopyWith<$Res> {
  __$$SwaggerParserScreenStateDataImplCopyWithImpl(
      _$SwaggerParserScreenStateDataImpl _value,
      $Res Function(_$SwaggerParserScreenStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? alreadyParsedSources = null,
    Object? alreadyParsedComponents = null,
  }) {
    return _then(_$SwaggerParserScreenStateDataImpl(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      alreadyParsedSources: null == alreadyParsedSources
          ? _value._alreadyParsedSources
          : alreadyParsedSources // ignore: cast_nullable_to_non_nullable
              as Set<Source>,
      alreadyParsedComponents: null == alreadyParsedComponents
          ? _value._alreadyParsedComponents
          : alreadyParsedComponents // ignore: cast_nullable_to_non_nullable
              as Set<DataComponent>,
    ));
  }
}

/// @nodoc

class _$SwaggerParserScreenStateDataImpl
    implements SwaggerParserScreenStateData {
  const _$SwaggerParserScreenStateDataImpl(
      {required this.config,
      final Set<Source> alreadyParsedSources = const {},
      final Set<DataComponent> alreadyParsedComponents = const {}})
      : _alreadyParsedSources = alreadyParsedSources,
        _alreadyParsedComponents = alreadyParsedComponents;

  @override
  final Config config;
  final Set<Source> _alreadyParsedSources;
  @override
  @JsonKey()
  Set<Source> get alreadyParsedSources {
    if (_alreadyParsedSources is EqualUnmodifiableSetView)
      return _alreadyParsedSources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_alreadyParsedSources);
  }

  final Set<DataComponent> _alreadyParsedComponents;
  @override
  @JsonKey()
  Set<DataComponent> get alreadyParsedComponents {
    if (_alreadyParsedComponents is EqualUnmodifiableSetView)
      return _alreadyParsedComponents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_alreadyParsedComponents);
  }

  @override
  String toString() {
    return 'SwaggerParserScreenState.data(config: $config, alreadyParsedSources: $alreadyParsedSources, alreadyParsedComponents: $alreadyParsedComponents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwaggerParserScreenStateDataImpl &&
            (identical(other.config, config) || other.config == config) &&
            const DeepCollectionEquality()
                .equals(other._alreadyParsedSources, _alreadyParsedSources) &&
            const DeepCollectionEquality().equals(
                other._alreadyParsedComponents, _alreadyParsedComponents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      config,
      const DeepCollectionEquality().hash(_alreadyParsedSources),
      const DeepCollectionEquality().hash(_alreadyParsedComponents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwaggerParserScreenStateDataImplCopyWith<
          _$SwaggerParserScreenStateDataImpl>
      get copyWith => __$$SwaggerParserScreenStateDataImplCopyWithImpl<
          _$SwaggerParserScreenStateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, Set<Source> alreadyParsedSources,
            Set<DataComponent> alreadyParsedComponents)
        data,
  }) {
    return data(config, alreadyParsedSources, alreadyParsedComponents);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, Set<Source> alreadyParsedSources,
            Set<DataComponent> alreadyParsedComponents)?
        data,
  }) {
    return data?.call(config, alreadyParsedSources, alreadyParsedComponents);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, Set<Source> alreadyParsedSources,
            Set<DataComponent> alreadyParsedComponents)?
        data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(config, alreadyParsedSources, alreadyParsedComponents);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwaggerParserScreenStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class SwaggerParserScreenStateData
    implements SwaggerParserScreenState {
  const factory SwaggerParserScreenStateData(
          {required final Config config,
          final Set<Source> alreadyParsedSources,
          final Set<DataComponent> alreadyParsedComponents}) =
      _$SwaggerParserScreenStateDataImpl;

  @override
  Config get config;
  @override
  Set<Source> get alreadyParsedSources;
  @override
  Set<DataComponent> get alreadyParsedComponents;
  @override
  @JsonKey(ignore: true)
  _$$SwaggerParserScreenStateDataImplCopyWith<
          _$SwaggerParserScreenStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
