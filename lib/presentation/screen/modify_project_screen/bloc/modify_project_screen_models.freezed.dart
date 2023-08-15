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
    required TResult Function(Set<Screen> screens) onScreensChange,
    required TResult Function() onGenerate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(int index)? changeTab,
    TResult? Function(Set<Screen> screens)? onScreensChange,
    TResult? Function()? onGenerate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(int index)? changeTab,
    TResult Function(Set<Screen> screens)? onScreensChange,
    TResult Function()? onGenerate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ModifyProjectScreenEventInit value) init,
    required TResult Function(ModifyProjectScreenEventChangeTab value)
        changeTab,
    required TResult Function(ModifyProjectScreenEventOnScreensChange value)
        onScreensChange,
    required TResult Function(ModifyProjectScreenEventOnGenerate value)
        onGenerate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModifyProjectScreenEventInit value)? init,
    TResult? Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult? Function(ModifyProjectScreenEventOnScreensChange value)?
        onScreensChange,
    TResult? Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModifyProjectScreenEventInit value)? init,
    TResult Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult Function(ModifyProjectScreenEventOnScreensChange value)?
        onScreensChange,
    TResult Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
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
    required TResult Function(Set<Screen> screens) onScreensChange,
    required TResult Function() onGenerate,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(int index)? changeTab,
    TResult? Function(Set<Screen> screens)? onScreensChange,
    TResult? Function()? onGenerate,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(int index)? changeTab,
    TResult Function(Set<Screen> screens)? onScreensChange,
    TResult Function()? onGenerate,
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
    required TResult Function(ModifyProjectScreenEventOnScreensChange value)
        onScreensChange,
    required TResult Function(ModifyProjectScreenEventOnGenerate value)
        onGenerate,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModifyProjectScreenEventInit value)? init,
    TResult? Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult? Function(ModifyProjectScreenEventOnScreensChange value)?
        onScreensChange,
    TResult? Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModifyProjectScreenEventInit value)? init,
    TResult Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult Function(ModifyProjectScreenEventOnScreensChange value)?
        onScreensChange,
    TResult Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
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
    required TResult Function(Set<Screen> screens) onScreensChange,
    required TResult Function() onGenerate,
  }) {
    return changeTab(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(int index)? changeTab,
    TResult? Function(Set<Screen> screens)? onScreensChange,
    TResult? Function()? onGenerate,
  }) {
    return changeTab?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(int index)? changeTab,
    TResult Function(Set<Screen> screens)? onScreensChange,
    TResult Function()? onGenerate,
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
    required TResult Function(ModifyProjectScreenEventOnScreensChange value)
        onScreensChange,
    required TResult Function(ModifyProjectScreenEventOnGenerate value)
        onGenerate,
  }) {
    return changeTab(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModifyProjectScreenEventInit value)? init,
    TResult? Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult? Function(ModifyProjectScreenEventOnScreensChange value)?
        onScreensChange,
    TResult? Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
  }) {
    return changeTab?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModifyProjectScreenEventInit value)? init,
    TResult Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult Function(ModifyProjectScreenEventOnScreensChange value)?
        onScreensChange,
    TResult Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
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
abstract class _$$ModifyProjectScreenEventOnScreensChangeCopyWith<$Res> {
  factory _$$ModifyProjectScreenEventOnScreensChangeCopyWith(
          _$ModifyProjectScreenEventOnScreensChange value,
          $Res Function(_$ModifyProjectScreenEventOnScreensChange) then) =
      __$$ModifyProjectScreenEventOnScreensChangeCopyWithImpl<$Res>;
  @useResult
  $Res call({Set<Screen> screens});
}

/// @nodoc
class __$$ModifyProjectScreenEventOnScreensChangeCopyWithImpl<$Res>
    extends _$ModifyProjectScreenEventCopyWithImpl<$Res,
        _$ModifyProjectScreenEventOnScreensChange>
    implements _$$ModifyProjectScreenEventOnScreensChangeCopyWith<$Res> {
  __$$ModifyProjectScreenEventOnScreensChangeCopyWithImpl(
      _$ModifyProjectScreenEventOnScreensChange _value,
      $Res Function(_$ModifyProjectScreenEventOnScreensChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screens = null,
  }) {
    return _then(_$ModifyProjectScreenEventOnScreensChange(
      screens: null == screens
          ? _value._screens
          : screens // ignore: cast_nullable_to_non_nullable
              as Set<Screen>,
    ));
  }
}

/// @nodoc

