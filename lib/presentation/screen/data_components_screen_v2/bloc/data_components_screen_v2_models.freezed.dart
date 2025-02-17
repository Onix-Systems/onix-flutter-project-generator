// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_components_screen_v2_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DataComponentsScreenV2Event {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String sourceName) addSource,
    required TResult Function(String sourceName, String newName) editSourceName,
    required TResult Function(String sourceName) deleteSource,
    required TResult Function(String componentName) deleteComponent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String sourceName)? addSource,
    TResult? Function(String sourceName, String newName)? editSourceName,
    TResult? Function(String sourceName)? deleteSource,
    TResult? Function(String componentName)? deleteComponent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String sourceName)? addSource,
    TResult Function(String sourceName, String newName)? editSourceName,
    TResult Function(String sourceName)? deleteSource,
    TResult Function(String componentName)? deleteComponent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenV2IInit value) init,
    required TResult Function(DataComponentsScreenV2AddSource value) addSource,
    required TResult Function(DataComponentsScreenV2EditSourceName value)
        editSourceName,
    required TResult Function(DataComponentsScreenV2DeleteSource value)
        deleteSource,
    required TResult Function(DataComponentsScreenV2DeleteComponent value)
        deleteComponent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenV2IInit value)? init,
    TResult? Function(DataComponentsScreenV2AddSource value)? addSource,
    TResult? Function(DataComponentsScreenV2EditSourceName value)?
        editSourceName,
    TResult? Function(DataComponentsScreenV2DeleteSource value)? deleteSource,
    TResult? Function(DataComponentsScreenV2DeleteComponent value)?
        deleteComponent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenV2IInit value)? init,
    TResult Function(DataComponentsScreenV2AddSource value)? addSource,
    TResult Function(DataComponentsScreenV2EditSourceName value)?
        editSourceName,
    TResult Function(DataComponentsScreenV2DeleteSource value)? deleteSource,
    TResult Function(DataComponentsScreenV2DeleteComponent value)?
        deleteComponent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataComponentsScreenV2EventCopyWith<$Res> {
  factory $DataComponentsScreenV2EventCopyWith(
          DataComponentsScreenV2Event value,
          $Res Function(DataComponentsScreenV2Event) then) =
      _$DataComponentsScreenV2EventCopyWithImpl<$Res,
          DataComponentsScreenV2Event>;
}

