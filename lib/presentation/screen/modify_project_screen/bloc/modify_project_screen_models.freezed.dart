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
    required TResult Function(List<AppStyle> styles) getStyles,
    required TResult Function(int index) changeTab,
    required TResult Function() onGenerate,
    required TResult Function(String path) onParse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(List<AppStyle> styles)? getStyles,
    TResult? Function(int index)? changeTab,
    TResult? Function()? onGenerate,
    TResult? Function(String path)? onParse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(List<AppStyle> styles)? getStyles,
    TResult Function(int index)? changeTab,
    TResult Function()? onGenerate,
    TResult Function(String path)? onParse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ModifyProjectScreenEventInit value) init,
    required TResult Function(ModifyProjectScreenEventOnGetStyles value)
        getStyles,
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
    TResult? Function(ModifyProjectScreenEventOnGetStyles value)? getStyles,
    TResult? Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult? Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
    TResult? Function(ModifyProjectScreenEventOnParse value)? onParse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModifyProjectScreenEventInit value)? init,
    TResult Function(ModifyProjectScreenEventOnGetStyles value)? getStyles,
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
abstract class _$$ModifyProjectScreenEventInitImplCopyWith<$Res> {
  factory _$$ModifyProjectScreenEventInitImplCopyWith(
          _$ModifyProjectScreenEventInitImpl value,
          $Res Function(_$ModifyProjectScreenEventInitImpl) then) =
      __$$ModifyProjectScreenEventInitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ModifyProjectScreenEventInitImplCopyWithImpl<$Res>
    extends _$ModifyProjectScreenEventCopyWithImpl<$Res,
        _$ModifyProjectScreenEventInitImpl>
    implements _$$ModifyProjectScreenEventInitImplCopyWith<$Res> {
  __$$ModifyProjectScreenEventInitImplCopyWithImpl(
      _$ModifyProjectScreenEventInitImpl _value,
      $Res Function(_$ModifyProjectScreenEventInitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$ModifyProjectScreenEventInitImpl(
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

class _$ModifyProjectScreenEventInitImpl
    implements ModifyProjectScreenEventInit {
  const _$ModifyProjectScreenEventInitImpl({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'ModifyProjectScreenEvent.init(config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyProjectScreenEventInitImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifyProjectScreenEventInitImplCopyWith<
          _$ModifyProjectScreenEventInitImpl>
      get copyWith => __$$ModifyProjectScreenEventInitImplCopyWithImpl<
          _$ModifyProjectScreenEventInitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(List<AppStyle> styles) getStyles,
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
    TResult? Function(List<AppStyle> styles)? getStyles,
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
    TResult Function(List<AppStyle> styles)? getStyles,
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
    required TResult Function(ModifyProjectScreenEventOnGetStyles value)
        getStyles,
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
    TResult? Function(ModifyProjectScreenEventOnGetStyles value)? getStyles,
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
    TResult Function(ModifyProjectScreenEventOnGetStyles value)? getStyles,
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
      _$ModifyProjectScreenEventInitImpl;

  Config get config;
  @JsonKey(ignore: true)
  _$$ModifyProjectScreenEventInitImplCopyWith<
          _$ModifyProjectScreenEventInitImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ModifyProjectScreenEventOnGetStylesImplCopyWith<$Res> {
  factory _$$ModifyProjectScreenEventOnGetStylesImplCopyWith(
          _$ModifyProjectScreenEventOnGetStylesImpl value,
          $Res Function(_$ModifyProjectScreenEventOnGetStylesImpl) then) =
      __$$ModifyProjectScreenEventOnGetStylesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AppStyle> styles});
}

/// @nodoc
class __$$ModifyProjectScreenEventOnGetStylesImplCopyWithImpl<$Res>
    extends _$ModifyProjectScreenEventCopyWithImpl<$Res,
        _$ModifyProjectScreenEventOnGetStylesImpl>
    implements _$$ModifyProjectScreenEventOnGetStylesImplCopyWith<$Res> {
  __$$ModifyProjectScreenEventOnGetStylesImplCopyWithImpl(
      _$ModifyProjectScreenEventOnGetStylesImpl _value,
      $Res Function(_$ModifyProjectScreenEventOnGetStylesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? styles = null,
  }) {
    return _then(_$ModifyProjectScreenEventOnGetStylesImpl(
      styles: null == styles
          ? _value._styles
          : styles // ignore: cast_nullable_to_non_nullable
              as List<AppStyle>,
    ));
  }
}

/// @nodoc

class _$ModifyProjectScreenEventOnGetStylesImpl
    implements ModifyProjectScreenEventOnGetStyles {
  const _$ModifyProjectScreenEventOnGetStylesImpl(
      {required final List<AppStyle> styles})
      : _styles = styles;

  final List<AppStyle> _styles;
  @override
  List<AppStyle> get styles {
    if (_styles is EqualUnmodifiableListView) return _styles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_styles);
  }

  @override
  String toString() {
    return 'ModifyProjectScreenEvent.getStyles(styles: $styles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyProjectScreenEventOnGetStylesImpl &&
            const DeepCollectionEquality().equals(other._styles, _styles));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_styles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifyProjectScreenEventOnGetStylesImplCopyWith<
          _$ModifyProjectScreenEventOnGetStylesImpl>
      get copyWith => __$$ModifyProjectScreenEventOnGetStylesImplCopyWithImpl<
          _$ModifyProjectScreenEventOnGetStylesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(List<AppStyle> styles) getStyles,
    required TResult Function(int index) changeTab,
    required TResult Function() onGenerate,
    required TResult Function(String path) onParse,
  }) {
    return getStyles(styles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(List<AppStyle> styles)? getStyles,
    TResult? Function(int index)? changeTab,
    TResult? Function()? onGenerate,
    TResult? Function(String path)? onParse,
  }) {
    return getStyles?.call(styles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(List<AppStyle> styles)? getStyles,
    TResult Function(int index)? changeTab,
    TResult Function()? onGenerate,
    TResult Function(String path)? onParse,
    required TResult orElse(),
  }) {
    if (getStyles != null) {
      return getStyles(styles);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ModifyProjectScreenEventInit value) init,
    required TResult Function(ModifyProjectScreenEventOnGetStyles value)
        getStyles,
    required TResult Function(ModifyProjectScreenEventChangeTab value)
        changeTab,
    required TResult Function(ModifyProjectScreenEventOnGenerate value)
        onGenerate,
    required TResult Function(ModifyProjectScreenEventOnParse value) onParse,
  }) {
    return getStyles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ModifyProjectScreenEventInit value)? init,
    TResult? Function(ModifyProjectScreenEventOnGetStyles value)? getStyles,
    TResult? Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult? Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
    TResult? Function(ModifyProjectScreenEventOnParse value)? onParse,
  }) {
    return getStyles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ModifyProjectScreenEventInit value)? init,
    TResult Function(ModifyProjectScreenEventOnGetStyles value)? getStyles,
    TResult Function(ModifyProjectScreenEventChangeTab value)? changeTab,
    TResult Function(ModifyProjectScreenEventOnGenerate value)? onGenerate,
    TResult Function(ModifyProjectScreenEventOnParse value)? onParse,
    required TResult orElse(),
  }) {
    if (getStyles != null) {
      return getStyles(this);
    }
    return orElse();
  }
}

