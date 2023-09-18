// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modify_project_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ModifyProjectScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(int index) changeTab,
    required TResult Function() onGenerate,
    required TResult Function(String path) onParse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(int index)? changeTab,
    TResult? Function()? onGenerate,
    TResult? Function(String path)? onParse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(int index)? changeTab,
    TResult Function()? onGenerate,
    TResult Function(String path)? onParse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ModifyProjectScreenEventInit value) init,
    required TResult Function(ModifyProjectScreenEventChangeTab value)
        changeTab,
    required TResult Function(ModifyProjectScreenEventOnGenerate value)
        onGenerate,
    required TResult Function(ModifyProjectScreenEventOnParse value) onParse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModifyProjectScreenEventInit value)? init,
    TResult? Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult? Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
    TResult? Function(ModifyProjectScreenEventOnParse value)? onParse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModifyProjectScreenEventInit value)? init,
    TResult Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
    TResult Function(ModifyProjectScreenEventOnParse value)? onParse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifyProjectScreenEventCopyWith<$Res> {
  factory $ModifyProjectScreenEventCopyWith(ModifyProjectScreenEvent value,
          $Res Function(ModifyProjectScreenEvent) then) =
      _$ModifyProjectScreenEventCopyWithImpl<$Res, ModifyProjectScreenEvent>;
}

