// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_screen_bloc_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SplashScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashScreenEventCopyWith<$Res> {
  factory $SplashScreenEventCopyWith(
          SplashScreenEvent value, $Res Function(SplashScreenEvent) then) =
      _$SplashScreenEventCopyWithImpl<$Res, SplashScreenEvent>;
}

/// @nodoc
class _$SplashScreenEventCopyWithImpl<$Res, $Val extends SplashScreenEvent>
    implements $SplashScreenEventCopyWith<$Res> {
  _$SplashScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitCopyWith<$Res> {
  factory _$$InitCopyWith(_$Init value, $Res Function(_$Init) then) =
      __$$InitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitCopyWithImpl<$Res>
    extends _$SplashScreenEventCopyWithImpl<$Res, _$Init>
    implements _$$InitCopyWith<$Res> {
  __$$InitCopyWithImpl(_$Init _value, $Res Function(_$Init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Init implements Init {
  const _$Init();

  @override
  String toString() {
    return 'SplashScreenEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements SplashScreenEvent {
  const factory Init() = _$Init;
}

/// @nodoc
mixin _$SplashScreenState {
  String? get remoteVersion => throw _privateConstructorUsedError;
  String? get localVersion => throw _privateConstructorUsedError;
  bool get loadFinished => throw _privateConstructorUsedError;
  bool get logoVisible => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? remoteVersion, String? localVersion,
            bool loadFinished, bool logoVisible)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? remoteVersion, String? localVersion,
            bool loadFinished, bool logoVisible)?
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? remoteVersion, String? localVersion,
            bool loadFinished, bool logoVisible)?
        data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SplashScreenStateCopyWith<SplashScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashScreenStateCopyWith<$Res> {
  factory $SplashScreenStateCopyWith(
          SplashScreenState value, $Res Function(SplashScreenState) then) =
      _$SplashScreenStateCopyWithImpl<$Res, SplashScreenState>;
  @useResult
  $Res call(
      {String? remoteVersion,
      String? localVersion,
      bool loadFinished,
      bool logoVisible});
}

/// @nodoc
class _$SplashScreenStateCopyWithImpl<$Res, $Val extends SplashScreenState>
    implements $SplashScreenStateCopyWith<$Res> {
  _$SplashScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteVersion = freezed,
    Object? localVersion = freezed,
    Object? loadFinished = null,
    Object? logoVisible = null,
  }) {
    return _then(_value.copyWith(
      remoteVersion: freezed == remoteVersion
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      localVersion: freezed == localVersion
          ? _value.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      loadFinished: null == loadFinished
          ? _value.loadFinished
          : loadFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      logoVisible: null == logoVisible
          ? _value.logoVisible
          : logoVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataCopyWith<$Res>
    implements $SplashScreenStateCopyWith<$Res> {
  factory _$$DataCopyWith(_$Data value, $Res Function(_$Data) then) =
      __$$DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? remoteVersion,
      String? localVersion,
      bool loadFinished,
      bool logoVisible});
}

/// @nodoc
class __$$DataCopyWithImpl<$Res>
    extends _$SplashScreenStateCopyWithImpl<$Res, _$Data>
    implements _$$DataCopyWith<$Res> {
  __$$DataCopyWithImpl(_$Data _value, $Res Function(_$Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteVersion = freezed,
    Object? localVersion = freezed,
    Object? loadFinished = null,
    Object? logoVisible = null,
  }) {
    return _then(_$Data(
      remoteVersion: freezed == remoteVersion
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      localVersion: freezed == localVersion
          ? _value.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      loadFinished: null == loadFinished
          ? _value.loadFinished
          : loadFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      logoVisible: null == logoVisible
          ? _value.logoVisible
          : logoVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Data implements Data {
  const _$Data(
      {this.remoteVersion,
      this.localVersion,
      this.loadFinished = false,
      this.logoVisible = false});

  @override
  final String? remoteVersion;
  @override
  final String? localVersion;
  @override
  @JsonKey()
  final bool loadFinished;
  @override
  @JsonKey()
  final bool logoVisible;

  @override
  String toString() {
    return 'SplashScreenState.data(remoteVersion: $remoteVersion, localVersion: $localVersion, loadFinished: $loadFinished, logoVisible: $logoVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Data &&
            (identical(other.remoteVersion, remoteVersion) ||
                other.remoteVersion == remoteVersion) &&
            (identical(other.localVersion, localVersion) ||
                other.localVersion == localVersion) &&
            (identical(other.loadFinished, loadFinished) ||
                other.loadFinished == loadFinished) &&
            (identical(other.logoVisible, logoVisible) ||
                other.logoVisible == logoVisible));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, remoteVersion, localVersion, loadFinished, logoVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataCopyWith<_$Data> get copyWith =>
      __$$DataCopyWithImpl<_$Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? remoteVersion, String? localVersion,
            bool loadFinished, bool logoVisible)
        data,
  }) {
    return data(remoteVersion, localVersion, loadFinished, logoVisible);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? remoteVersion, String? localVersion,
            bool loadFinished, bool logoVisible)?
        data,
  }) {
    return data?.call(remoteVersion, localVersion, loadFinished, logoVisible);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? remoteVersion, String? localVersion,
            bool loadFinished, bool logoVisible)?
        data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(remoteVersion, localVersion, loadFinished, logoVisible);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class Data implements SplashScreenState {
  const factory Data(
      {final String? remoteVersion,
      final String? localVersion,
      final bool loadFinished,
      final bool logoVisible}) = _$Data;

  @override
  String? get remoteVersion;
  @override
  String? get localVersion;
  @override
  bool get loadFinished;
  @override
  bool get logoVisible;
  @override
  @JsonKey(ignore: true)
  _$$DataCopyWith<_$Data> get copyWith => throw _privateConstructorUsedError;
}
