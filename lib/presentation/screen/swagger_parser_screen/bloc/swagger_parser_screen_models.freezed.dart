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
    required TResult Function(String url) onUrlChanged,
    required TResult Function() onReplace,
    required TResult Function(String url) parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String url)? onUrlChanged,
    TResult? Function()? onReplace,
    TResult? Function(String url)? parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String url)? onUrlChanged,
    TResult Function()? onReplace,
    TResult Function(String url)? parse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwaggerParserScreenEventInit value) init,
    required TResult Function(SwaggerParserScreenEventOnUrlChanged value)
        onUrlChanged,
    required TResult Function(SwaggerParserScreenEventOnReplace value)
        onReplace,
    required TResult Function(SwaggerParserScreenEventParse value) parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenEventInit value)? init,
    TResult? Function(SwaggerParserScreenEventOnUrlChanged value)? onUrlChanged,
    TResult? Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult? Function(SwaggerParserScreenEventParse value)? parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenEventInit value)? init,
    TResult Function(SwaggerParserScreenEventOnUrlChanged value)? onUrlChanged,
    TResult Function(SwaggerParserScreenEventOnReplace value)? onReplace,
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
abstract class _$$SwaggerParserScreenEventInitCopyWith<$Res> {
  factory _$$SwaggerParserScreenEventInitCopyWith(
          _$SwaggerParserScreenEventInit value,
          $Res Function(_$SwaggerParserScreenEventInit) then) =
      __$$SwaggerParserScreenEventInitCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$SwaggerParserScreenEventInitCopyWithImpl<$Res>
    extends _$SwaggerParserScreenEventCopyWithImpl<$Res,
        _$SwaggerParserScreenEventInit>
    implements _$$SwaggerParserScreenEventInitCopyWith<$Res> {
  __$$SwaggerParserScreenEventInitCopyWithImpl(
      _$SwaggerParserScreenEventInit _value,
      $Res Function(_$SwaggerParserScreenEventInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$SwaggerParserScreenEventInit(
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

class _$SwaggerParserScreenEventInit implements SwaggerParserScreenEventInit {
  const _$SwaggerParserScreenEventInit({required this.config});

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
            other is _$SwaggerParserScreenEventInit &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwaggerParserScreenEventInitCopyWith<_$SwaggerParserScreenEventInit>
      get copyWith => __$$SwaggerParserScreenEventInitCopyWithImpl<
          _$SwaggerParserScreenEventInit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String url) onUrlChanged,
    required TResult Function() onReplace,
    required TResult Function(String url) parse,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String url)? onUrlChanged,
    TResult? Function()? onReplace,
    TResult? Function(String url)? parse,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String url)? onUrlChanged,
    TResult Function()? onReplace,
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
    required TResult Function(SwaggerParserScreenEventOnUrlChanged value)
        onUrlChanged,
    required TResult Function(SwaggerParserScreenEventOnReplace value)
        onReplace,
    required TResult Function(SwaggerParserScreenEventParse value) parse,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenEventInit value)? init,
    TResult? Function(SwaggerParserScreenEventOnUrlChanged value)? onUrlChanged,
    TResult? Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult? Function(SwaggerParserScreenEventParse value)? parse,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenEventInit value)? init,
    TResult Function(SwaggerParserScreenEventOnUrlChanged value)? onUrlChanged,
    TResult Function(SwaggerParserScreenEventOnReplace value)? onReplace,
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
      _$SwaggerParserScreenEventInit;