/// @nodoc
class _$ModifyProjectScreenEventCopyWithImpl<$Res,
        $Val extends ModifyProjectScreenEvent>
    implements $ModifyProjectScreenEventCopyWith<$Res> {
  _$ModifyProjectScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ModifyProjectScreenEventInitCopyWith<$Res> {
  factory _$$ModifyProjectScreenEventInitCopyWith(
          _$ModifyProjectScreenEventInit value,
          $Res Function(_$ModifyProjectScreenEventInit) then) =
      __$$ModifyProjectScreenEventInitCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ModifyProjectScreenEventInitCopyWithImpl<$Res>
    extends _$ModifyProjectScreenEventCopyWithImpl<$Res,
        _$ModifyProjectScreenEventInit>
    implements _$$ModifyProjectScreenEventInitCopyWith<$Res> {
  __$$ModifyProjectScreenEventInitCopyWithImpl(
      _$ModifyProjectScreenEventInit _value,
      $Res Function(_$ModifyProjectScreenEventInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$ModifyProjectScreenEventInit(
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

class _$ModifyProjectScreenEventInit implements ModifyProjectScreenEventInit {
  const _$ModifyProjectScreenEventInit({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'ModifyProjectScreenEvent.init(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyProjectScreenEventInit &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifyProjectScreenEventInitCopyWith<_$ModifyProjectScreenEventInit>
      get copyWith => __$$ModifyProjectScreenEventInitCopyWithImpl<
          _$ModifyProjectScreenEventInit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(int index) changeTab,
    required TResult Function() onGenerate,
    required TResult Function(String path) onParse,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(int index)? changeTab,
    TResult? Function()? onGenerate,
    TResult? Function(String path)? onParse,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(int index)? changeTab,
    TResult Function()? onGenerate,
    TResult Function(String path)? onParse,
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
    required TResult Function(ModifyProjectScreenEventInit value) init,
    required TResult Function(ModifyProjectScreenEventChangeTab value)
        changeTab,
    required TResult Function(ModifyProjectScreenEventOnGenerate value)
        onGenerate,
    required TResult Function(ModifyProjectScreenEventOnParse value) onParse,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModifyProjectScreenEventInit value)? init,
    TResult? Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult? Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
    TResult? Function(ModifyProjectScreenEventOnParse value)? onParse,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModifyProjectScreenEventInit value)? init,
    TResult Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
    TResult Function(ModifyProjectScreenEventOnParse value)? onParse,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class ModifyProjectScreenEventInit
    implements ModifyProjectScreenEvent {
  const factory ModifyProjectScreenEventInit({required final Config config}) =
      _$ModifyProjectScreenEventInit;

  Config get config;
  @JsonKey(ignore: true)
  _$$ModifyProjectScreenEventInitCopyWith<_$ModifyProjectScreenEventInit>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ModifyProjectScreenEventChangeTabCopyWith<$Res> {
  factory _$$ModifyProjectScreenEventChangeTabCopyWith(
          _$ModifyProjectScreenEventChangeTab value,
          $Res Function(_$ModifyProjectScreenEventChangeTab) then) =
      __$$ModifyProjectScreenEventChangeTabCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ModifyProjectScreenEventChangeTabCopyWithImpl<$Res>
    extends _$ModifyProjectScreenEventCopyWithImpl<$Res,
        _$ModifyProjectScreenEventChangeTab>
    implements _$$ModifyProjectScreenEventChangeTabCopyWith<$Res> {
  __$$ModifyProjectScreenEventChangeTabCopyWithImpl(
      _$ModifyProjectScreenEventChangeTab _value,
      $Res Function(_$ModifyProjectScreenEventChangeTab) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$ModifyProjectScreenEventChangeTab(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ModifyProjectScreenEventChangeTab
    implements ModifyProjectScreenEventChangeTab {
  const _$ModifyProjectScreenEventChangeTab({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'ModifyProjectScreenEvent.changeTab(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyProjectScreenEventChangeTab &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifyProjectScreenEventChangeTabCopyWith<
          _$ModifyProjectScreenEventChangeTab>
      get copyWith => __$$ModifyProjectScreenEventChangeTabCopyWithImpl<
          _$ModifyProjectScreenEventChangeTab>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(int index) changeTab,
    required TResult Function() onGenerate,
    required TResult Function(String path) onParse,
  }) {
    return changeTab(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(int index)? changeTab,
    TResult? Function()? onGenerate,
    TResult? Function(String path)? onParse,
  }) {
    return changeTab?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(int index)? changeTab,
    TResult Function()? onGenerate,
    TResult Function(String path)? onParse,
    required TResult orElse(),
  }) {
    if (changeTab != null) {
      return changeTab(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ModifyProjectScreenEventInit value) init,
    required TResult Function(ModifyProjectScreenEventChangeTab value)
        changeTab,
    required TResult Function(ModifyProjectScreenEventOnGenerate value)
        onGenerate,
    required TResult Function(ModifyProjectScreenEventOnParse value) onParse,
  }) {
    return changeTab(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModifyProjectScreenEventInit value)? init,
    TResult? Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult? Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
    TResult? Function(ModifyProjectScreenEventOnParse value)? onParse,
  }) {
    return changeTab?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModifyProjectScreenEventInit value)? init,
    TResult Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
    TResult Function(ModifyProjectScreenEventOnParse value)? onParse,
    required TResult orElse(),
  }) {
    if (changeTab != null) {
      return changeTab(this);
    }
    return orElse();
  }
}

abstract class ModifyProjectScreenEventChangeTab
    implements ModifyProjectScreenEvent {
  const factory ModifyProjectScreenEventChangeTab({required final int index}) =
      _$ModifyProjectScreenEventChangeTab;

  int get index;
  @JsonKey(ignore: true)
  _$$ModifyProjectScreenEventChangeTabCopyWith<
          _$ModifyProjectScreenEventChangeTab>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ModifyProjectScreenEventOnGenerateCopyWith<$Res> {
  factory _$$ModifyProjectScreenEventOnGenerateCopyWith(
          _$ModifyProjectScreenEventOnGenerate value,
          $Res Function(_$ModifyProjectScreenEventOnGenerate) then) =
      __$$ModifyProjectScreenEventOnGenerateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ModifyProjectScreenEventOnGenerateCopyWithImpl<$Res>
    extends _$ModifyProjectScreenEventCopyWithImpl<$Res,
        _$ModifyProjectScreenEventOnGenerate>
    implements _$$ModifyProjectScreenEventOnGenerateCopyWith<$Res> {
  __$$ModifyProjectScreenEventOnGenerateCopyWithImpl(
      _$ModifyProjectScreenEventOnGenerate _value,
      $Res Function(_$ModifyProjectScreenEventOnGenerate) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ModifyProjectScreenEventOnGenerate
    implements ModifyProjectScreenEventOnGenerate {
  const _$ModifyProjectScreenEventOnGenerate();

  @override
  String toString() {
    return 'ModifyProjectScreenEvent.onGenerate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyProjectScreenEventOnGenerate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(int index) changeTab,
    required TResult Function() onGenerate,
    required TResult Function(String path) onParse,
  }) {
    return onGenerate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(int index)? changeTab,
    TResult? Function()? onGenerate,
    TResult? Function(String path)? onParse,
  }) {
    return onGenerate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(int index)? changeTab,
    TResult Function()? onGenerate,
    TResult Function(String path)? onParse,
    required TResult orElse(),
  }) {
    if (onGenerate != null) {
      return onGenerate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ModifyProjectScreenEventInit value) init,
    required TResult Function(ModifyProjectScreenEventChangeTab value)
        changeTab,
    required TResult Function(ModifyProjectScreenEventOnGenerate value)
        onGenerate,
    required TResult Function(ModifyProjectScreenEventOnParse value) onParse,
  }) {
    return onGenerate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModifyProjectScreenEventInit value)? init,
    TResult? Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult? Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
    TResult? Function(ModifyProjectScreenEventOnParse value)? onParse,
  }) {
    return onGenerate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModifyProjectScreenEventInit value)? init,
    TResult Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
    TResult Function(ModifyProjectScreenEventOnParse value)? onParse,
    required TResult orElse(),
  }) {
    if (onGenerate != null) {
      return onGenerate(this);
    }
    return orElse();
  }
}

abstract class ModifyProjectScreenEventOnGenerate
    implements ModifyProjectScreenEvent {
  const factory ModifyProjectScreenEventOnGenerate() =
      _$ModifyProjectScreenEventOnGenerate;
}

/// @nodoc
abstract class _$$ModifyProjectScreenEventOnParseCopyWith<$Res> {
  factory _$$ModifyProjectScreenEventOnParseCopyWith(
          _$ModifyProjectScreenEventOnParse value,
          $Res Function(_$ModifyProjectScreenEventOnParse) then) =
      __$$ModifyProjectScreenEventOnParseCopyWithImpl<$Res>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$ModifyProjectScreenEventOnParseCopyWithImpl<$Res>
    extends _$ModifyProjectScreenEventCopyWithImpl<$Res,
        _$ModifyProjectScreenEventOnParse>
    implements _$$ModifyProjectScreenEventOnParseCopyWith<$Res> {
  __$$ModifyProjectScreenEventOnParseCopyWithImpl(
      _$ModifyProjectScreenEventOnParse _value,
      $Res Function(_$ModifyProjectScreenEventOnParse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$ModifyProjectScreenEventOnParse(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ModifyProjectScreenEventOnParse
    implements ModifyProjectScreenEventOnParse {
  const _$ModifyProjectScreenEventOnParse({required this.path});

  @override
  final String path;

  @override
  String toString() {
    return 'ModifyProjectScreenEvent.onParse(path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyProjectScreenEventOnParse &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifyProjectScreenEventOnParseCopyWith<_$ModifyProjectScreenEventOnParse>
      get copyWith => __$$ModifyProjectScreenEventOnParseCopyWithImpl<
          _$ModifyProjectScreenEventOnParse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(int index) changeTab,
    required TResult Function() onGenerate,
    required TResult Function(String path) onParse,
  }) {
    return onParse(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(int index)? changeTab,
    TResult? Function()? onGenerate,
    TResult? Function(String path)? onParse,
  }) {
    return onParse?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(int index)? changeTab,
    TResult Function()? onGenerate,
    TResult Function(String path)? onParse,
    required TResult orElse(),
  }) {
    if (onParse != null) {
      return onParse(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ModifyProjectScreenEventInit value) init,
    required TResult Function(ModifyProjectScreenEventChangeTab value)
        changeTab,
    required TResult Function(ModifyProjectScreenEventOnGenerate value)
        onGenerate,
    required TResult Function(ModifyProjectScreenEventOnParse value) onParse,
  }) {
    return onParse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModifyProjectScreenEventInit value)? init,
    TResult? Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult? Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
    TResult? Function(ModifyProjectScreenEventOnParse value)? onParse,
  }) {
    return onParse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModifyProjectScreenEventInit value)? init,
    TResult Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
    TResult Function(ModifyProjectScreenEventOnParse value)? onParse,
    required TResult orElse(),
  }) {
    if (onParse != null) {
      return onParse(this);
    }
    return orElse();
  }
}

abstract class ModifyProjectScreenEventOnParse
    implements ModifyProjectScreenEvent {
  const factory ModifyProjectScreenEventOnParse({required final String path}) =
      _$ModifyProjectScreenEventOnParse;

  String get path;
  @JsonKey(ignore: true)
  _$$ModifyProjectScreenEventOnParseCopyWith<_$ModifyProjectScreenEventOnParse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ModifyProjectScreenSR {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) loadFinished,
    required TResult Function() onGenerate,
    required TResult Function(String message) onError,
    required TResult Function() onRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? loadFinished,
    TResult? Function()? onGenerate,
    TResult? Function(String message)? onError,
    TResult? Function()? onRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? loadFinished,
    TResult Function()? onGenerate,
    TResult Function(String message)? onError,
    TResult Function()? onRefresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_OnGenerate value) onGenerate,
    required TResult Function(_OnError value) onError,
    required TResult Function(ModifyProjectScreenSROnRefresh value) onRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_OnGenerate value)? onGenerate,
    TResult? Function(_OnError value)? onError,
    TResult? Function(ModifyProjectScreenSROnRefresh value)? onRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_OnGenerate value)? onGenerate,
    TResult Function(_OnError value)? onError,
    TResult Function(ModifyProjectScreenSROnRefresh value)? onRefresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifyProjectScreenSRCopyWith<$Res> {
  factory $ModifyProjectScreenSRCopyWith(ModifyProjectScreenSR value,
          $Res Function(ModifyProjectScreenSR) then) =
      _$ModifyProjectScreenSRCopyWithImpl<$Res, ModifyProjectScreenSR>;
}

/// @nodoc
class _$ModifyProjectScreenSRCopyWithImpl<$Res,
        $Val extends ModifyProjectScreenSR>
    implements $ModifyProjectScreenSRCopyWith<$Res> {
  _$ModifyProjectScreenSRCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadFinishedCopyWith<$Res> {
  factory _$$_LoadFinishedCopyWith(
          _$_LoadFinished value, $Res Function(_$_LoadFinished) then) =
      __$$_LoadFinishedCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$_LoadFinishedCopyWithImpl<$Res>
    extends _$ModifyProjectScreenSRCopyWithImpl<$Res, _$_LoadFinished>
    implements _$$_LoadFinishedCopyWith<$Res> {
  __$$_LoadFinishedCopyWithImpl(
      _$_LoadFinished _value, $Res Function(_$_LoadFinished) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$_LoadFinished(
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

class _$_LoadFinished implements _LoadFinished {
  const _$_LoadFinished({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'ModifyProjectScreenSR.loadFinished(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadFinished &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadFinishedCopyWith<_$_LoadFinished> get copyWith =>
      __$$_LoadFinishedCopyWithImpl<_$_LoadFinished>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) loadFinished,
    required TResult Function() onGenerate,
    required TResult Function(String message) onError,
    required TResult Function() onRefresh,
  }) {
    return loadFinished(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? loadFinished,
    TResult? Function()? onGenerate,
    TResult? Function(String message)? onError,
    TResult? Function()? onRefresh,
  }) {
    return loadFinished?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? loadFinished,
    TResult Function()? onGenerate,
    TResult Function(String message)? onError,
    TResult Function()? onRefresh,
    required TResult orElse(),
  }) {
    if (loadFinished != null) {
      return loadFinished(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_OnGenerate value) onGenerate,
    required TResult Function(_OnError value) onError,
    required TResult Function(ModifyProjectScreenSROnRefresh value) onRefresh,
  }) {
    return loadFinished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_OnGenerate value)? onGenerate,
    TResult? Function(_OnError value)? onError,
    TResult? Function(ModifyProjectScreenSROnRefresh value)? onRefresh,
  }) {
    return loadFinished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_OnGenerate value)? onGenerate,
    TResult Function(_OnError value)? onError,
    TResult Function(ModifyProjectScreenSROnRefresh value)? onRefresh,
    required TResult orElse(),
  }) {
    if (loadFinished != null) {
      return loadFinished(this);
    }
    return orElse();
  }
}

