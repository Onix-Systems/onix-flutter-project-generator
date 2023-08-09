// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_components_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataComponentsScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() stateUpdate,
    required TResult Function(Source source) addSource,
    required TResult Function(Source source) deleteSource,
    required TResult Function(DataComponent dataComponent, Source? source)
        addDataComponent,
    required TResult Function(DataComponent entity, Source? source)
        deleteDataComponent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? stateUpdate,
    TResult? Function(Source source)? addSource,
    TResult? Function(Source source)? deleteSource,
    TResult? Function(DataComponent dataComponent, Source? source)?
        addDataComponent,
    TResult? Function(DataComponent entity, Source? source)?
        deleteDataComponent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? stateUpdate,
    TResult Function(Source source)? addSource,
    TResult Function(Source source)? deleteSource,
    TResult Function(DataComponent dataComponent, Source? source)?
        addDataComponent,
    TResult Function(DataComponent entity, Source? source)? deleteDataComponent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenEventInit value) init,
    required TResult Function(DataComponentsScreenEventStateUpdate value)
        stateUpdate,
    required TResult Function(DataComponentsScreenEventAddSource value)
        addSource,
    required TResult Function(DataComponentsScreenEventDeleteSource value)
        deleteSource,
    required TResult Function(DataComponentsScreenEventAddDataComponent value)
        addDataComponent,
    required TResult Function(
            DataComponentsScreenEventDeleteDataComponent value)
        deleteDataComponent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenEventInit value)? init,
    TResult? Function(DataComponentsScreenEventStateUpdate value)? stateUpdate,
    TResult? Function(DataComponentsScreenEventAddSource value)? addSource,
    TResult? Function(DataComponentsScreenEventDeleteSource value)?
        deleteSource,
    TResult? Function(DataComponentsScreenEventAddDataComponent value)?
        addDataComponent,
    TResult? Function(DataComponentsScreenEventDeleteDataComponent value)?
        deleteDataComponent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenEventInit value)? init,
    TResult Function(DataComponentsScreenEventStateUpdate value)? stateUpdate,
    TResult Function(DataComponentsScreenEventAddSource value)? addSource,
    TResult Function(DataComponentsScreenEventDeleteSource value)? deleteSource,
    TResult Function(DataComponentsScreenEventAddDataComponent value)?
        addDataComponent,
    TResult Function(DataComponentsScreenEventDeleteDataComponent value)?
        deleteDataComponent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataComponentsScreenEventCopyWith<$Res> {
  factory $DataComponentsScreenEventCopyWith(DataComponentsScreenEvent value,
          $Res Function(DataComponentsScreenEvent) then) =
      _$DataComponentsScreenEventCopyWithImpl<$Res, DataComponentsScreenEvent>;
}