  Config get config;
  @JsonKey(ignore: true)
  _$$SwaggerParserScreenEventInitCopyWith<_$SwaggerParserScreenEventInit>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SwaggerParserScreenEventOnUrlChangedCopyWith<$Res> {
  factory _$$SwaggerParserScreenEventOnUrlChangedCopyWith(
          _$SwaggerParserScreenEventOnUrlChanged value,
          $Res Function(_$SwaggerParserScreenEventOnUrlChanged) then) =
      __$$SwaggerParserScreenEventOnUrlChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$SwaggerParserScreenEventOnUrlChangedCopyWithImpl<$Res>
    extends _$SwaggerParserScreenEventCopyWithImpl<$Res,
        _$SwaggerParserScreenEventOnUrlChanged>
    implements _$$SwaggerParserScreenEventOnUrlChangedCopyWith<$Res> {
  __$$SwaggerParserScreenEventOnUrlChangedCopyWithImpl(
      _$SwaggerParserScreenEventOnUrlChanged _value,
      $Res Function(_$SwaggerParserScreenEventOnUrlChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$SwaggerParserScreenEventOnUrlChanged(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SwaggerParserScreenEventOnUrlChanged
    implements SwaggerParserScreenEventOnUrlChanged {
  const _$SwaggerParserScreenEventOnUrlChanged({required this.url});

  @override
  final String url;

  @override
  String toString() {
    return 'SwaggerParserScreenEvent.onUrlChanged(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwaggerParserScreenEventOnUrlChanged &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwaggerParserScreenEventOnUrlChangedCopyWith<
          _$SwaggerParserScreenEventOnUrlChanged>
      get copyWith => __$$SwaggerParserScreenEventOnUrlChangedCopyWithImpl<
          _$SwaggerParserScreenEventOnUrlChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String url) onUrlChanged,
    required TResult Function() onReplace,
    required TResult Function(String url) parse,
  }) {
    return onUrlChanged(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String url)? onUrlChanged,
    TResult? Function()? onReplace,
    TResult? Function(String url)? parse,
  }) {
    return onUrlChanged?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String url)? onUrlChanged,
    TResult Function()? onReplace,
    TResult Function(String url)? parse,
    required TResult orElse(),
  }) {
    if (onUrlChanged != null) {
      return onUrlChanged(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwaggerParserScreenEventInit value) init,
    required TResult Function(SwaggerParserScreenEventOnUrlChanged value)
        onUrlChanged,
    required TResult Function(SwaggerParserScreenEventOnReplace value)
        onReplace,
    required TResult Function(SwaggerParserScreenEventParse value) parse,
  }) {
    return onUrlChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenEventInit value)? init,
    TResult? Function(SwaggerParserScreenEventOnUrlChanged value)? onUrlChanged,
    TResult? Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult? Function(SwaggerParserScreenEventParse value)? parse,
  }) {
    return onUrlChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenEventInit value)? init,
    TResult Function(SwaggerParserScreenEventOnUrlChanged value)? onUrlChanged,
    TResult Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult Function(SwaggerParserScreenEventParse value)? parse,
    required TResult orElse(),
  }) {
    if (onUrlChanged != null) {
      return onUrlChanged(this);
    }
    return orElse();
  }
}

abstract class SwaggerParserScreenEventOnUrlChanged
    implements SwaggerParserScreenEvent {
  const factory SwaggerParserScreenEventOnUrlChanged(
      {required final String url}) = _$SwaggerParserScreenEventOnUrlChanged;

  String get url;
  @JsonKey(ignore: true)
  _$$SwaggerParserScreenEventOnUrlChangedCopyWith<
          _$SwaggerParserScreenEventOnUrlChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SwaggerParserScreenEventOnReplaceCopyWith<$Res> {
  factory _$$SwaggerParserScreenEventOnReplaceCopyWith(
          _$SwaggerParserScreenEventOnReplace value,
          $Res Function(_$SwaggerParserScreenEventOnReplace) then) =
      __$$SwaggerParserScreenEventOnReplaceCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwaggerParserScreenEventOnReplaceCopyWithImpl<$Res>
    extends _$SwaggerParserScreenEventCopyWithImpl<$Res,
        _$SwaggerParserScreenEventOnReplace>
    implements _$$SwaggerParserScreenEventOnReplaceCopyWith<$Res> {
  __$$SwaggerParserScreenEventOnReplaceCopyWithImpl(
      _$SwaggerParserScreenEventOnReplace _value,
      $Res Function(_$SwaggerParserScreenEventOnReplace) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwaggerParserScreenEventOnReplace
    implements SwaggerParserScreenEventOnReplace {
  const _$SwaggerParserScreenEventOnReplace();

  @override
  String toString() {
    return 'SwaggerParserScreenEvent.onReplace()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwaggerParserScreenEventOnReplace);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String url) onUrlChanged,
    required TResult Function() onReplace,
    required TResult Function(String url) parse,
  }) {
    return onReplace();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String url)? onUrlChanged,
    TResult? Function()? onReplace,
    TResult? Function(String url)? parse,
  }) {
    return onReplace?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String url)? onUrlChanged,
    TResult Function()? onReplace,
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
    required TResult Function(SwaggerParserScreenEventOnUrlChanged value)
        onUrlChanged,
    required TResult Function(SwaggerParserScreenEventOnReplace value)
        onReplace,
    required TResult Function(SwaggerParserScreenEventParse value) parse,
  }) {
    return onReplace(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenEventInit value)? init,
    TResult? Function(SwaggerParserScreenEventOnUrlChanged value)? onUrlChanged,
    TResult? Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult? Function(SwaggerParserScreenEventParse value)? parse,
  }) {
    return onReplace?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenEventInit value)? init,
    TResult Function(SwaggerParserScreenEventOnUrlChanged value)? onUrlChanged,
    TResult Function(SwaggerParserScreenEventOnReplace value)? onReplace,
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
      _$SwaggerParserScreenEventOnReplace;
}