abstract class _LoadFinished implements ModifyProjectScreenSR {
  const factory _LoadFinished({required final Config config}) = _$_LoadFinished;

  Config get config;
  @JsonKey(ignore: true)
  _$$_LoadFinishedCopyWith<_$_LoadFinished> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnGenerateCopyWith<$Res> {
  factory _$$_OnGenerateCopyWith(
          _$_OnGenerate value, $Res Function(_$_OnGenerate) then) =
      __$$_OnGenerateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnGenerateCopyWithImpl<$Res>
    extends _$ModifyProjectScreenSRCopyWithImpl<$Res, _$_OnGenerate>
    implements _$$_OnGenerateCopyWith<$Res> {
  __$$_OnGenerateCopyWithImpl(
      _$_OnGenerate _value, $Res Function(_$_OnGenerate) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_OnGenerate implements _OnGenerate {
  const _$_OnGenerate();

  @override
  String toString() {
    return 'ModifyProjectScreenSR.onGenerate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OnGenerate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) loadFinished,
    required TResult Function() onGenerate,
    required TResult Function(String message) onError,
    required TResult Function() onRefresh,
  }) {
    return onGenerate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? loadFinished,
    TResult? Function()? onGenerate,
    TResult? Function(String message)? onError,
    TResult? Function()? onRefresh,
  }) {
    return onGenerate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? loadFinished,
    TResult Function()? onGenerate,
    TResult Function(String message)? onError,
    TResult Function()? onRefresh,
    required TResult orElse(),
  }) {
    if (onGenerate != null) {
      return onGenerate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_OnGenerate value) onGenerate,
    required TResult Function(_OnError value) onError,
    required TResult Function(ModifyProjectScreenSROnRefresh value) onRefresh,
  }) {
    return onGenerate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_OnGenerate value)? onGenerate,
    TResult? Function(_OnError value)? onError,
    TResult? Function(ModifyProjectScreenSROnRefresh value)? onRefresh,
  }) {
    return onGenerate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_OnGenerate value)? onGenerate,
    TResult Function(_OnError value)? onError,
    TResult Function(ModifyProjectScreenSROnRefresh value)? onRefresh,
    required TResult orElse(),
  }) {
    if (onGenerate != null) {
      return onGenerate(this);
    }
    return orElse();
  }
}