/// @nodoc
class _$DataComponentsScreenEventCopyWithImpl<$Res,
        $Val extends DataComponentsScreenEvent>
    implements $DataComponentsScreenEventCopyWith<$Res> {
  _$DataComponentsScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DataComponentsScreenEventInitCopyWith<$Res> {
  factory _$$DataComponentsScreenEventInitCopyWith(
          _$DataComponentsScreenEventInit value,
          $Res Function(_$DataComponentsScreenEventInit) then) =
      __$$DataComponentsScreenEventInitCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$DataComponentsScreenEventInitCopyWithImpl<$Res>
    extends _$DataComponentsScreenEventCopyWithImpl<$Res,
        _$DataComponentsScreenEventInit>
    implements _$$DataComponentsScreenEventInitCopyWith<$Res> {
  __$$DataComponentsScreenEventInitCopyWithImpl(
      _$DataComponentsScreenEventInit _value,
      $Res Function(_$DataComponentsScreenEventInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$DataComponentsScreenEventInit(
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

class _$DataComponentsScreenEventInit implements DataComponentsScreenEventInit {
  const _$DataComponentsScreenEventInit({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'DataComponentsScreenEvent.init(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataComponentsScreenEventInit &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataComponentsScreenEventInitCopyWith<_$DataComponentsScreenEventInit>
      get copyWith => __$$DataComponentsScreenEventInitCopyWithImpl<
          _$DataComponentsScreenEventInit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() stateUpdate,
    required TResult Function(Source source) addSource,
    required TResult Function(Source source) deleteSource,
    required TResult Function(DataComponent dataComponent, Source? source)
        addDataComponent,
    required TResult Function(DataComponent entity, Source? source)
        deleteDataComponent,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? stateUpdate,
    TResult? Function(Source source)? addSource,
    TResult? Function(Source source)? deleteSource,
    TResult? Function(DataComponent dataComponent, Source? source)?
        addDataComponent,
    TResult? Function(DataComponent entity, Source? source)?
        deleteDataComponent,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? stateUpdate,
    TResult Function(Source source)? addSource,
    TResult Function(Source source)? deleteSource,
    TResult Function(DataComponent dataComponent, Source? source)?
        addDataComponent,
    TResult Function(DataComponent entity, Source? source)? deleteDataComponent,
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
    required TResult Function(DataComponentsScreenEventInit value) init,
    required TResult Function(DataComponentsScreenEventStateUpdate value)
        stateUpdate,
    required TResult Function(DataComponentsScreenEventAddSource value)
        addSource,
    required TResult Function(DataComponentsScreenEventDeleteSource value)
        deleteSource,
    required TResult Function(DataComponentsScreenEventAddDataComponent value)
        addDataComponent,
    required TResult Function(
            DataComponentsScreenEventDeleteDataComponent value)
        deleteDataComponent,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenEventInit value)? init,
    TResult? Function(DataComponentsScreenEventStateUpdate value)? stateUpdate,
    TResult? Function(DataComponentsScreenEventAddSource value)? addSource,
    TResult? Function(DataComponentsScreenEventDeleteSource value)?
        deleteSource,
    TResult? Function(DataComponentsScreenEventAddDataComponent value)?
        addDataComponent,
    TResult? Function(DataComponentsScreenEventDeleteDataComponent value)?
        deleteDataComponent,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenEventInit value)? init,
    TResult Function(DataComponentsScreenEventStateUpdate value)? stateUpdate,
    TResult Function(DataComponentsScreenEventAddSource value)? addSource,
    TResult Function(DataComponentsScreenEventDeleteSource value)? deleteSource,
    TResult Function(DataComponentsScreenEventAddDataComponent value)?
        addDataComponent,
    TResult Function(DataComponentsScreenEventDeleteDataComponent value)?
        deleteDataComponent,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class DataComponentsScreenEventInit
    implements DataComponentsScreenEvent {
  const factory DataComponentsScreenEventInit({required final Config config}) =
      _$DataComponentsScreenEventInit;

  Config get config;
  @JsonKey(ignore: true)
  _$$DataComponentsScreenEventInitCopyWith<_$DataComponentsScreenEventInit>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataComponentsScreenEventStateUpdateCopyWith<$Res> {
  factory _$$DataComponentsScreenEventStateUpdateCopyWith(
          _$DataComponentsScreenEventStateUpdate value,
          $Res Function(_$DataComponentsScreenEventStateUpdate) then) =
      __$$DataComponentsScreenEventStateUpdateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DataComponentsScreenEventStateUpdateCopyWithImpl<$Res>
    extends _$DataComponentsScreenEventCopyWithImpl<$Res,
        _$DataComponentsScreenEventStateUpdate>
    implements _$$DataComponentsScreenEventStateUpdateCopyWith<$Res> {
  __$$DataComponentsScreenEventStateUpdateCopyWithImpl(
      _$DataComponentsScreenEventStateUpdate _value,
      $Res Function(_$DataComponentsScreenEventStateUpdate) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DataComponentsScreenEventStateUpdate
    implements DataComponentsScreenEventStateUpdate {
  const _$DataComponentsScreenEventStateUpdate();

  @override
  String toString() {
    return 'DataComponentsScreenEvent.stateUpdate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataComponentsScreenEventStateUpdate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() stateUpdate,
    required TResult Function(Source source) addSource,
    required TResult Function(Source source) deleteSource,
    required TResult Function(DataComponent dataComponent, Source? source)
        addDataComponent,
    required TResult Function(DataComponent entity, Source? source)
        deleteDataComponent,
  }) {
    return stateUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? stateUpdate,
    TResult? Function(Source source)? addSource,
    TResult? Function(Source source)? deleteSource,
    TResult? Function(DataComponent dataComponent, Source? source)?
        addDataComponent,
    TResult? Function(DataComponent entity, Source? source)?
        deleteDataComponent,
  }) {
    return stateUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? stateUpdate,
    TResult Function(Source source)? addSource,
    TResult Function(Source source)? deleteSource,
    TResult Function(DataComponent dataComponent, Source? source)?
        addDataComponent,
    TResult Function(DataComponent entity, Source? source)? deleteDataComponent,
    required TResult orElse(),
  }) {
    if (stateUpdate != null) {
      return stateUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenEventInit value) init,
    required TResult Function(DataComponentsScreenEventStateUpdate value)
        stateUpdate,
    required TResult Function(DataComponentsScreenEventAddSource value)
        addSource,
    required TResult Function(DataComponentsScreenEventDeleteSource value)
        deleteSource,
    required TResult Function(DataComponentsScreenEventAddDataComponent value)
        addDataComponent,
    required TResult Function(
            DataComponentsScreenEventDeleteDataComponent value)
        deleteDataComponent,
  }) {
    return stateUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenEventInit value)? init,
    TResult? Function(DataComponentsScreenEventStateUpdate value)? stateUpdate,
    TResult? Function(DataComponentsScreenEventAddSource value)? addSource,
    TResult? Function(DataComponentsScreenEventDeleteSource value)?
        deleteSource,
    TResult? Function(DataComponentsScreenEventAddDataComponent value)?
        addDataComponent,
    TResult? Function(DataComponentsScreenEventDeleteDataComponent value)?
        deleteDataComponent,
  }) {
    return stateUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenEventInit value)? init,
    TResult Function(DataComponentsScreenEventStateUpdate value)? stateUpdate,
    TResult Function(DataComponentsScreenEventAddSource value)? addSource,
    TResult Function(DataComponentsScreenEventDeleteSource value)? deleteSource,
    TResult Function(DataComponentsScreenEventAddDataComponent value)?
        addDataComponent,
    TResult Function(DataComponentsScreenEventDeleteDataComponent value)?
        deleteDataComponent,
    required TResult orElse(),
  }) {
    if (stateUpdate != null) {
      return stateUpdate(this);
    }
    return orElse();
  }
}

abstract class DataComponentsScreenEventStateUpdate
    implements DataComponentsScreenEvent {
  const factory DataComponentsScreenEventStateUpdate() =
      _$DataComponentsScreenEventStateUpdate;
}

/// @nodoc
abstract class _$$DataComponentsScreenEventAddSourceCopyWith<$Res> {
  factory _$$DataComponentsScreenEventAddSourceCopyWith(
          _$DataComponentsScreenEventAddSource value,
          $Res Function(_$DataComponentsScreenEventAddSource) then) =
      __$$DataComponentsScreenEventAddSourceCopyWithImpl<$Res>;
  @useResult
  $Res call({Source source});
}

/// @nodoc
class __$$DataComponentsScreenEventAddSourceCopyWithImpl<$Res>
    extends _$DataComponentsScreenEventCopyWithImpl<$Res,
        _$DataComponentsScreenEventAddSource>
    implements _$$DataComponentsScreenEventAddSourceCopyWith<$Res> {
  __$$DataComponentsScreenEventAddSourceCopyWithImpl(
      _$DataComponentsScreenEventAddSource _value,
      $Res Function(_$DataComponentsScreenEventAddSource) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_$DataComponentsScreenEventAddSource(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source,
    ));
  }
}

/// @nodoc

class _$DataComponentsScreenEventAddSource
    implements DataComponentsScreenEventAddSource {
  const _$DataComponentsScreenEventAddSource({required this.source});

  @override
  final Source source;

  @override
  String toString() {
    return 'DataComponentsScreenEvent.addSource(source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataComponentsScreenEventAddSource &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataComponentsScreenEventAddSourceCopyWith<
          _$DataComponentsScreenEventAddSource>
      get copyWith => __$$DataComponentsScreenEventAddSourceCopyWithImpl<
          _$DataComponentsScreenEventAddSource>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() stateUpdate,
    required TResult Function(Source source) addSource,
    required TResult Function(Source source) deleteSource,
    required TResult Function(DataComponent dataComponent, Source? source)
        addDataComponent,
    required TResult Function(DataComponent entity, Source? source)
        deleteDataComponent,
  }) {
    return addSource(source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? stateUpdate,
    TResult? Function(Source source)? addSource,
    TResult? Function(Source source)? deleteSource,
    TResult? Function(DataComponent dataComponent, Source? source)?
        addDataComponent,
    TResult? Function(DataComponent entity, Source? source)?
        deleteDataComponent,
  }) {
    return addSource?.call(source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? stateUpdate,
    TResult Function(Source source)? addSource,
    TResult Function(Source source)? deleteSource,
    TResult Function(DataComponent dataComponent, Source? source)?
        addDataComponent,
    TResult Function(DataComponent entity, Source? source)? deleteDataComponent,
    required TResult orElse(),
  }) {
    if (addSource != null) {
      return addSource(source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenEventInit value) init,
    required TResult Function(DataComponentsScreenEventStateUpdate value)
        stateUpdate,
    required TResult Function(DataComponentsScreenEventAddSource value)
        addSource,
    required TResult Function(DataComponentsScreenEventDeleteSource value)
        deleteSource,
    required TResult Function(DataComponentsScreenEventAddDataComponent value)
        addDataComponent,
    required TResult Function(
            DataComponentsScreenEventDeleteDataComponent value)
        deleteDataComponent,
  }) {
    return addSource(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenEventInit value)? init,
    TResult? Function(DataComponentsScreenEventStateUpdate value)? stateUpdate,
    TResult? Function(DataComponentsScreenEventAddSource value)? addSource,
    TResult? Function(DataComponentsScreenEventDeleteSource value)?
        deleteSource,
    TResult? Function(DataComponentsScreenEventAddDataComponent value)?
        addDataComponent,
    TResult? Function(DataComponentsScreenEventDeleteDataComponent value)?
        deleteDataComponent,
  }) {
    return addSource?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenEventInit value)? init,
    TResult Function(DataComponentsScreenEventStateUpdate value)? stateUpdate,
    TResult Function(DataComponentsScreenEventAddSource value)? addSource,
    TResult Function(DataComponentsScreenEventDeleteSource value)? deleteSource,
    TResult Function(DataComponentsScreenEventAddDataComponent value)?
        addDataComponent,
    TResult Function(DataComponentsScreenEventDeleteDataComponent value)?
        deleteDataComponent,
    required TResult orElse(),
  }) {
    if (addSource != null) {
      return addSource(this);
    }
    return orElse();
  }
}