/// @nodoc
class _$DataComponentsScreenV2EventCopyWithImpl<$Res,
        $Val extends DataComponentsScreenV2Event>
    implements $DataComponentsScreenV2EventCopyWith<$Res> {
  _$DataComponentsScreenV2EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DataComponentsScreenV2IInitImplCopyWith<$Res> {
  factory _$$DataComponentsScreenV2IInitImplCopyWith(
          _$DataComponentsScreenV2IInitImpl value,
          $Res Function(_$DataComponentsScreenV2IInitImpl) then) =
      __$$DataComponentsScreenV2IInitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Config config});

  $ConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$DataComponentsScreenV2IInitImplCopyWithImpl<$Res>
    extends _$DataComponentsScreenV2EventCopyWithImpl<$Res,
        _$DataComponentsScreenV2IInitImpl>
    implements _$$DataComponentsScreenV2IInitImplCopyWith<$Res> {
  __$$DataComponentsScreenV2IInitImplCopyWithImpl(
      _$DataComponentsScreenV2IInitImpl _value,
      $Res Function(_$DataComponentsScreenV2IInitImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$DataComponentsScreenV2IInitImpl(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ));
  }

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<$Res> get config {
    return $ConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc

class _$DataComponentsScreenV2IInitImpl implements DataComponentsScreenV2IInit {
  const _$DataComponentsScreenV2IInitImpl({required this.config});

  @override
  final Config config;

  @override
  String toString() {
    return 'DataComponentsScreenV2Event.init(config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataComponentsScreenV2IInitImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataComponentsScreenV2IInitImplCopyWith<_$DataComponentsScreenV2IInitImpl>
      get copyWith => __$$DataComponentsScreenV2IInitImplCopyWithImpl<
          _$DataComponentsScreenV2IInitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String sourceName) addSource,
    required TResult Function(String sourceName, String newName) editSourceName,
    required TResult Function(String sourceName) deleteSource,
    required TResult Function(String componentName) deleteComponent,
  }) {
    return init(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String sourceName)? addSource,
    TResult? Function(String sourceName, String newName)? editSourceName,
    TResult? Function(String sourceName)? deleteSource,
    TResult? Function(String componentName)? deleteComponent,
  }) {
    return init?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String sourceName)? addSource,
    TResult Function(String sourceName, String newName)? editSourceName,
    TResult Function(String sourceName)? deleteSource,
    TResult Function(String componentName)? deleteComponent,
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
    required TResult Function(DataComponentsScreenV2IInit value) init,
    required TResult Function(DataComponentsScreenV2AddSource value) addSource,
    required TResult Function(DataComponentsScreenV2EditSourceName value)
        editSourceName,
    required TResult Function(DataComponentsScreenV2DeleteSource value)
        deleteSource,
    required TResult Function(DataComponentsScreenV2DeleteComponent value)
        deleteComponent,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenV2IInit value)? init,
    TResult? Function(DataComponentsScreenV2AddSource value)? addSource,
    TResult? Function(DataComponentsScreenV2EditSourceName value)?
        editSourceName,
    TResult? Function(DataComponentsScreenV2DeleteSource value)? deleteSource,
    TResult? Function(DataComponentsScreenV2DeleteComponent value)?
        deleteComponent,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenV2IInit value)? init,
    TResult Function(DataComponentsScreenV2AddSource value)? addSource,
    TResult Function(DataComponentsScreenV2EditSourceName value)?
        editSourceName,
    TResult Function(DataComponentsScreenV2DeleteSource value)? deleteSource,
    TResult Function(DataComponentsScreenV2DeleteComponent value)?
        deleteComponent,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class DataComponentsScreenV2IInit
    implements DataComponentsScreenV2Event {
  const factory DataComponentsScreenV2IInit({required final Config config}) =
      _$DataComponentsScreenV2IInitImpl;

  Config get config;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataComponentsScreenV2IInitImplCopyWith<_$DataComponentsScreenV2IInitImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataComponentsScreenV2AddSourceImplCopyWith<$Res> {
  factory _$$DataComponentsScreenV2AddSourceImplCopyWith(
          _$DataComponentsScreenV2AddSourceImpl value,
          $Res Function(_$DataComponentsScreenV2AddSourceImpl) then) =
      __$$DataComponentsScreenV2AddSourceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sourceName});
}

/// @nodoc
class __$$DataComponentsScreenV2AddSourceImplCopyWithImpl<$Res>
    extends _$DataComponentsScreenV2EventCopyWithImpl<$Res,
        _$DataComponentsScreenV2AddSourceImpl>
    implements _$$DataComponentsScreenV2AddSourceImplCopyWith<$Res> {
  __$$DataComponentsScreenV2AddSourceImplCopyWithImpl(
      _$DataComponentsScreenV2AddSourceImpl _value,
      $Res Function(_$DataComponentsScreenV2AddSourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceName = null,
  }) {
    return _then(_$DataComponentsScreenV2AddSourceImpl(
      sourceName: null == sourceName
          ? _value.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DataComponentsScreenV2AddSourceImpl
    implements DataComponentsScreenV2AddSource {
  const _$DataComponentsScreenV2AddSourceImpl({required this.sourceName});

  @override
  final String sourceName;

  @override
  String toString() {
    return 'DataComponentsScreenV2Event.addSource(sourceName: $sourceName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataComponentsScreenV2AddSourceImpl &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sourceName);

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataComponentsScreenV2AddSourceImplCopyWith<
          _$DataComponentsScreenV2AddSourceImpl>
      get copyWith => __$$DataComponentsScreenV2AddSourceImplCopyWithImpl<
          _$DataComponentsScreenV2AddSourceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String sourceName) addSource,
    required TResult Function(String sourceName, String newName) editSourceName,
    required TResult Function(String sourceName) deleteSource,
    required TResult Function(String componentName) deleteComponent,
  }) {
    return addSource(sourceName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String sourceName)? addSource,
    TResult? Function(String sourceName, String newName)? editSourceName,
    TResult? Function(String sourceName)? deleteSource,
    TResult? Function(String componentName)? deleteComponent,
  }) {
    return addSource?.call(sourceName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String sourceName)? addSource,
    TResult Function(String sourceName, String newName)? editSourceName,
    TResult Function(String sourceName)? deleteSource,
    TResult Function(String componentName)? deleteComponent,
    required TResult orElse(),
  }) {
    if (addSource != null) {
      return addSource(sourceName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenV2IInit value) init,
    required TResult Function(DataComponentsScreenV2AddSource value) addSource,
    required TResult Function(DataComponentsScreenV2EditSourceName value)
        editSourceName,
    required TResult Function(DataComponentsScreenV2DeleteSource value)
        deleteSource,
    required TResult Function(DataComponentsScreenV2DeleteComponent value)
        deleteComponent,
  }) {
    return addSource(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenV2IInit value)? init,
    TResult? Function(DataComponentsScreenV2AddSource value)? addSource,
    TResult? Function(DataComponentsScreenV2EditSourceName value)?
        editSourceName,
    TResult? Function(DataComponentsScreenV2DeleteSource value)? deleteSource,
    TResult? Function(DataComponentsScreenV2DeleteComponent value)?
        deleteComponent,
  }) {
    return addSource?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenV2IInit value)? init,
    TResult Function(DataComponentsScreenV2AddSource value)? addSource,
    TResult Function(DataComponentsScreenV2EditSourceName value)?
        editSourceName,
    TResult Function(DataComponentsScreenV2DeleteSource value)? deleteSource,
    TResult Function(DataComponentsScreenV2DeleteComponent value)?
        deleteComponent,
    required TResult orElse(),
  }) {
    if (addSource != null) {
      return addSource(this);
    }
    return orElse();
  }
}