abstract class _OnGenerate implements ModifyProjectScreenSR {
  const factory _OnGenerate() = _$_OnGenerate;
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
    extends _$ModifyProjectScreenSRCopyWithImpl<$Res, _$_OnError>
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
    return 'ModifyProjectScreenSR.onError(message: $message)';
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
    required TResult Function(Config config) loadFinished,
    required TResult Function() onGenerate,
    required TResult Function(String message) onError,
    required TResult Function() onRefresh,
  }) {
    return onError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? loadFinished,
    TResult? Function()? onGenerate,
    TResult? Function(String message)? onError,
    TResult? Function()? onRefresh,
  }) {
    return onError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? loadFinished,
    TResult Function()? onGenerate,
    TResult Function(String message)? onError,
    TResult Function()? onRefresh,
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
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_OnGenerate value) onGenerate,
    required TResult Function(_OnError value) onError,
    required TResult Function(ModifyProjectScreenSROnRefresh value) onRefresh,
  }) {
    return onError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_OnGenerate value)? onGenerate,
    TResult? Function(_OnError value)? onError,
    TResult? Function(ModifyProjectScreenSROnRefresh value)? onRefresh,
  }) {
    return onError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_OnGenerate value)? onGenerate,
    TResult Function(_OnError value)? onError,
    TResult Function(ModifyProjectScreenSROnRefresh value)? onRefresh,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(this);
    }
    return orElse();
  }
}