abstract class DataComponentsScreenEventAddSource
    implements DataComponentsScreenEvent {
  const factory DataComponentsScreenEventAddSource(
      {required final Source source}) = _$DataComponentsScreenEventAddSource;

  Source get source;
  @JsonKey(ignore: true)
  _$$DataComponentsScreenEventAddSourceCopyWith<
          _$DataComponentsScreenEventAddSource>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataComponentsScreenEventDeleteSourceCopyWith<$Res> {
  factory _$$DataComponentsScreenEventDeleteSourceCopyWith(
          _$DataComponentsScreenEventDeleteSource value,
          $Res Function(_$DataComponentsScreenEventDeleteSource) then) =
      __$$DataComponentsScreenEventDeleteSourceCopyWithImpl<$Res>;
  @useResult
  $Res call({Source source});
}

/// @nodoc
class __$$DataComponentsScreenEventDeleteSourceCopyWithImpl<$Res>
    extends _$DataComponentsScreenEventCopyWithImpl<$Res,
        _$DataComponentsScreenEventDeleteSource>
    implements _$$DataComponentsScreenEventDeleteSourceCopyWith<$Res> {
  __$$DataComponentsScreenEventDeleteSourceCopyWithImpl(
      _$DataComponentsScreenEventDeleteSource _value,
      $Res Function(_$DataComponentsScreenEventDeleteSource) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_$DataComponentsScreenEventDeleteSource(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source,
    ));
  }
}