abstract class DataComponentsScreenV2AddSource
    implements DataComponentsScreenV2Event {
  const factory DataComponentsScreenV2AddSource(
          {required final String sourceName}) =
      _$DataComponentsScreenV2AddSourceImpl;

  String get sourceName;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataComponentsScreenV2AddSourceImplCopyWith<
          _$DataComponentsScreenV2AddSourceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataComponentsScreenV2EditSourceNameImplCopyWith<$Res> {
  factory _$$DataComponentsScreenV2EditSourceNameImplCopyWith(
          _$DataComponentsScreenV2EditSourceNameImpl value,
          $Res Function(_$DataComponentsScreenV2EditSourceNameImpl) then) =
      __$$DataComponentsScreenV2EditSourceNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sourceName, String newName});
}

/// @nodoc
class __$$DataComponentsScreenV2EditSourceNameImplCopyWithImpl<$Res>
    extends _$DataComponentsScreenV2EventCopyWithImpl<$Res,
        _$DataComponentsScreenV2EditSourceNameImpl>
    implements _$$DataComponentsScreenV2EditSourceNameImplCopyWith<$Res> {
  __$$DataComponentsScreenV2EditSourceNameImplCopyWithImpl(
      _$DataComponentsScreenV2EditSourceNameImpl _value,
      $Res Function(_$DataComponentsScreenV2EditSourceNameImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceName = null,
    Object? newName = null,
  }) {
    return _then(_$DataComponentsScreenV2EditSourceNameImpl(
      sourceName: null == sourceName
          ? _value.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String,
      newName: null == newName
          ? _value.newName
          : newName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DataComponentsScreenV2EditSourceNameImpl
    implements DataComponentsScreenV2EditSourceName {
  const _$DataComponentsScreenV2EditSourceNameImpl(
      {required this.sourceName, required this.newName});

  @override
  final String sourceName;
  @override
  final String newName;

  @override
  String toString() {
    return 'DataComponentsScreenV2Event.editSourceName(sourceName: $sourceName, newName: $newName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataComponentsScreenV2EditSourceNameImpl &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName) &&
            (identical(other.newName, newName) || other.newName == newName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sourceName, newName);

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataComponentsScreenV2EditSourceNameImplCopyWith<
          _$DataComponentsScreenV2EditSourceNameImpl>
      get copyWith => __$$DataComponentsScreenV2EditSourceNameImplCopyWithImpl<
          _$DataComponentsScreenV2EditSourceNameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String sourceName) addSource,
    required TResult Function(String sourceName, String newName) editSourceName,
    required TResult Function(String sourceName) deleteSource,
    required TResult Function(String componentName) deleteComponent,
  }) {
    return editSourceName(sourceName, newName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String sourceName)? addSource,
    TResult? Function(String sourceName, String newName)? editSourceName,
    TResult? Function(String sourceName)? deleteSource,
    TResult? Function(String componentName)? deleteComponent,
  }) {
    return editSourceName?.call(sourceName, newName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String sourceName)? addSource,
    TResult Function(String sourceName, String newName)? editSourceName,
    TResult Function(String sourceName)? deleteSource,
    TResult Function(String componentName)? deleteComponent,
    required TResult orElse(),
  }) {
    if (editSourceName != null) {
      return editSourceName(sourceName, newName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenV2IInit value) init,
    required TResult Function(DataComponentsScreenV2AddSource value) addSource,
    required TResult Function(DataComponentsScreenV2EditSourceName value)
        editSourceName,
    required TResult Function(DataComponentsScreenV2DeleteSource value)
        deleteSource,
    required TResult Function(DataComponentsScreenV2DeleteComponent value)
        deleteComponent,
  }) {
    return editSourceName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenV2IInit value)? init,
    TResult? Function(DataComponentsScreenV2AddSource value)? addSource,
    TResult? Function(DataComponentsScreenV2EditSourceName value)?
        editSourceName,
    TResult? Function(DataComponentsScreenV2DeleteSource value)? deleteSource,
    TResult? Function(DataComponentsScreenV2DeleteComponent value)?
        deleteComponent,
  }) {
    return editSourceName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenV2IInit value)? init,
    TResult Function(DataComponentsScreenV2AddSource value)? addSource,
    TResult Function(DataComponentsScreenV2EditSourceName value)?
        editSourceName,
    TResult Function(DataComponentsScreenV2DeleteSource value)? deleteSource,
    TResult Function(DataComponentsScreenV2DeleteComponent value)?
        deleteComponent,
    required TResult orElse(),
  }) {
    if (editSourceName != null) {
      return editSourceName(this);
    }
    return orElse();
  }
}