class _$ModifyProjectScreenEventOnScreensChange
    implements ModifyProjectScreenEventOnScreensChange {
  const _$ModifyProjectScreenEventOnScreensChange(
      {required final Set<Screen> screens})
      : _screens = screens;

  final Set<Screen> _screens;
  @override
  Set<Screen> get screens {
    if (_screens is EqualUnmodifiableSetView) return _screens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_screens);
  }

  @override
  String toString() {
    return 'ModifyProjectScreenEvent.onScreensChange(screens: $screens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyProjectScreenEventOnScreensChange &&
            const DeepCollectionEquality().equals(other._screens, _screens));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_screens));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifyProjectScreenEventOnScreensChangeCopyWith<
          _$ModifyProjectScreenEventOnScreensChange>
      get copyWith => __$$ModifyProjectScreenEventOnScreensChangeCopyWithImpl<
          _$ModifyProjectScreenEventOnScreensChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(int index) changeTab,
    required TResult Function(Set<Screen> screens) onScreensChange,
    required TResult Function() onGenerate,
  }) {
    return onScreensChange(screens);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(int index)? changeTab,
    TResult? Function(Set<Screen> screens)? onScreensChange,
    TResult? Function()? onGenerate,
  }) {
    return onScreensChange?.call(screens);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(int index)? changeTab,
    TResult Function(Set<Screen> screens)? onScreensChange,
    TResult Function()? onGenerate,
    required TResult orElse(),
  }) {
    if (onScreensChange != null) {
      return onScreensChange(screens);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ModifyProjectScreenEventInit value) init,
    required TResult Function(ModifyProjectScreenEventChangeTab value)
        changeTab,
    required TResult Function(ModifyProjectScreenEventOnScreensChange value)
        onScreensChange,
    required TResult Function(ModifyProjectScreenEventOnGenerate value)
        onGenerate,
  }) {
    return onScreensChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModifyProjectScreenEventInit value)? init,
    TResult? Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult? Function(ModifyProjectScreenEventOnScreensChange value)?
        onScreensChange,
    TResult? Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
  }) {
    return onScreensChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModifyProjectScreenEventInit value)? init,
    TResult Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult Function(ModifyProjectScreenEventOnScreensChange value)?
        onScreensChange,
    TResult Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
    required TResult orElse(),
  }) {
    if (onScreensChange != null) {
      return onScreensChange(this);
    }
    return orElse();
  }
}

abstract class ModifyProjectScreenEventOnScreensChange
    implements ModifyProjectScreenEvent {
  const factory ModifyProjectScreenEventOnScreensChange(
          {required final Set<Screen> screens}) =
      _$ModifyProjectScreenEventOnScreensChange;

  Set<Screen> get screens;
  @JsonKey(ignore: true)
  _$$ModifyProjectScreenEventOnScreensChangeCopyWith<
          _$ModifyProjectScreenEventOnScreensChange>
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
    required TResult Function(Set<Screen> screens) onScreensChange,
    required TResult Function() onGenerate,
  }) {
    return onGenerate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(int index)? changeTab,
    TResult? Function(Set<Screen> screens)? onScreensChange,
    TResult? Function()? onGenerate,
  }) {
    return onGenerate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(int index)? changeTab,
    TResult Function(Set<Screen> screens)? onScreensChange,
    TResult Function()? onGenerate,
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
    required TResult Function(ModifyProjectScreenEventOnScreensChange value)
        onScreensChange,
    required TResult Function(ModifyProjectScreenEventOnGenerate value)
        onGenerate,
  }) {
    return onGenerate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModifyProjectScreenEventInit value)? init,
    TResult? Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult? Function(ModifyProjectScreenEventOnScreensChange value)?
        onScreensChange,
    TResult? Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
  }) {
    return onGenerate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModifyProjectScreenEventInit value)? init,
    TResult Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult Function(ModifyProjectScreenEventOnScreensChange value)?
        onScreensChange,
    TResult Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
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
mixin _$ModifyProjectScreenSR {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) loadFinished,
    required TResult Function() onGenerate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? loadFinished,
    TResult? Function()? onGenerate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? loadFinished,
    TResult Function()? onGenerate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_OnGenerate value) onGenerate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_OnGenerate value)? onGenerate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_OnGenerate value)? onGenerate,
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
  }) {
    return loadFinished(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? loadFinished,
    TResult? Function()? onGenerate,
  }) {
    return loadFinished?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? loadFinished,
    TResult Function()? onGenerate,
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
  }) {
    return loadFinished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_OnGenerate value)? onGenerate,
  }) {
    return loadFinished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_OnGenerate value)? onGenerate,
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
  }) {
    return onGenerate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? loadFinished,
    TResult? Function()? onGenerate,
  }) {
    return onGenerate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? loadFinished,
    TResult Function()? onGenerate,
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
  }) {
    return onGenerate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_OnGenerate value)? onGenerate,
  }) {
    return onGenerate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_OnGenerate value)? onGenerate,
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