/// @nodoc

class _$DataComponentsScreenEventDeleteSource
    implements DataComponentsScreenEventDeleteSource {
  const _$DataComponentsScreenEventDeleteSource({required this.source});

  @override
  final Source source;

  @override
  String toString() {
    return 'DataComponentsScreenEvent.deleteSource(source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataComponentsScreenEventDeleteSource &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataComponentsScreenEventDeleteSourceCopyWith<
          _$DataComponentsScreenEventDeleteSource>
      get copyWith => __$$DataComponentsScreenEventDeleteSourceCopyWithImpl<
          _$DataComponentsScreenEventDeleteSource>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() stateUpdate,
    required TResult Function(Source source) addSource,
    required TResult Function(Source source) deleteSource,
    required TResult Function(DataComponent dataComponent, Source? source)
        addDataComponent,
    required TResult Function(DataComponent entity, Source? source)
        deleteDataComponent,
  }) {
    return deleteSource(source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? stateUpdate,
    TResult? Function(Source source)? addSource,
    TResult? Function(Source source)? deleteSource,
    TResult? Function(DataComponent dataComponent, Source? source)?
        addDataComponent,
    TResult? Function(DataComponent entity, Source? source)?
        deleteDataComponent,
  }) {
    return deleteSource?.call(source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? stateUpdate,
    TResult Function(Source source)? addSource,
    TResult Function(Source source)? deleteSource,
    TResult Function(DataComponent dataComponent, Source? source)?
        addDataComponent,
    TResult Function(DataComponent entity, Source? source)? deleteDataComponent,
    required TResult orElse(),
  }) {
    if (deleteSource != null) {
      return deleteSource(source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenEventInit value) init,
    required TResult Function(DataComponentsScreenEventStateUpdate value)
        stateUpdate,
    required TResult Function(DataComponentsScreenEventAddSource value)
        addSource,
    required TResult Function(DataComponentsScreenEventDeleteSource value)
        deleteSource,
    required TResult Function(DataComponentsScreenEventAddDataComponent value)
        addDataComponent,
    required TResult Function(
            DataComponentsScreenEventDeleteDataComponent value)
        deleteDataComponent,
  }) {
    return deleteSource(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenEventInit value)? init,
    TResult? Function(DataComponentsScreenEventStateUpdate value)? stateUpdate,
    TResult? Function(DataComponentsScreenEventAddSource value)? addSource,
    TResult? Function(DataComponentsScreenEventDeleteSource value)?
        deleteSource,
    TResult? Function(DataComponentsScreenEventAddDataComponent value)?
        addDataComponent,
    TResult? Function(DataComponentsScreenEventDeleteDataComponent value)?
        deleteDataComponent,
  }) {
    return deleteSource?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenEventInit value)? init,
    TResult Function(DataComponentsScreenEventStateUpdate value)? stateUpdate,
    TResult Function(DataComponentsScreenEventAddSource value)? addSource,
    TResult Function(DataComponentsScreenEventDeleteSource value)? deleteSource,
    TResult Function(DataComponentsScreenEventAddDataComponent value)?
        addDataComponent,
    TResult Function(DataComponentsScreenEventDeleteDataComponent value)?
        deleteDataComponent,
    required TResult orElse(),
  }) {
    if (deleteSource != null) {
      return deleteSource(this);
    }
    return orElse();
  }
}

