// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectPath) init,
    required TResult Function(int tabIndex) onTabChange,
    required TResult Function(String projectName) onProjectNameChange,
    required TResult Function(String projectPath) onProjectPathChange,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectPath)? init,
    TResult? Function(int tabIndex)? onTabChange,
    TResult? Function(String projectName)? onProjectNameChange,
    TResult? Function(String projectPath)? onProjectPathChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectPath)? init,
    TResult Function(int tabIndex)? onTabChange,
    TResult Function(String projectName)? onProjectNameChange,
    TResult Function(String projectPath)? onProjectPathChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(TabChange value) onTabChange,
    required TResult Function(ProjectNameChange value) onProjectNameChange,
    required TResult Function(ProjectPathChange value) onProjectPathChange,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(TabChange value)? onTabChange,
    TResult? Function(ProjectNameChange value)? onProjectNameChange,
    TResult? Function(ProjectPathChange value)? onProjectPathChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(TabChange value)? onTabChange,
    TResult Function(ProjectNameChange value)? onProjectNameChange,
    TResult Function(ProjectPathChange value)? onProjectPathChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitCopyWith<$Res> {
  factory _$$InitCopyWith(_$Init value, $Res Function(_$Init) then) =
      __$$InitCopyWithImpl<$Res>;

  @useResult
  $Res call({String projectPath});
}