abstract class DataComponentsScreenV2EditSourceName
    implements DataComponentsScreenV2Event {
  const factory DataComponentsScreenV2EditSourceName(
          {required final String sourceName, required final String newName}) =
      _$DataComponentsScreenV2EditSourceNameImpl;

  String get sourceName;
  String get newName;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataComponentsScreenV2EditSourceNameImplCopyWith<
          _$DataComponentsScreenV2EditSourceNameImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataComponentsScreenV2DeleteSourceImplCopyWith<$Res> {
  factory _$$DataComponentsScreenV2DeleteSourceImplCopyWith(
          _$DataComponentsScreenV2DeleteSourceImpl value,
          $Res Function(_$DataComponentsScreenV2DeleteSourceImpl) then) =
      __$$DataComponentsScreenV2DeleteSourceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sourceName});
}

/// @nodoc
class __$$DataComponentsScreenV2DeleteSourceImplCopyWithImpl<$Res>
    extends _$DataComponentsScreenV2EventCopyWithImpl<$Res,
        _$DataComponentsScreenV2DeleteSourceImpl>
    implements _$$DataComponentsScreenV2DeleteSourceImplCopyWith<$Res> {
  __$$DataComponentsScreenV2DeleteSourceImplCopyWithImpl(
      _$DataComponentsScreenV2DeleteSourceImpl _value,
      $Res Function(_$DataComponentsScreenV2DeleteSourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceName = null,
  }) {
    return _then(_$DataComponentsScreenV2DeleteSourceImpl(
      sourceName: null == sourceName
          ? _value.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DataComponentsScreenV2DeleteSourceImpl
    implements DataComponentsScreenV2DeleteSource {
  const _$DataComponentsScreenV2DeleteSourceImpl({required this.sourceName});

  @override
  final String sourceName;

  @override
  String toString() {
    return 'DataComponentsScreenV2Event.deleteSource(sourceName: $sourceName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataComponentsScreenV2DeleteSourceImpl &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sourceName);

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataComponentsScreenV2DeleteSourceImplCopyWith<
          _$DataComponentsScreenV2DeleteSourceImpl>
      get copyWith => __$$DataComponentsScreenV2DeleteSourceImplCopyWithImpl<
          _$DataComponentsScreenV2DeleteSourceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String sourceName) addSource,
    required TResult Function(String sourceName, String newName) editSourceName,
    required TResult Function(String sourceName) deleteSource,
    required TResult Function(String componentName) deleteComponent,
  }) {
    return deleteSource(sourceName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String sourceName)? addSource,
    TResult? Function(String sourceName, String newName)? editSourceName,
    TResult? Function(String sourceName)? deleteSource,
    TResult? Function(String componentName)? deleteComponent,
  }) {
    return deleteSource?.call(sourceName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String sourceName)? addSource,
    TResult Function(String sourceName, String newName)? editSourceName,
    TResult Function(String sourceName)? deleteSource,
    TResult Function(String componentName)? deleteComponent,
    required TResult orElse(),
  }) {
    if (deleteSource != null) {
      return deleteSource(sourceName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenV2IInit value) init,
    required TResult Function(DataComponentsScreenV2AddSource value) addSource,
    required TResult Function(DataComponentsScreenV2EditSourceName value)
        editSourceName,
    required TResult Function(DataComponentsScreenV2DeleteSource value)
        deleteSource,
    required TResult Function(DataComponentsScreenV2DeleteComponent value)
        deleteComponent,
  }) {
    return deleteSource(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenV2IInit value)? init,
    TResult? Function(DataComponentsScreenV2AddSource value)? addSource,
    TResult? Function(DataComponentsScreenV2EditSourceName value)?
        editSourceName,
    TResult? Function(DataComponentsScreenV2DeleteSource value)? deleteSource,
    TResult? Function(DataComponentsScreenV2DeleteComponent value)?
        deleteComponent,
  }) {
    return deleteSource?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenV2IInit value)? init,
    TResult Function(DataComponentsScreenV2AddSource value)? addSource,
    TResult Function(DataComponentsScreenV2EditSourceName value)?
        editSourceName,
    TResult Function(DataComponentsScreenV2DeleteSource value)? deleteSource,
    TResult Function(DataComponentsScreenV2DeleteComponent value)?
        deleteComponent,
    required TResult orElse(),
  }) {
    if (deleteSource != null) {
      return deleteSource(this);
    }
    return orElse();
  }
}