abstract class DataComponentsScreenEventDeleteSource
    implements DataComponentsScreenEvent {
  const factory DataComponentsScreenEventDeleteSource(
      {required final Source source}) = _$DataComponentsScreenEventDeleteSource;

  Source get source;
  @JsonKey(ignore: true)
  _$$DataComponentsScreenEventDeleteSourceCopyWith<
          _$DataComponentsScreenEventDeleteSource>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataComponentsScreenEventAddDataComponentCopyWith<$Res> {
  factory _$$DataComponentsScreenEventAddDataComponentCopyWith(
          _$DataComponentsScreenEventAddDataComponent value,
          $Res Function(_$DataComponentsScreenEventAddDataComponent) then) =
      __$$DataComponentsScreenEventAddDataComponentCopyWithImpl<$Res>;
  @useResult
  $Res call({DataComponent dataComponent, Source? source});
}

/// @nodoc
class __$$DataComponentsScreenEventAddDataComponentCopyWithImpl<$Res>
    extends _$DataComponentsScreenEventCopyWithImpl<$Res,
        _$DataComponentsScreenEventAddDataComponent>
    implements _$$DataComponentsScreenEventAddDataComponentCopyWith<$Res> {
  __$$DataComponentsScreenEventAddDataComponentCopyWithImpl(
      _$DataComponentsScreenEventAddDataComponent _value,
      $Res Function(_$DataComponentsScreenEventAddDataComponent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataComponent = null,
    Object? source = freezed,
  }) {
    return _then(_$DataComponentsScreenEventAddDataComponent(
      dataComponent: null == dataComponent
          ? _value.dataComponent
          : dataComponent // ignore: cast_nullable_to_non_nullable
              as DataComponent,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source?,
    ));
  }
}

/// @nodoc

class _$DataComponentsScreenEventAddDataComponent
    implements DataComponentsScreenEventAddDataComponent {
  const _$DataComponentsScreenEventAddDataComponent(
      {required this.dataComponent, this.source = null});

  @override
  final DataComponent dataComponent;
  @override
  @JsonKey()
  final Source? source;

  @override
  String toString() {
    return 'DataComponentsScreenEvent.addDataComponent(dataComponent: $dataComponent, source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataComponentsScreenEventAddDataComponent &&
            (identical(other.dataComponent, dataComponent) ||
                other.dataComponent == dataComponent) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dataComponent, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataComponentsScreenEventAddDataComponentCopyWith<
          _$DataComponentsScreenEventAddDataComponent>
      get copyWith => __$$DataComponentsScreenEventAddDataComponentCopyWithImpl<
          _$DataComponentsScreenEventAddDataComponent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() stateUpdate,
    required TResult Function(Source source) addSource,
    required TResult Function(Source source) deleteSource,
    required TResult Function(DataComponent dataComponent, Source? source)
        addDataComponent,
    required TResult Function(DataComponent entity, Source? source)
        deleteDataComponent,
  }) {
    return addDataComponent(dataComponent, source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? stateUpdate,
    TResult? Function(Source source)? addSource,
    TResult? Function(Source source)? deleteSource,
    TResult? Function(DataComponent dataComponent, Source? source)?
        addDataComponent,
    TResult? Function(DataComponent entity, Source? source)?
        deleteDataComponent,
  }) {
    return addDataComponent?.call(dataComponent, source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? stateUpdate,
    TResult Function(Source source)? addSource,
    TResult Function(Source source)? deleteSource,
    TResult Function(DataComponent dataComponent, Source? source)?
        addDataComponent,
    TResult Function(DataComponent entity, Source? source)? deleteDataComponent,
    required TResult orElse(),
  }) {
    if (addDataComponent != null) {
      return addDataComponent(dataComponent, source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenEventInit value) init,
    required TResult Function(DataComponentsScreenEventStateUpdate value)
        stateUpdate,
    required TResult Function(DataComponentsScreenEventAddSource value)
        addSource,
    required TResult Function(DataComponentsScreenEventDeleteSource value)
        deleteSource,
    required TResult Function(DataComponentsScreenEventAddDataComponent value)
        addDataComponent,
    required TResult Function(
            DataComponentsScreenEventDeleteDataComponent value)
        deleteDataComponent,
  }) {
    return addDataComponent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenEventInit value)? init,
    TResult? Function(DataComponentsScreenEventStateUpdate value)? stateUpdate,
    TResult? Function(DataComponentsScreenEventAddSource value)? addSource,
    TResult? Function(DataComponentsScreenEventDeleteSource value)?
        deleteSource,
    TResult? Function(DataComponentsScreenEventAddDataComponent value)?
        addDataComponent,
    TResult? Function(DataComponentsScreenEventDeleteDataComponent value)?
        deleteDataComponent,
  }) {
    return addDataComponent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenEventInit value)? init,
    TResult Function(DataComponentsScreenEventStateUpdate value)? stateUpdate,
    TResult Function(DataComponentsScreenEventAddSource value)? addSource,
    TResult Function(DataComponentsScreenEventDeleteSource value)? deleteSource,
    TResult Function(DataComponentsScreenEventAddDataComponent value)?
        addDataComponent,
    TResult Function(DataComponentsScreenEventDeleteDataComponent value)?
        deleteDataComponent,
    required TResult orElse(),
  }) {
    if (addDataComponent != null) {
      return addDataComponent(this);
    }
    return orElse();
  }
}