/// @nodoc
abstract class _$$SwaggerParserScreenEventParseCopyWith<$Res> {
  factory _$$SwaggerParserScreenEventParseCopyWith(
          _$SwaggerParserScreenEventParse value,
          $Res Function(_$SwaggerParserScreenEventParse) then) =
      __$$SwaggerParserScreenEventParseCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$SwaggerParserScreenEventParseCopyWithImpl<$Res>
    extends _$SwaggerParserScreenEventCopyWithImpl<$Res,
        _$SwaggerParserScreenEventParse>
    implements _$$SwaggerParserScreenEventParseCopyWith<$Res> {
  __$$SwaggerParserScreenEventParseCopyWithImpl(
      _$SwaggerParserScreenEventParse _value,
      $Res Function(_$SwaggerParserScreenEventParse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$SwaggerParserScreenEventParse(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SwaggerParserScreenEventParse implements SwaggerParserScreenEventParse {
  const _$SwaggerParserScreenEventParse({required this.url});

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
            other is _$SwaggerParserScreenEventParse &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwaggerParserScreenEventParseCopyWith<_$SwaggerParserScreenEventParse>
      get copyWith => __$$SwaggerParserScreenEventParseCopyWithImpl<
          _$SwaggerParserScreenEventParse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String url) onUrlChanged,
    required TResult Function() onReplace,
    required TResult Function(String url) parse,
  }) {
    return parse(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String url)? onUrlChanged,
    TResult? Function()? onReplace,
    TResult? Function(String url)? parse,
  }) {
    return parse?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String url)? onUrlChanged,
    TResult Function()? onReplace,
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
    required TResult Function(SwaggerParserScreenEventOnUrlChanged value)
        onUrlChanged,
    required TResult Function(SwaggerParserScreenEventOnReplace value)
        onReplace,
    required TResult Function(SwaggerParserScreenEventParse value) parse,
  }) {
    return parse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenEventInit value)? init,
    TResult? Function(SwaggerParserScreenEventOnUrlChanged value)? onUrlChanged,
    TResult? Function(SwaggerParserScreenEventOnReplace value)? onReplace,
    TResult? Function(SwaggerParserScreenEventParse value)? parse,
  }) {
    return parse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenEventInit value)? init,
    TResult Function(SwaggerParserScreenEventOnUrlChanged value)? onUrlChanged,
    TResult Function(SwaggerParserScreenEventOnReplace value)? onReplace,
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
      _$SwaggerParserScreenEventParse;

  String get url;
  @JsonKey(ignore: true)
  _$$SwaggerParserScreenEventParseCopyWith<_$SwaggerParserScreenEventParse>
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
abstract class _$$_OnErrorCopyWith<$Res> {
  factory _$$_OnErrorCopyWith(
          _$_OnError value, $Res Function(_$_OnError) then) =
      __$$_OnErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_OnErrorCopyWithImpl<$Res>
    extends _$SwaggerParserScreenSRCopyWithImpl<$Res, _$_OnError>
    implements _$$_OnErrorCopyWith<$Res> {
  __$$_OnErrorCopyWithImpl(_$_OnError _value, $Res Function(_$_OnError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_OnError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnError implements _OnError {
  const _$_OnError({required this.message});

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
            other is _$_OnError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnErrorCopyWith<_$_OnError> get copyWith =>
      __$$_OnErrorCopyWithImpl<_$_OnError>(this, _$identity);

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
  const factory _OnError({required final String message}) = _$_OnError;

  String get message;
  @JsonKey(ignore: true)
  _$$_OnErrorCopyWith<_$_OnError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnConflictingCopyWith<$Res> {
  factory _$$_OnConflictingCopyWith(
          _$_OnConflicting value, $Res Function(_$_OnConflicting) then) =
      __$$_OnConflictingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnConflictingCopyWithImpl<$Res>
    extends _$SwaggerParserScreenSRCopyWithImpl<$Res, _$_OnConflicting>
    implements _$$_OnConflictingCopyWith<$Res> {
  __$$_OnConflictingCopyWithImpl(
      _$_OnConflicting _value, $Res Function(_$_OnConflicting) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_OnConflicting implements _OnConflicting {
  const _$_OnConflicting();

  @override
  String toString() {
    return 'SwaggerParserScreenSR.onConflicting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OnConflicting);
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
  const factory _OnConflicting() = _$_OnConflicting;
}

/// @nodoc
abstract class _$$_OnContinueCopyWith<$Res> {
  factory _$$_OnContinueCopyWith(
          _$_OnContinue value, $Res Function(_$_OnContinue) then) =
      __$$_OnContinueCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnContinueCopyWithImpl<$Res>
    extends _$SwaggerParserScreenSRCopyWithImpl<$Res, _$_OnContinue>
    implements _$$_OnContinueCopyWith<$Res> {
  __$$_OnContinueCopyWithImpl(
      _$_OnContinue _value, $Res Function(_$_OnContinue) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_OnContinue implements _OnContinue {
  const _$_OnContinue();

  @override
  String toString() {
    return 'SwaggerParserScreenSR.onContinue()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OnContinue);
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
  const factory _OnContinue() = _$_OnContinue;
}

/// @nodoc
mixin _$SwaggerParserScreenState {
  Config get config => throw _privateConstructorUsedError;
  SwaggerData get parsedData => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, SwaggerData parsedData) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, SwaggerData parsedData)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, SwaggerData parsedData)? data,
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
  $Res call({Config config, SwaggerData parsedData});

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
    Object? parsedData = null,
  }) {
    return _then(_value.copyWith(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      parsedData: null == parsedData
          ? _value.parsedData
          : parsedData // ignore: cast_nullable_to_non_nullable
              as SwaggerData,
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
abstract class _$$SwaggerParserScreenStateDataCopyWith<$Res>
    implements $SwaggerParserScreenStateCopyWith<$Res> {
  factory _$$SwaggerParserScreenStateDataCopyWith(
          _$SwaggerParserScreenStateData value,
          $Res Function(_$SwaggerParserScreenStateData) then) =
      __$$SwaggerParserScreenStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config, SwaggerData parsedData});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$SwaggerParserScreenStateDataCopyWithImpl<$Res>
    extends _$SwaggerParserScreenStateCopyWithImpl<$Res,
        _$SwaggerParserScreenStateData>
    implements _$$SwaggerParserScreenStateDataCopyWith<$Res> {
  __$$SwaggerParserScreenStateDataCopyWithImpl(
      _$SwaggerParserScreenStateData _value,
      $Res Function(_$SwaggerParserScreenStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? parsedData = null,
  }) {
    return _then(_$SwaggerParserScreenStateData(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      parsedData: null == parsedData
          ? _value.parsedData
          : parsedData // ignore: cast_nullable_to_non_nullable
              as SwaggerData,
    ));
  }
}

/// @nodoc

class _$SwaggerParserScreenStateData implements SwaggerParserScreenStateData {
  const _$SwaggerParserScreenStateData(
      {required this.config, required this.parsedData});

  @override
  final Config config;
  @override
  final SwaggerData parsedData;

  @override
  String toString() {
    return 'SwaggerParserScreenState.data(config: $config, parsedData: $parsedData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwaggerParserScreenStateData &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.parsedData, parsedData) ||
                other.parsedData == parsedData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, parsedData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwaggerParserScreenStateDataCopyWith<_$SwaggerParserScreenStateData>
      get copyWith => __$$SwaggerParserScreenStateDataCopyWithImpl<
          _$SwaggerParserScreenStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, SwaggerData parsedData) data,
  }) {
    return data(config, parsedData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, SwaggerData parsedData)? data,
  }) {
    return data?.call(config, parsedData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, SwaggerData parsedData)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(config, parsedData);
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
      required final SwaggerData parsedData}) = _$SwaggerParserScreenStateData;

  @override
  Config get config;
  @override
  SwaggerData get parsedData;
  @override
  @JsonKey(ignore: true)
  _$$SwaggerParserScreenStateDataCopyWith<_$SwaggerParserScreenStateData>
      get copyWith => throw _privateConstructorUsedError;
}