abstract class ModifyProjectScreenEventOnGetStyles
    implements ModifyProjectScreenEvent {
  const factory ModifyProjectScreenEventOnGetStyles(
          {required final List<AppStyle> styles}) =
      _$ModifyProjectScreenEventOnGetStylesImpl;

  List<AppStyle> get styles;
  @JsonKey(ignore: true)
  _$$ModifyProjectScreenEventOnGetStylesImplCopyWith<
          _$ModifyProjectScreenEventOnGetStylesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ModifyProjectScreenEventChangeTabImplCopyWith<$Res> {
  factory _$$ModifyProjectScreenEventChangeTabImplCopyWith(
          _$ModifyProjectScreenEventChangeTabImpl value,
          $Res Function(_$ModifyProjectScreenEventChangeTabImpl) then) =
      __$$ModifyProjectScreenEventChangeTabImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ModifyProjectScreenEventChangeTabImplCopyWithImpl<$Res>
    extends _$ModifyProjectScreenEventCopyWithImpl<$Res,
        _$ModifyProjectScreenEventChangeTabImpl>
    implements _$$ModifyProjectScreenEventChangeTabImplCopyWith<$Res> {
  __$$ModifyProjectScreenEventChangeTabImplCopyWithImpl(
      _$ModifyProjectScreenEventChangeTabImpl _value,
      $Res Function(_$ModifyProjectScreenEventChangeTabImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$ModifyProjectScreenEventChangeTabImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ModifyProjectScreenEventChangeTabImpl
    implements ModifyProjectScreenEventChangeTab {
  const _$ModifyProjectScreenEventChangeTabImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'ModifyProjectScreenEvent.changeTab(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyProjectScreenEventChangeTabImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifyProjectScreenEventChangeTabImplCopyWith<
          _$ModifyProjectScreenEventChangeTabImpl>
      get copyWith => __$$ModifyProjectScreenEventChangeTabImplCopyWithImpl<
          _$ModifyProjectScreenEventChangeTabImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(List<AppStyle> styles) getStyles,
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
    TResult? Function(List<AppStyle> styles)? getStyles,
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
    TResult Function(List<AppStyle> styles)? getStyles,
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
    required TResult Function(ModifyProjectScreenEventOnGetStyles value)
        getStyles,
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
    TResult? Function(ModifyProjectScreenEventOnGetStyles value)? getStyles,
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
    TResult Function(ModifyProjectScreenEventOnGetStyles value)? getStyles,
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
      _$ModifyProjectScreenEventChangeTabImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$ModifyProjectScreenEventChangeTabImplCopyWith<
          _$ModifyProjectScreenEventChangeTabImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ModifyProjectScreenEventOnGenerateImplCopyWith<$Res> {
  factory _$$ModifyProjectScreenEventOnGenerateImplCopyWith(
          _$ModifyProjectScreenEventOnGenerateImpl value,
          $Res Function(_$ModifyProjectScreenEventOnGenerateImpl) then) =
      __$$ModifyProjectScreenEventOnGenerateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ModifyProjectScreenEventOnGenerateImplCopyWithImpl<$Res>
    extends _$ModifyProjectScreenEventCopyWithImpl<$Res,
        _$ModifyProjectScreenEventOnGenerateImpl>
    implements _$$ModifyProjectScreenEventOnGenerateImplCopyWith<$Res> {
  __$$ModifyProjectScreenEventOnGenerateImplCopyWithImpl(
      _$ModifyProjectScreenEventOnGenerateImpl _value,
      $Res Function(_$ModifyProjectScreenEventOnGenerateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ModifyProjectScreenEventOnGenerateImpl
    implements ModifyProjectScreenEventOnGenerate {
  const _$ModifyProjectScreenEventOnGenerateImpl();

  @override
  String toString() {
    return 'ModifyProjectScreenEvent.onGenerate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyProjectScreenEventOnGenerateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(List<AppStyle> styles) getStyles,
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
    TResult? Function(List<AppStyle> styles)? getStyles,
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
    TResult Function(List<AppStyle> styles)? getStyles,
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
    required TResult Function(ModifyProjectScreenEventOnGetStyles value)
        getStyles,
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
    TResult? Function(ModifyProjectScreenEventOnGetStyles value)? getStyles,
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
    TResult Function(ModifyProjectScreenEventOnGetStyles value)? getStyles,
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
      _$ModifyProjectScreenEventOnGenerateImpl;
}

/// @nodoc
abstract class _$$ModifyProjectScreenEventOnParseImplCopyWith<$Res> {
  factory _$$ModifyProjectScreenEventOnParseImplCopyWith(
          _$ModifyProjectScreenEventOnParseImpl value,
          $Res Function(_$ModifyProjectScreenEventOnParseImpl) then) =
      __$$ModifyProjectScreenEventOnParseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$ModifyProjectScreenEventOnParseImplCopyWithImpl<$Res>
    extends _$ModifyProjectScreenEventCopyWithImpl<$Res,
        _$ModifyProjectScreenEventOnParseImpl>
    implements _$$ModifyProjectScreenEventOnParseImplCopyWith<$Res> {
  __$$ModifyProjectScreenEventOnParseImplCopyWithImpl(
      _$ModifyProjectScreenEventOnParseImpl _value,
      $Res Function(_$ModifyProjectScreenEventOnParseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$ModifyProjectScreenEventOnParseImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ModifyProjectScreenEventOnParseImpl
    implements ModifyProjectScreenEventOnParse {
  const _$ModifyProjectScreenEventOnParseImpl({required this.path});

  @override
  final String path;

  @override
  String toString() {
    return 'ModifyProjectScreenEvent.onParse(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyProjectScreenEventOnParseImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifyProjectScreenEventOnParseImplCopyWith<
          _$ModifyProjectScreenEventOnParseImpl>
      get copyWith => __$$ModifyProjectScreenEventOnParseImplCopyWithImpl<
          _$ModifyProjectScreenEventOnParseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(List<AppStyle> styles) getStyles,
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
    TResult? Function(List<AppStyle> styles)? getStyles,
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
    TResult Function(List<AppStyle> styles)? getStyles,
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
    required TResult Function(ModifyProjectScreenEventOnGetStyles value)
        getStyles,
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
    TResult? Function(ModifyProjectScreenEventOnGetStyles value)? getStyles,
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
    TResult Function(ModifyProjectScreenEventOnGetStyles value)? getStyles,
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
      _$ModifyProjectScreenEventOnParseImpl;

  String get path;
  @JsonKey(ignore: true)
  _$$ModifyProjectScreenEventOnParseImplCopyWith<
          _$ModifyProjectScreenEventOnParseImpl>
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
abstract class _$$LoadFinishedImplCopyWith<$Res> {
  factory _$$LoadFinishedImplCopyWith(
          _$LoadFinishedImpl value, $Res Function(_$LoadFinishedImpl) then) =
      __$$LoadFinishedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$LoadFinishedImplCopyWithImpl<$Res>
    extends _$ModifyProjectScreenSRCopyWithImpl<$Res, _$LoadFinishedImpl>
    implements _$$LoadFinishedImplCopyWith<$Res> {
  __$$LoadFinishedImplCopyWithImpl(
      _$LoadFinishedImpl _value, $Res Function(_$LoadFinishedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$LoadFinishedImpl(
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

class _$LoadFinishedImpl implements _LoadFinished {
  const _$LoadFinishedImpl({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'ModifyProjectScreenSR.loadFinished(config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFinishedImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFinishedImplCopyWith<_$LoadFinishedImpl> get copyWith =>
      __$$LoadFinishedImplCopyWithImpl<_$LoadFinishedImpl>(this, _$identity);

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
  const factory _LoadFinished({required final Config config}) =
      _$LoadFinishedImpl;

  Config get config;
  @JsonKey(ignore: true)
  _$$LoadFinishedImplCopyWith<_$LoadFinishedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnGenerateImplCopyWith<$Res> {
  factory _$$OnGenerateImplCopyWith(
          _$OnGenerateImpl value, $Res Function(_$OnGenerateImpl) then) =
      __$$OnGenerateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnGenerateImplCopyWithImpl<$Res>
    extends _$ModifyProjectScreenSRCopyWithImpl<$Res, _$OnGenerateImpl>
    implements _$$OnGenerateImplCopyWith<$Res> {
  __$$OnGenerateImplCopyWithImpl(
      _$OnGenerateImpl _value, $Res Function(_$OnGenerateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnGenerateImpl implements _OnGenerate {
  const _$OnGenerateImpl();

  @override
  String toString() {
    return 'ModifyProjectScreenSR.onGenerate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnGenerateImpl);
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
  const factory _OnGenerate() = _$OnGenerateImpl;
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
    extends _$ModifyProjectScreenSRCopyWithImpl<$Res, _$OnErrorImpl>
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
    return 'ModifyProjectScreenSR.onError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
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
  const factory _OnError({required final String message}) = _$OnErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$OnErrorImplCopyWith<_$OnErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ModifyProjectScreenSROnRefreshImplCopyWith<$Res> {
  factory _$$ModifyProjectScreenSROnRefreshImplCopyWith(
          _$ModifyProjectScreenSROnRefreshImpl value,
          $Res Function(_$ModifyProjectScreenSROnRefreshImpl) then) =
      __$$ModifyProjectScreenSROnRefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ModifyProjectScreenSROnRefreshImplCopyWithImpl<$Res>
    extends _$ModifyProjectScreenSRCopyWithImpl<$Res,
        _$ModifyProjectScreenSROnRefreshImpl>
    implements _$$ModifyProjectScreenSROnRefreshImplCopyWith<$Res> {
  __$$ModifyProjectScreenSROnRefreshImplCopyWithImpl(
      _$ModifyProjectScreenSROnRefreshImpl _value,
      $Res Function(_$ModifyProjectScreenSROnRefreshImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ModifyProjectScreenSROnRefreshImpl
    implements ModifyProjectScreenSROnRefresh {
  const _$ModifyProjectScreenSROnRefreshImpl();

  @override
  String toString() {
    return 'ModifyProjectScreenSR.onRefresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyProjectScreenSROnRefreshImpl);
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
      _$ModifyProjectScreenSROnRefreshImpl;
}

/// @nodoc
mixin _$ModifyProjectScreenState {
  Config get config => throw _privateConstructorUsedError;
  int get currentTab => throw _privateConstructorUsedError;
  bool get configured => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, int currentTab, bool configured)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, int currentTab, bool configured)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, int currentTab, bool configured)? data,
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
  $Res call({Config config, int currentTab, bool configured});

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
    Object? configured = null,
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
      configured: null == configured
          ? _value.configured
          : configured // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$ModifyProjectScreenStateDataImplCopyWith<$Res>
    implements $ModifyProjectScreenStateCopyWith<$Res> {
  factory _$$ModifyProjectScreenStateDataImplCopyWith(
          _$ModifyProjectScreenStateDataImpl value,
          $Res Function(_$ModifyProjectScreenStateDataImpl) then) =
      __$$ModifyProjectScreenStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config, int currentTab, bool configured});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ModifyProjectScreenStateDataImplCopyWithImpl<$Res>
    extends _$ModifyProjectScreenStateCopyWithImpl<$Res,
        _$ModifyProjectScreenStateDataImpl>
    implements _$$ModifyProjectScreenStateDataImplCopyWith<$Res> {
  __$$ModifyProjectScreenStateDataImplCopyWithImpl(
      _$ModifyProjectScreenStateDataImpl _value,
      $Res Function(_$ModifyProjectScreenStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? currentTab = null,
    Object? configured = null,
  }) {
    return _then(_$ModifyProjectScreenStateDataImpl(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      currentTab: null == currentTab
          ? _value.currentTab
          : currentTab // ignore: cast_nullable_to_non_nullable
              as int,
      configured: null == configured
          ? _value.configured
          : configured // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ModifyProjectScreenStateDataImpl
    implements ModifyProjectScreenStateData {
  const _$ModifyProjectScreenStateDataImpl(
      {required this.config, this.currentTab = 0, this.configured = false});

  @override
  final Config config;
  @override
  @JsonKey()
  final int currentTab;
  @override
  @JsonKey()
  final bool configured;

  @override
  String toString() {
    return 'ModifyProjectScreenState.data(config: $config, currentTab: $currentTab, configured: $configured)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyProjectScreenStateDataImpl &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.currentTab, currentTab) ||
                other.currentTab == currentTab) &&
            (identical(other.configured, configured) ||
                other.configured == configured));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, currentTab, configured);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifyProjectScreenStateDataImplCopyWith<
          _$ModifyProjectScreenStateDataImpl>
      get copyWith => __$$ModifyProjectScreenStateDataImplCopyWithImpl<
          _$ModifyProjectScreenStateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, int currentTab, bool configured)
        data,
  }) {
    return data(config, currentTab, configured);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, int currentTab, bool configured)? data,
  }) {
    return data?.call(config, currentTab, configured);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, int currentTab, bool configured)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(config, currentTab, configured);
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
      final int currentTab,
      final bool configured}) = _$ModifyProjectScreenStateDataImpl;

  @override
  Config get config;
  @override
  int get currentTab;
  @override
  bool get configured;
  @override
  @JsonKey(ignore: true)
  _$$ModifyProjectScreenStateDataImplCopyWith<
          _$ModifyProjectScreenStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