abstract class DataComponentsScreenEventAddDataComponent
    implements DataComponentsScreenEvent {
  const factory DataComponentsScreenEventAddDataComponent(
      {required final DataComponent dataComponent,
      final Source? source}) = _$DataComponentsScreenEventAddDataComponent;

  DataComponent get dataComponent;
  Source? get source;
  @JsonKey(ignore: true)
  _$$DataComponentsScreenEventAddDataComponentCopyWith<
          _$DataComponentsScreenEventAddDataComponent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataComponentsScreenEventDeleteDataComponentCopyWith<$Res> {
  factory _$$DataComponentsScreenEventDeleteDataComponentCopyWith(
          _$DataComponentsScreenEventDeleteDataComponent value,
          $Res Function(_$DataComponentsScreenEventDeleteDataComponent) then) =
      __$$DataComponentsScreenEventDeleteDataComponentCopyWithImpl<$Res>;
  @useResult
  $Res call({DataComponent entity, Source? source});
}

/// @nodoc
class __$$DataComponentsScreenEventDeleteDataComponentCopyWithImpl<$Res>
    extends _$DataComponentsScreenEventCopyWithImpl<$Res,
        _$DataComponentsScreenEventDeleteDataComponent>
    implements _$$DataComponentsScreenEventDeleteDataComponentCopyWith<$Res> {
  __$$DataComponentsScreenEventDeleteDataComponentCopyWithImpl(
      _$DataComponentsScreenEventDeleteDataComponent _value,
      $Res Function(_$DataComponentsScreenEventDeleteDataComponent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
    Object? source = freezed,
  }) {
    return _then(_$DataComponentsScreenEventDeleteDataComponent(
      entity: null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as DataComponent,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source?,
    ));
  }
}

/// @nodoc

class _$DataComponentsScreenEventDeleteDataComponent
    implements DataComponentsScreenEventDeleteDataComponent {
  const _$DataComponentsScreenEventDeleteDataComponent(
      {required this.entity, this.source = null});

  @override
  final DataComponent entity;
  @override
  @JsonKey()
  final Source? source;

  @override
  String toString() {
    return 'DataComponentsScreenEvent.deleteDataComponent(entity: $entity, source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataComponentsScreenEventDeleteDataComponent &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entity, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataComponentsScreenEventDeleteDataComponentCopyWith<
          _$DataComponentsScreenEventDeleteDataComponent>
      get copyWith =>
          __$$DataComponentsScreenEventDeleteDataComponentCopyWithImpl<
              _$DataComponentsScreenEventDeleteDataComponent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function() stateUpdate,
    required TResult Function(Source source) addSource,
    required TResult Function(Source source) deleteSource,
    required TResult Function(DataComponent dataComponent, Source? source)
        addDataComponent,
    required TResult Function(DataComponent entity, Source? source)
        deleteDataComponent,
  }) {
    return deleteDataComponent(entity, source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function()? stateUpdate,
    TResult? Function(Source source)? addSource,
    TResult? Function(Source source)? deleteSource,
    TResult? Function(DataComponent dataComponent, Source? source)?
        addDataComponent,
    TResult? Function(DataComponent entity, Source? source)?
        deleteDataComponent,
  }) {
    return deleteDataComponent?.call(entity, source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function()? stateUpdate,
    TResult Function(Source source)? addSource,
    TResult Function(Source source)? deleteSource,
    TResult Function(DataComponent dataComponent, Source? source)?
        addDataComponent,
    TResult Function(DataComponent entity, Source? source)? deleteDataComponent,
    required TResult orElse(),
  }) {
    if (deleteDataComponent != null) {
      return deleteDataComponent(entity, source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenEventInit value) init,
    required TResult Function(DataComponentsScreenEventStateUpdate value)
        stateUpdate,
    required TResult Function(DataComponentsScreenEventAddSource value)
        addSource,
    required TResult Function(DataComponentsScreenEventDeleteSource value)
        deleteSource,
    required TResult Function(DataComponentsScreenEventAddDataComponent value)
        addDataComponent,
    required TResult Function(
            DataComponentsScreenEventDeleteDataComponent value)
        deleteDataComponent,
  }) {
    return deleteDataComponent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenEventInit value)? init,
    TResult? Function(DataComponentsScreenEventStateUpdate value)? stateUpdate,
    TResult? Function(DataComponentsScreenEventAddSource value)? addSource,
    TResult? Function(DataComponentsScreenEventDeleteSource value)?
        deleteSource,
    TResult? Function(DataComponentsScreenEventAddDataComponent value)?
        addDataComponent,
    TResult? Function(DataComponentsScreenEventDeleteDataComponent value)?
        deleteDataComponent,
  }) {
    return deleteDataComponent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenEventInit value)? init,
    TResult Function(DataComponentsScreenEventStateUpdate value)? stateUpdate,
    TResult Function(DataComponentsScreenEventAddSource value)? addSource,
    TResult Function(DataComponentsScreenEventDeleteSource value)? deleteSource,
    TResult Function(DataComponentsScreenEventAddDataComponent value)?
        addDataComponent,
    TResult Function(DataComponentsScreenEventDeleteDataComponent value)?
        deleteDataComponent,
    required TResult orElse(),
  }) {
    if (deleteDataComponent != null) {
      return deleteDataComponent(this);
    }
    return orElse();
  }
}