abstract class _OnError implements ModifyProjectScreenSR {
  const factory _OnError({required final String message}) = _$_OnError;

  String get message;
  @JsonKey(ignore: true)
  _$$_OnErrorCopyWith<_$_OnError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ModifyProjectScreenSROnRefreshCopyWith<$Res> {
  factory _$$ModifyProjectScreenSROnRefreshCopyWith(
          _$ModifyProjectScreenSROnRefresh value,
          $Res Function(_$ModifyProjectScreenSROnRefresh) then) =
      __$$ModifyProjectScreenSROnRefreshCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ModifyProjectScreenSROnRefreshCopyWithImpl<$Res>
    extends _$ModifyProjectScreenSRCopyWithImpl<$Res,
        _$ModifyProjectScreenSROnRefresh>
    implements _$$ModifyProjectScreenSROnRefreshCopyWith<$Res> {
  __$$ModifyProjectScreenSROnRefreshCopyWithImpl(
      _$ModifyProjectScreenSROnRefresh _value,
      $Res Function(_$ModifyProjectScreenSROnRefresh) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ModifyProjectScreenSROnRefresh
    implements ModifyProjectScreenSROnRefresh {
  const _$ModifyProjectScreenSROnRefresh();

  @override
  String toString() {
    return 'ModifyProjectScreenSR.onRefresh()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyProjectScreenSROnRefresh);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) loadFinished,
    required TResult Function() onGenerate,
    required TResult Function(String message) onError,
    required TResult Function() onRefresh,
  }) {
    return onRefresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? loadFinished,
    TResult? Function()? onGenerate,
    TResult? Function(String message)? onError,
    TResult? Function()? onRefresh,
  }) {
    return onRefresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? loadFinished,
    TResult Function()? onGenerate,
    TResult Function(String message)? onError,
    TResult Function()? onRefresh,
    required TResult orElse(),
  }) {
    if (onRefresh != null) {
      return onRefresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_OnGenerate value) onGenerate,
    required TResult Function(_OnError value) onError,
    required TResult Function(ModifyProjectScreenSROnRefresh value) onRefresh,
  }) {
    return onRefresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_OnGenerate value)? onGenerate,
    TResult? Function(_OnError value)? onError,
    TResult? Function(ModifyProjectScreenSROnRefresh value)? onRefresh,
  }) {
    return onRefresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_OnGenerate value)? onGenerate,
    TResult Function(_OnError value)? onError,
    TResult Function(ModifyProjectScreenSROnRefresh value)? onRefresh,
    required TResult orElse(),
  }) {
    if (onRefresh != null) {
      return onRefresh(this);
    }
    return orElse();
  }
}