abstract class DataComponentsScreenV2DeleteSource
    implements DataComponentsScreenV2Event {
  const factory DataComponentsScreenV2DeleteSource(
          {required final String sourceName}) =
      _$DataComponentsScreenV2DeleteSourceImpl;

  String get sourceName;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataComponentsScreenV2DeleteSourceImplCopyWith<
          _$DataComponentsScreenV2DeleteSourceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataComponentsScreenV2DeleteComponentImplCopyWith<$Res> {
  factory _$$DataComponentsScreenV2DeleteComponentImplCopyWith(
          _$DataComponentsScreenV2DeleteComponentImpl value,
          $Res Function(_$DataComponentsScreenV2DeleteComponentImpl) then) =
      __$$DataComponentsScreenV2DeleteComponentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String componentName});
}

/// @nodoc
class __$$DataComponentsScreenV2DeleteComponentImplCopyWithImpl<$Res>
    extends _$DataComponentsScreenV2EventCopyWithImpl<$Res,
        _$DataComponentsScreenV2DeleteComponentImpl>
    implements _$$DataComponentsScreenV2DeleteComponentImplCopyWith<$Res> {
  __$$DataComponentsScreenV2DeleteComponentImplCopyWithImpl(
      _$DataComponentsScreenV2DeleteComponentImpl _value,
      $Res Function(_$DataComponentsScreenV2DeleteComponentImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? componentName = null,
  }) {
    return _then(_$DataComponentsScreenV2DeleteComponentImpl(
      componentName: null == componentName
          ? _value.componentName
          : componentName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DataComponentsScreenV2DeleteComponentImpl
    implements DataComponentsScreenV2DeleteComponent {
  const _$DataComponentsScreenV2DeleteComponentImpl(
      {required this.componentName});

  @override
  final String componentName;

  @override
  String toString() {
    return 'DataComponentsScreenV2Event.deleteComponent(componentName: $componentName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataComponentsScreenV2DeleteComponentImpl &&
            (identical(other.componentName, componentName) ||
                other.componentName == componentName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, componentName);

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataComponentsScreenV2DeleteComponentImplCopyWith<
          _$DataComponentsScreenV2DeleteComponentImpl>
      get copyWith => __$$DataComponentsScreenV2DeleteComponentImplCopyWithImpl<
          _$DataComponentsScreenV2DeleteComponentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config) init,
    required TResult Function(String sourceName) addSource,
    required TResult Function(String sourceName, String newName) editSourceName,
    required TResult Function(String sourceName) deleteSource,
    required TResult Function(String componentName) deleteComponent,
  }) {
    return deleteComponent(componentName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config)? init,
    TResult? Function(String sourceName)? addSource,
    TResult? Function(String sourceName, String newName)? editSourceName,
    TResult? Function(String sourceName)? deleteSource,
    TResult? Function(String componentName)? deleteComponent,
  }) {
    return deleteComponent?.call(componentName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config)? init,
    TResult Function(String sourceName)? addSource,
    TResult Function(String sourceName, String newName)? editSourceName,
    TResult Function(String sourceName)? deleteSource,
    TResult Function(String componentName)? deleteComponent,
    required TResult orElse(),
  }) {
    if (deleteComponent != null) {
      return deleteComponent(componentName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenV2IInit value) init,
    required TResult Function(DataComponentsScreenV2AddSource value) addSource,
    required TResult Function(DataComponentsScreenV2EditSourceName value)
        editSourceName,
    required TResult Function(DataComponentsScreenV2DeleteSource value)
        deleteSource,
    required TResult Function(DataComponentsScreenV2DeleteComponent value)
        deleteComponent,
  }) {
    return deleteComponent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenV2IInit value)? init,
    TResult? Function(DataComponentsScreenV2AddSource value)? addSource,
    TResult? Function(DataComponentsScreenV2EditSourceName value)?
        editSourceName,
    TResult? Function(DataComponentsScreenV2DeleteSource value)? deleteSource,
    TResult? Function(DataComponentsScreenV2DeleteComponent value)?
        deleteComponent,
  }) {
    return deleteComponent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenV2IInit value)? init,
    TResult Function(DataComponentsScreenV2AddSource value)? addSource,
    TResult Function(DataComponentsScreenV2EditSourceName value)?
        editSourceName,
    TResult Function(DataComponentsScreenV2DeleteSource value)? deleteSource,
    TResult Function(DataComponentsScreenV2DeleteComponent value)?
        deleteComponent,
    required TResult orElse(),
  }) {
    if (deleteComponent != null) {
      return deleteComponent(this);
    }
    return orElse();
  }
}