abstract class DataComponentsScreenEventDeleteDataComponent
    implements DataComponentsScreenEvent {
  const factory DataComponentsScreenEventDeleteDataComponent(
      {required final DataComponent entity,
      final Source? source}) = _$DataComponentsScreenEventDeleteDataComponent;

  DataComponent get entity;
  Source? get source;
  @JsonKey(ignore: true)
  _$$DataComponentsScreenEventDeleteDataComponentCopyWith<
          _$DataComponentsScreenEventDeleteDataComponent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DataComponentsScreenSR {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataComponentsScreenSRCopyWith<DataComponentsScreenSR> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataComponentsScreenSRCopyWith<$Res> {
  factory $DataComponentsScreenSRCopyWith(DataComponentsScreenSR value,
          $Res Function(DataComponentsScreenSR) then) =
      _$DataComponentsScreenSRCopyWithImpl<$Res, DataComponentsScreenSR>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DataComponentsScreenSRCopyWithImpl<$Res,
        $Val extends DataComponentsScreenSR>
    implements $DataComponentsScreenSRCopyWith<$Res> {
  _$DataComponentsScreenSRCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res>
    implements $DataComponentsScreenSRCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$DataComponentsScreenSRCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_Error(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'DataComponentsScreenSR.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements DataComponentsScreenSR {
  const factory _Error({required final String message}) = _$_Error;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DataComponentsScreenState {
  Config get config => throw _privateConstructorUsedError;
  int get stateUpdate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, int stateUpdate) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, int stateUpdate)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, int stateUpdate)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataComponentsScreenStateCopyWith<DataComponentsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataComponentsScreenStateCopyWith<$Res> {
  factory $DataComponentsScreenStateCopyWith(DataComponentsScreenState value,
          $Res Function(DataComponentsScreenState) then) =
      _$DataComponentsScreenStateCopyWithImpl<$Res, DataComponentsScreenState>;
  @useResult
  $Res call({Config config, int stateUpdate});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$DataComponentsScreenStateCopyWithImpl<$Res,
        $Val extends DataComponentsScreenState>
    implements $DataComponentsScreenStateCopyWith<$Res> {
  _$DataComponentsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? stateUpdate = null,
  }) {
    return _then(_value.copyWith(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      stateUpdate: null == stateUpdate
          ? _value.stateUpdate
          : stateUpdate // ignore: cast_nullable_to_non_nullable
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
abstract class _$$DataComponentsScreenStateDataCopyWith<$Res>
    implements $DataComponentsScreenStateCopyWith<$Res> {
  factory _$$DataComponentsScreenStateDataCopyWith(
          _$DataComponentsScreenStateData value,
          $Res Function(_$DataComponentsScreenStateData) then) =
      __$$DataComponentsScreenStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config, int stateUpdate});

  @override
  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$DataComponentsScreenStateDataCopyWithImpl<$Res>
    extends _$DataComponentsScreenStateCopyWithImpl<$Res,
        _$DataComponentsScreenStateData>
    implements _$$DataComponentsScreenStateDataCopyWith<$Res> {
  __$$DataComponentsScreenStateDataCopyWithImpl(
      _$DataComponentsScreenStateData _value,
      $Res Function(_$DataComponentsScreenStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? stateUpdate = null,
  }) {
    return _then(_$DataComponentsScreenStateData(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      stateUpdate: null == stateUpdate
          ? _value.stateUpdate
          : stateUpdate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DataComponentsScreenStateData implements DataComponentsScreenStateData {
  const _$DataComponentsScreenStateData(
      {required this.config, this.stateUpdate = 0});

  @override
  final Config config;
  @override
  @JsonKey()
  final int stateUpdate;

  @override
  String toString() {
    return 'DataComponentsScreenState.data(config: $config, stateUpdate: $stateUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataComponentsScreenStateData &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.stateUpdate, stateUpdate) ||
                other.stateUpdate == stateUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, stateUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataComponentsScreenStateDataCopyWith<_$DataComponentsScreenStateData>
      get copyWith => __$$DataComponentsScreenStateDataCopyWithImpl<
          _$DataComponentsScreenStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, int stateUpdate) data,
  }) {
    return data(config, stateUpdate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, int stateUpdate)? data,
  }) {
    return data?.call(config, stateUpdate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, int stateUpdate)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(config, stateUpdate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class DataComponentsScreenStateData
    implements DataComponentsScreenState {
  const factory DataComponentsScreenStateData(
      {required final Config config,
      final int stateUpdate}) = _$DataComponentsScreenStateData;

  @override
  Config get config;
  @override
  int get stateUpdate;
  @override
  @JsonKey(ignore: true)
  _$$DataComponentsScreenStateDataCopyWith<_$DataComponentsScreenStateData>
      get copyWith => throw _privateConstructorUsedError;
}