abstract class ModifyProjectScreenSROnRefresh implements ModifyProjectScreenSR {
  const factory ModifyProjectScreenSROnRefresh() =
      _$ModifyProjectScreenSROnRefresh;
}

/// @nodoc
mixin _$ModifyProjectScreenState {
  Config get config => throw _privateConstructorUsedError;
  int get currentTab => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, int currentTab) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, int currentTab)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, int currentTab)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ModifyProjectScreenStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModifyProjectScreenStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModifyProjectScreenStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ModifyProjectScreenStateCopyWith<ModifyProjectScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifyProjectScreenStateCopyWith<$Res> {
  factory $ModifyProjectScreenStateCopyWith(ModifyProjectScreenState value,
          $Res Function(ModifyProjectScreenState) then) =
      _$ModifyProjectScreenStateCopyWithImpl<$Res, ModifyProjectScreenState>;
  @useResult
  $Res call({Config config, int currentTab});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$ModifyProjectScreenStateCopyWithImpl<$Res,
        $Val extends ModifyProjectScreenState>
    implements $ModifyProjectScreenStateCopyWith<$Res> {
  _$ModifyProjectScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? currentTab = null,
  }) {
    return _then(_value.copyWith(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      currentTab: null == currentTab
          ? _value.currentTab
          : currentTab // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$ModifyProjectScreenStateDataCopyWith<$Res>
    implements $ModifyProjectScreenStateCopyWith<$Res> {
  factory _$$ModifyProjectScreenStateDataCopyWith(
          _$ModifyProjectScreenStateData value,
          $Res Function(_$ModifyProjectScreenStateData) then) =
      __$$ModifyProjectScreenStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config, int currentTab});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ModifyProjectScreenStateDataCopyWithImpl<$Res>
    extends _$ModifyProjectScreenStateCopyWithImpl<$Res,
        _$ModifyProjectScreenStateData>
    implements _$$ModifyProjectScreenStateDataCopyWith<$Res> {
  __$$ModifyProjectScreenStateDataCopyWithImpl(
      _$ModifyProjectScreenStateData _value,
      $Res Function(_$ModifyProjectScreenStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? currentTab = null,
  }) {
    return _then(_$ModifyProjectScreenStateData(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      currentTab: null == currentTab
          ? _value.currentTab
          : currentTab // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ModifyProjectScreenStateData implements ModifyProjectScreenStateData {
  const _$ModifyProjectScreenStateData(
      {required this.config, this.currentTab = 0});

  @override
  final Config config;
  @override
  @JsonKey()
  final int currentTab;

  @override
  String toString() {
    return 'ModifyProjectScreenState.data(config: $config, currentTab: $currentTab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyProjectScreenStateData &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.currentTab, currentTab) ||
                other.currentTab == currentTab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, currentTab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifyProjectScreenStateDataCopyWith<_$ModifyProjectScreenStateData>
      get copyWith => __$$ModifyProjectScreenStateDataCopyWithImpl<
          _$ModifyProjectScreenStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, int currentTab) data,
  }) {
    return data(config, currentTab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, int currentTab)? data,
  }) {
    return data?.call(config, currentTab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, int currentTab)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(config, currentTab);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ModifyProjectScreenStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModifyProjectScreenStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModifyProjectScreenStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class ModifyProjectScreenStateData
    implements ModifyProjectScreenState {
  const factory ModifyProjectScreenStateData(
      {required final Config config,
      final int currentTab}) = _$ModifyProjectScreenStateData;

  @override
  Config get config;
  @override
  int get currentTab;
  @override
  @JsonKey(ignore: true)
  _$$ModifyProjectScreenStateDataCopyWith<_$ModifyProjectScreenStateData>
      get copyWith => throw _privateConstructorUsedError;
}