/// @nodoc
class __$$InitCopyWithImpl<$Res> extends _$AppEventCopyWithImpl<$Res, _$Init>
    implements _$$InitCopyWith<$Res> {
  __$$InitCopyWithImpl(_$Init _value, $Res Function(_$Init) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectPath = null,
  }) {
    return _then(_$Init(
      projectPath: null == projectPath
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Init implements Init {
  const _$Init({required this.projectPath});

  @override
  final String projectPath;

  @override
  String toString() {
    return 'AppEvent.init(projectPath: $projectPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Init &&
            (identical(other.projectPath, projectPath) ||
                other.projectPath == projectPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitCopyWith<_$Init> get copyWith =>
      __$$InitCopyWithImpl<_$Init>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectPath) init,
    required TResult Function(int tabIndex) onTabChange,
    required TResult Function(String projectName) onProjectNameChange,
    required TResult Function(String projectPath) onProjectPathChange,
  }) {
    return init(projectPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectPath)? init,
    TResult? Function(int tabIndex)? onTabChange,
    TResult? Function(String projectName)? onProjectNameChange,
    TResult? Function(String projectPath)? onProjectPathChange,
  }) {
    return init?.call(projectPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectPath)? init,
    TResult Function(int tabIndex)? onTabChange,
    TResult Function(String projectName)? onProjectNameChange,
    TResult Function(String projectPath)? onProjectPathChange,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(projectPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(TabChange value) onTabChange,
    required TResult Function(ProjectNameChange value) onProjectNameChange,
    required TResult Function(ProjectPathChange value) onProjectPathChange,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(TabChange value)? onTabChange,
    TResult? Function(ProjectNameChange value)? onProjectNameChange,
    TResult? Function(ProjectPathChange value)? onProjectPathChange,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(TabChange value)? onTabChange,
    TResult Function(ProjectNameChange value)? onProjectNameChange,
    TResult Function(ProjectPathChange value)? onProjectPathChange,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements AppEvent {
  const factory Init({required final String projectPath}) = _$Init;

  String get projectPath;

  @JsonKey(ignore: true)
  _$$InitCopyWith<_$Init> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TabChangeCopyWith<$Res> {
  factory _$$TabChangeCopyWith(
          _$TabChange value, $Res Function(_$TabChange) then) =
      __$$TabChangeCopyWithImpl<$Res>;

  @useResult
  $Res call({int tabIndex});
}

/// @nodoc
class __$$TabChangeCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$TabChange>
    implements _$$TabChangeCopyWith<$Res> {
  __$$TabChangeCopyWithImpl(
      _$TabChange _value, $Res Function(_$TabChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabIndex = null,
  }) {
    return _then(_$TabChange(
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TabChange implements TabChange {
  const _$TabChange({required this.tabIndex});

  @override
  final int tabIndex;

  @override
  String toString() {
    return 'AppEvent.onTabChange(tabIndex: $tabIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabChange &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tabIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TabChangeCopyWith<_$TabChange> get copyWith =>
      __$$TabChangeCopyWithImpl<_$TabChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectPath) init,
    required TResult Function(int tabIndex) onTabChange,
    required TResult Function(String projectName) onProjectNameChange,
    required TResult Function(String projectPath) onProjectPathChange,
  }) {
    return onTabChange(tabIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectPath)? init,
    TResult? Function(int tabIndex)? onTabChange,
    TResult? Function(String projectName)? onProjectNameChange,
    TResult? Function(String projectPath)? onProjectPathChange,
  }) {
    return onTabChange?.call(tabIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectPath)? init,
    TResult Function(int tabIndex)? onTabChange,
    TResult Function(String projectName)? onProjectNameChange,
    TResult Function(String projectPath)? onProjectPathChange,
    required TResult orElse(),
  }) {
    if (onTabChange != null) {
      return onTabChange(tabIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(TabChange value) onTabChange,
    required TResult Function(ProjectNameChange value) onProjectNameChange,
    required TResult Function(ProjectPathChange value) onProjectPathChange,
  }) {
    return onTabChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(TabChange value)? onTabChange,
    TResult? Function(ProjectNameChange value)? onProjectNameChange,
    TResult? Function(ProjectPathChange value)? onProjectPathChange,
  }) {
    return onTabChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(TabChange value)? onTabChange,
    TResult Function(ProjectNameChange value)? onProjectNameChange,
    TResult Function(ProjectPathChange value)? onProjectPathChange,
    required TResult orElse(),
  }) {
    if (onTabChange != null) {
      return onTabChange(this);
    }
    return orElse();
  }
}

abstract class TabChange implements AppEvent {
  const factory TabChange({required final int tabIndex}) = _$TabChange;

  int get tabIndex;

  @JsonKey(ignore: true)
  _$$TabChangeCopyWith<_$TabChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectNameChangeCopyWith<$Res> {
  factory _$$ProjectNameChangeCopyWith(
          _$ProjectNameChange value, $Res Function(_$ProjectNameChange) then) =
      __$$ProjectNameChangeCopyWithImpl<$Res>;

  @useResult
  $Res call({String projectName});
}

/// @nodoc
class __$$ProjectNameChangeCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$ProjectNameChange>
    implements _$$ProjectNameChangeCopyWith<$Res> {
  __$$ProjectNameChangeCopyWithImpl(
      _$ProjectNameChange _value, $Res Function(_$ProjectNameChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
  }) {
    return _then(_$ProjectNameChange(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProjectNameChange implements ProjectNameChange {
  const _$ProjectNameChange({required this.projectName});

  @override
  final String projectName;

  @override
  String toString() {
    return 'AppEvent.onProjectNameChange(projectName: $projectName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectNameChange &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectNameChangeCopyWith<_$ProjectNameChange> get copyWith =>
      __$$ProjectNameChangeCopyWithImpl<_$ProjectNameChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectPath) init,
    required TResult Function(int tabIndex) onTabChange,
    required TResult Function(String projectName) onProjectNameChange,
    required TResult Function(String projectPath) onProjectPathChange,
  }) {
    return onProjectNameChange(projectName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectPath)? init,
    TResult? Function(int tabIndex)? onTabChange,
    TResult? Function(String projectName)? onProjectNameChange,
    TResult? Function(String projectPath)? onProjectPathChange,
  }) {
    return onProjectNameChange?.call(projectName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectPath)? init,
    TResult Function(int tabIndex)? onTabChange,
    TResult Function(String projectName)? onProjectNameChange,
    TResult Function(String projectPath)? onProjectPathChange,
    required TResult orElse(),
  }) {
    if (onProjectNameChange != null) {
      return onProjectNameChange(projectName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(TabChange value) onTabChange,
    required TResult Function(ProjectNameChange value) onProjectNameChange,
    required TResult Function(ProjectPathChange value) onProjectPathChange,
  }) {
    return onProjectNameChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(TabChange value)? onTabChange,
    TResult? Function(ProjectNameChange value)? onProjectNameChange,
    TResult? Function(ProjectPathChange value)? onProjectPathChange,
  }) {
    return onProjectNameChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(TabChange value)? onTabChange,
    TResult Function(ProjectNameChange value)? onProjectNameChange,
    TResult Function(ProjectPathChange value)? onProjectPathChange,
    required TResult orElse(),
  }) {
    if (onProjectNameChange != null) {
      return onProjectNameChange(this);
    }
    return orElse();
  }
}

abstract class ProjectNameChange implements AppEvent {
  const factory ProjectNameChange({required final String projectName}) =
      _$ProjectNameChange;

  String get projectName;

  @JsonKey(ignore: true)
  _$$ProjectNameChangeCopyWith<_$ProjectNameChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectPathChangeCopyWith<$Res> {
  factory _$$ProjectPathChangeCopyWith(
          _$ProjectPathChange value, $Res Function(_$ProjectPathChange) then) =
      __$$ProjectPathChangeCopyWithImpl<$Res>;

  @useResult
  $Res call({String projectPath});
}

/// @nodoc
class __$$ProjectPathChangeCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$ProjectPathChange>
    implements _$$ProjectPathChangeCopyWith<$Res> {
  __$$ProjectPathChangeCopyWithImpl(
      _$ProjectPathChange _value, $Res Function(_$ProjectPathChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectPath = null,
  }) {
    return _then(_$ProjectPathChange(
      projectPath: null == projectPath
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProjectPathChange implements ProjectPathChange {
  const _$ProjectPathChange({required this.projectPath});

  @override
  final String projectPath;

  @override
  String toString() {
    return 'AppEvent.onProjectPathChange(projectPath: $projectPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectPathChange &&
            (identical(other.projectPath, projectPath) ||
                other.projectPath == projectPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectPathChangeCopyWith<_$ProjectPathChange> get copyWith =>
      __$$ProjectPathChangeCopyWithImpl<_$ProjectPathChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectPath) init,
    required TResult Function(int tabIndex) onTabChange,
    required TResult Function(String projectName) onProjectNameChange,
    required TResult Function(String projectPath) onProjectPathChange,
  }) {
    return onProjectPathChange(projectPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectPath)? init,
    TResult? Function(int tabIndex)? onTabChange,
    TResult? Function(String projectName)? onProjectNameChange,
    TResult? Function(String projectPath)? onProjectPathChange,
  }) {
    return onProjectPathChange?.call(projectPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectPath)? init,
    TResult Function(int tabIndex)? onTabChange,
    TResult Function(String projectName)? onProjectNameChange,
    TResult Function(String projectPath)? onProjectPathChange,
    required TResult orElse(),
  }) {
    if (onProjectPathChange != null) {
      return onProjectPathChange(projectPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(TabChange value) onTabChange,
    required TResult Function(ProjectNameChange value) onProjectNameChange,
    required TResult Function(ProjectPathChange value) onProjectPathChange,
  }) {
    return onProjectPathChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(TabChange value)? onTabChange,
    TResult? Function(ProjectNameChange value)? onProjectNameChange,
    TResult? Function(ProjectPathChange value)? onProjectPathChange,
  }) {
    return onProjectPathChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(TabChange value)? onTabChange,
    TResult Function(ProjectNameChange value)? onProjectNameChange,
    TResult Function(ProjectPathChange value)? onProjectPathChange,
    required TResult orElse(),
  }) {
    if (onProjectPathChange != null) {
      return onProjectPathChange(this);
    }
    return orElse();
  }
}

abstract class ProjectPathChange implements AppEvent {
  const factory ProjectPathChange({required final String projectPath}) =
      _$ProjectPathChange;

  String get projectPath;

  @JsonKey(ignore: true)
  _$$ProjectPathChangeCopyWith<_$ProjectPathChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppState {
  String get projectPath => throw _privateConstructorUsedError;

  String get projectName => throw _privateConstructorUsedError;

  int get tab => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectPath, String projectName, int tab)
        data,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectPath, String projectName, int tab)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectPath, String projectName, int tab)? data,
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
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;

  @useResult
  $Res call({String projectPath, String projectName, int tab});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectPath = null,
    Object? projectName = null,
    Object? tab = null,
  }) {
    return _then(_value.copyWith(
      projectPath: null == projectPath
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      tab: null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$DataCopyWith(_$Data value, $Res Function(_$Data) then) =
      __$$DataCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({String projectPath, String projectName, int tab});
}

/// @nodoc
class __$$DataCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res, _$Data>
    implements _$$DataCopyWith<$Res> {
  __$$DataCopyWithImpl(_$Data _value, $Res Function(_$Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectPath = null,
    Object? projectName = null,
    Object? tab = null,
  }) {
    return _then(_$Data(
      projectPath: null == projectPath
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      tab: null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Data implements Data {
  const _$Data(
      {required this.projectPath,
      this.projectName = 'new_project',
      this.tab = 0});

  @override
  final String projectPath;
  @override
  @JsonKey()
  final String projectName;
  @override
  @JsonKey()
  final int tab;

  @override
  String toString() {
    return 'AppState.data(projectPath: $projectPath, projectName: $projectName, tab: $tab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Data &&
            (identical(other.projectPath, projectPath) ||
                other.projectPath == projectPath) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.tab, tab) || other.tab == tab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectPath, projectName, tab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataCopyWith<_$Data> get copyWith =>
      __$$DataCopyWithImpl<_$Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectPath, String projectName, int tab)
        data,
  }) {
    return data(projectPath, projectName, tab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectPath, String projectName, int tab)? data,
  }) {
    return data?.call(projectPath, projectName, tab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectPath, String projectName, int tab)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(projectPath, projectName, tab);
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

abstract class Data implements AppState {
  const factory Data(
      {required final String projectPath,
      final String projectName,
      final int tab}) = _$Data;

  @override
  String get projectPath;

  @override
  String get projectName;

  @override
  int get tab;

  @override
  @JsonKey(ignore: true)
  _$$DataCopyWith<_$Data> get copyWith => throw _privateConstructorUsedError;
}