abstract class DataComponentsScreenV2DeleteComponent
    implements DataComponentsScreenV2Event {
  const factory DataComponentsScreenV2DeleteComponent(
          {required final String componentName}) =
      _$DataComponentsScreenV2DeleteComponentImpl;

  String get componentName;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataComponentsScreenV2DeleteComponentImplCopyWith<
          _$DataComponentsScreenV2DeleteComponentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DataComponentsScreenV2SR {
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

  /// Create a copy of DataComponentsScreenV2SR
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataComponentsScreenV2SRCopyWith<DataComponentsScreenV2SR> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataComponentsScreenV2SRCopyWith<$Res> {
  factory $DataComponentsScreenV2SRCopyWith(DataComponentsScreenV2SR value,
          $Res Function(DataComponentsScreenV2SR) then) =
      _$DataComponentsScreenV2SRCopyWithImpl<$Res, DataComponentsScreenV2SR>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DataComponentsScreenV2SRCopyWithImpl<$Res,
        $Val extends DataComponentsScreenV2SR>
    implements $DataComponentsScreenV2SRCopyWith<$Res> {
  _$DataComponentsScreenV2SRCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataComponentsScreenV2SR
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$ErrorImplCopyWith<$Res>
    implements $DataComponentsScreenV2SRCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$DataComponentsScreenV2SRCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataComponentsScreenV2SR
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'DataComponentsScreenV2SR.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DataComponentsScreenV2SR
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

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

abstract class _Error implements DataComponentsScreenV2SR {
  const factory _Error({required final String message}) = _$ErrorImpl;

  @override
  String get message;

  /// Create a copy of DataComponentsScreenV2SR
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DataComponentsScreenV2State {
  Config get config => throw _privateConstructorUsedError;
  Components get components => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, Components components) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, Components components)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, Components components)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenV2StateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenV2StateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenV2StateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DataComponentsScreenV2State
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataComponentsScreenV2StateCopyWith<DataComponentsScreenV2State>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataComponentsScreenV2StateCopyWith<$Res> {
  factory $DataComponentsScreenV2StateCopyWith(
          DataComponentsScreenV2State value,
          $Res Function(DataComponentsScreenV2State) then) =
      _$DataComponentsScreenV2StateCopyWithImpl<$Res,
          DataComponentsScreenV2State>;
  @useResult
  $Res call({Config config, Components components});

  $ConfigCopyWith<$Res> get config;
  $ComponentsCopyWith<$Res> get components;
}

/// @nodoc
class _$DataComponentsScreenV2StateCopyWithImpl<$Res,
        $Val extends DataComponentsScreenV2State>
    implements $DataComponentsScreenV2StateCopyWith<$Res> {
  _$DataComponentsScreenV2StateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataComponentsScreenV2State
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? components = null,
  }) {
    return _then(_value.copyWith(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      components: null == components
          ? _value.components
          : components // ignore: cast_nullable_to_non_nullable
              as Components,
    ) as $Val);
  }

  /// Create a copy of DataComponentsScreenV2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<$Res> get config {
    return $ConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }

  /// Create a copy of DataComponentsScreenV2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ComponentsCopyWith<$Res> get components {
    return $ComponentsCopyWith<$Res>(_value.components, (value) {
      return _then(_value.copyWith(components: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataComponentsScreenV2StateDataImplCopyWith<$Res>
    implements $DataComponentsScreenV2StateCopyWith<$Res> {
  factory _$$DataComponentsScreenV2StateDataImplCopyWith(
          _$DataComponentsScreenV2StateDataImpl value,
          $Res Function(_$DataComponentsScreenV2StateDataImpl) then) =
      __$$DataComponentsScreenV2StateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Config config, Components components});

  @override
  $ConfigCopyWith<$Res> get config;
  @override
  $ComponentsCopyWith<$Res> get components;
}

/// @nodoc
class __$$DataComponentsScreenV2StateDataImplCopyWithImpl<$Res>
    extends _$DataComponentsScreenV2StateCopyWithImpl<$Res,
        _$DataComponentsScreenV2StateDataImpl>
    implements _$$DataComponentsScreenV2StateDataImplCopyWith<$Res> {
  __$$DataComponentsScreenV2StateDataImplCopyWithImpl(
      _$DataComponentsScreenV2StateDataImpl _value,
      $Res Function(_$DataComponentsScreenV2StateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataComponentsScreenV2State
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? components = null,
  }) {
    return _then(_$DataComponentsScreenV2StateDataImpl(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
      components: null == components
          ? _value.components
          : components // ignore: cast_nullable_to_non_nullable
              as Components,
    ));
  }
}

/// @nodoc

class _$DataComponentsScreenV2StateDataImpl
    implements DataComponentsScreenV2StateData {
  const _$DataComponentsScreenV2StateDataImpl(
      {required this.config, required this.components});

  @override
  final Config config;
  @override
  final Components components;

  @override
  String toString() {
    return 'DataComponentsScreenV2State.data(config: $config, components: $components)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataComponentsScreenV2StateDataImpl &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.components, components) ||
                other.components == components));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, components);

  /// Create a copy of DataComponentsScreenV2State
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataComponentsScreenV2StateDataImplCopyWith<
          _$DataComponentsScreenV2StateDataImpl>
      get copyWith => __$$DataComponentsScreenV2StateDataImplCopyWithImpl<
          _$DataComponentsScreenV2StateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config config, Components components) data,
  }) {
    return data(config, components);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Config config, Components components)? data,
  }) {
    return data?.call(config, components);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config config, Components components)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(config, components);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenV2StateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenV2StateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenV2StateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class DataComponentsScreenV2StateData
    implements DataComponentsScreenV2State {
  const factory DataComponentsScreenV2StateData(
          {required final Config config,
          required final Components components}) =
      _$DataComponentsScreenV2StateDataImpl;

  @override
  Config get config;
  @override
  Components get components;

  /// Create a copy of DataComponentsScreenV2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataComponentsScreenV2StateDataImplCopyWith<
          _$DataComponentsScreenV2StateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
