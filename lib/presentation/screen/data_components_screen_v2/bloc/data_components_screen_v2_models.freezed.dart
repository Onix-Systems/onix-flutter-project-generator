// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_components_screen_v2_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DataComponentsScreenV2Event {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataComponentsScreenV2Event);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DataComponentsScreenV2Event()';
  }
}

/// @nodoc
class $DataComponentsScreenV2EventCopyWith<$Res> {
  $DataComponentsScreenV2EventCopyWith(DataComponentsScreenV2Event _,
      $Res Function(DataComponentsScreenV2Event) __);
}

/// Adds pattern-matching-related methods to [DataComponentsScreenV2Event].
extension DataComponentsScreenV2EventPatterns on DataComponentsScreenV2Event {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenV2IInit value)? init,
    TResult Function(DataComponentsScreenV2AddSource value)? addSource,
    TResult Function(DataComponentsScreenV2EditSourceName value)?
        editSourceName,
    TResult Function(DataComponentsScreenV2DeleteSource value)? deleteSource,
    TResult Function(DataComponentsScreenV2DeleteComponent value)?
        deleteComponent,
    TResult Function(DataComponentsScreenV2DeleteRequest value)? deleteRequest,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DataComponentsScreenV2IInit() when init != null:
        return init(_that);
      case DataComponentsScreenV2AddSource() when addSource != null:
        return addSource(_that);
      case DataComponentsScreenV2EditSourceName() when editSourceName != null:
        return editSourceName(_that);
      case DataComponentsScreenV2DeleteSource() when deleteSource != null:
        return deleteSource(_that);
      case DataComponentsScreenV2DeleteComponent() when deleteComponent != null:
        return deleteComponent(_that);
      case DataComponentsScreenV2DeleteRequest() when deleteRequest != null:
        return deleteRequest(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

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
    required TResult Function(DataComponentsScreenV2DeleteRequest value)
        deleteRequest,
  }) {
    final _that = this;
    switch (_that) {
      case DataComponentsScreenV2IInit():
        return init(_that);
      case DataComponentsScreenV2AddSource():
        return addSource(_that);
      case DataComponentsScreenV2EditSourceName():
        return editSourceName(_that);
      case DataComponentsScreenV2DeleteSource():
        return deleteSource(_that);
      case DataComponentsScreenV2DeleteComponent():
        return deleteComponent(_that);
      case DataComponentsScreenV2DeleteRequest():
        return deleteRequest(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenV2IInit value)? init,
    TResult? Function(DataComponentsScreenV2AddSource value)? addSource,
    TResult? Function(DataComponentsScreenV2EditSourceName value)?
        editSourceName,
    TResult? Function(DataComponentsScreenV2DeleteSource value)? deleteSource,
    TResult? Function(DataComponentsScreenV2DeleteComponent value)?
        deleteComponent,
    TResult? Function(DataComponentsScreenV2DeleteRequest value)? deleteRequest,
  }) {
    final _that = this;
    switch (_that) {
      case DataComponentsScreenV2IInit() when init != null:
        return init(_that);
      case DataComponentsScreenV2AddSource() when addSource != null:
        return addSource(_that);
      case DataComponentsScreenV2EditSourceName() when editSourceName != null:
        return editSourceName(_that);
      case DataComponentsScreenV2DeleteSource() when deleteSource != null:
        return deleteSource(_that);
      case DataComponentsScreenV2DeleteComponent() when deleteComponent != null:
        return deleteComponent(_that);
      case DataComponentsScreenV2DeleteRequest() when deleteRequest != null:
        return deleteRequest(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String sourceName)? addSource,
    TResult Function(String sourceName, String newName)? editSourceName,
    TResult Function(String sourceName)? deleteSource,
    TResult Function(Component component)? deleteComponent,
    TResult Function(String sourceName, RequestComponent request,
            bool deleteRequestBodyComponent, bool deleteResponseComponent)?
        deleteRequest,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DataComponentsScreenV2IInit() when init != null:
        return init();
      case DataComponentsScreenV2AddSource() when addSource != null:
        return addSource(_that.sourceName);
      case DataComponentsScreenV2EditSourceName() when editSourceName != null:
        return editSourceName(_that.sourceName, _that.newName);
      case DataComponentsScreenV2DeleteSource() when deleteSource != null:
        return deleteSource(_that.sourceName);
      case DataComponentsScreenV2DeleteComponent() when deleteComponent != null:
        return deleteComponent(_that.component);
      case DataComponentsScreenV2DeleteRequest() when deleteRequest != null:
        return deleteRequest(_that.sourceName, _that.request,
            _that.deleteRequestBodyComponent, _that.deleteResponseComponent);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String sourceName) addSource,
    required TResult Function(String sourceName, String newName) editSourceName,
    required TResult Function(String sourceName) deleteSource,
    required TResult Function(Component component) deleteComponent,
    required TResult Function(String sourceName, RequestComponent request,
            bool deleteRequestBodyComponent, bool deleteResponseComponent)
        deleteRequest,
  }) {
    final _that = this;
    switch (_that) {
      case DataComponentsScreenV2IInit():
        return init();
      case DataComponentsScreenV2AddSource():
        return addSource(_that.sourceName);
      case DataComponentsScreenV2EditSourceName():
        return editSourceName(_that.sourceName, _that.newName);
      case DataComponentsScreenV2DeleteSource():
        return deleteSource(_that.sourceName);
      case DataComponentsScreenV2DeleteComponent():
        return deleteComponent(_that.component);
      case DataComponentsScreenV2DeleteRequest():
        return deleteRequest(_that.sourceName, _that.request,
            _that.deleteRequestBodyComponent, _that.deleteResponseComponent);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String sourceName)? addSource,
    TResult? Function(String sourceName, String newName)? editSourceName,
    TResult? Function(String sourceName)? deleteSource,
    TResult? Function(Component component)? deleteComponent,
    TResult? Function(String sourceName, RequestComponent request,
            bool deleteRequestBodyComponent, bool deleteResponseComponent)?
        deleteRequest,
  }) {
    final _that = this;
    switch (_that) {
      case DataComponentsScreenV2IInit() when init != null:
        return init();
      case DataComponentsScreenV2AddSource() when addSource != null:
        return addSource(_that.sourceName);
      case DataComponentsScreenV2EditSourceName() when editSourceName != null:
        return editSourceName(_that.sourceName, _that.newName);
      case DataComponentsScreenV2DeleteSource() when deleteSource != null:
        return deleteSource(_that.sourceName);
      case DataComponentsScreenV2DeleteComponent() when deleteComponent != null:
        return deleteComponent(_that.component);
      case DataComponentsScreenV2DeleteRequest() when deleteRequest != null:
        return deleteRequest(_that.sourceName, _that.request,
            _that.deleteRequestBodyComponent, _that.deleteResponseComponent);
      case _:
        return null;
    }
  }
}

/// @nodoc

class DataComponentsScreenV2IInit implements DataComponentsScreenV2Event {
  const DataComponentsScreenV2IInit();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataComponentsScreenV2IInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DataComponentsScreenV2Event.init()';
  }
}

/// @nodoc

class DataComponentsScreenV2AddSource implements DataComponentsScreenV2Event {
  const DataComponentsScreenV2AddSource({required this.sourceName});

  final String sourceName;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataComponentsScreenV2AddSourceCopyWith<DataComponentsScreenV2AddSource>
      get copyWith => _$DataComponentsScreenV2AddSourceCopyWithImpl<
          DataComponentsScreenV2AddSource>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataComponentsScreenV2AddSource &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sourceName);

  @override
  String toString() {
    return 'DataComponentsScreenV2Event.addSource(sourceName: $sourceName)';
  }
}

/// @nodoc
abstract mixin class $DataComponentsScreenV2AddSourceCopyWith<$Res>
    implements $DataComponentsScreenV2EventCopyWith<$Res> {
  factory $DataComponentsScreenV2AddSourceCopyWith(
          DataComponentsScreenV2AddSource value,
          $Res Function(DataComponentsScreenV2AddSource) _then) =
      _$DataComponentsScreenV2AddSourceCopyWithImpl;
  @useResult
  $Res call({String sourceName});
}

/// @nodoc
class _$DataComponentsScreenV2AddSourceCopyWithImpl<$Res>
    implements $DataComponentsScreenV2AddSourceCopyWith<$Res> {
  _$DataComponentsScreenV2AddSourceCopyWithImpl(this._self, this._then);

  final DataComponentsScreenV2AddSource _self;
  final $Res Function(DataComponentsScreenV2AddSource) _then;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sourceName = null,
  }) {
    return _then(DataComponentsScreenV2AddSource(
      sourceName: null == sourceName
          ? _self.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DataComponentsScreenV2EditSourceName
    implements DataComponentsScreenV2Event {
  const DataComponentsScreenV2EditSourceName(
      {required this.sourceName, required this.newName});

  final String sourceName;
  final String newName;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataComponentsScreenV2EditSourceNameCopyWith<
          DataComponentsScreenV2EditSourceName>
      get copyWith => _$DataComponentsScreenV2EditSourceNameCopyWithImpl<
          DataComponentsScreenV2EditSourceName>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataComponentsScreenV2EditSourceName &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName) &&
            (identical(other.newName, newName) || other.newName == newName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sourceName, newName);

  @override
  String toString() {
    return 'DataComponentsScreenV2Event.editSourceName(sourceName: $sourceName, newName: $newName)';
  }
}

/// @nodoc
abstract mixin class $DataComponentsScreenV2EditSourceNameCopyWith<$Res>
    implements $DataComponentsScreenV2EventCopyWith<$Res> {
  factory $DataComponentsScreenV2EditSourceNameCopyWith(
          DataComponentsScreenV2EditSourceName value,
          $Res Function(DataComponentsScreenV2EditSourceName) _then) =
      _$DataComponentsScreenV2EditSourceNameCopyWithImpl;
  @useResult
  $Res call({String sourceName, String newName});
}

/// @nodoc
class _$DataComponentsScreenV2EditSourceNameCopyWithImpl<$Res>
    implements $DataComponentsScreenV2EditSourceNameCopyWith<$Res> {
  _$DataComponentsScreenV2EditSourceNameCopyWithImpl(this._self, this._then);

  final DataComponentsScreenV2EditSourceName _self;
  final $Res Function(DataComponentsScreenV2EditSourceName) _then;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sourceName = null,
    Object? newName = null,
  }) {
    return _then(DataComponentsScreenV2EditSourceName(
      sourceName: null == sourceName
          ? _self.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String,
      newName: null == newName
          ? _self.newName
          : newName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DataComponentsScreenV2DeleteSource
    implements DataComponentsScreenV2Event {
  const DataComponentsScreenV2DeleteSource({required this.sourceName});

  final String sourceName;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataComponentsScreenV2DeleteSourceCopyWith<
          DataComponentsScreenV2DeleteSource>
      get copyWith => _$DataComponentsScreenV2DeleteSourceCopyWithImpl<
          DataComponentsScreenV2DeleteSource>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataComponentsScreenV2DeleteSource &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sourceName);

  @override
  String toString() {
    return 'DataComponentsScreenV2Event.deleteSource(sourceName: $sourceName)';
  }
}

/// @nodoc
abstract mixin class $DataComponentsScreenV2DeleteSourceCopyWith<$Res>
    implements $DataComponentsScreenV2EventCopyWith<$Res> {
  factory $DataComponentsScreenV2DeleteSourceCopyWith(
          DataComponentsScreenV2DeleteSource value,
          $Res Function(DataComponentsScreenV2DeleteSource) _then) =
      _$DataComponentsScreenV2DeleteSourceCopyWithImpl;
  @useResult
  $Res call({String sourceName});
}

/// @nodoc
class _$DataComponentsScreenV2DeleteSourceCopyWithImpl<$Res>
    implements $DataComponentsScreenV2DeleteSourceCopyWith<$Res> {
  _$DataComponentsScreenV2DeleteSourceCopyWithImpl(this._self, this._then);

  final DataComponentsScreenV2DeleteSource _self;
  final $Res Function(DataComponentsScreenV2DeleteSource) _then;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sourceName = null,
  }) {
    return _then(DataComponentsScreenV2DeleteSource(
      sourceName: null == sourceName
          ? _self.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DataComponentsScreenV2DeleteComponent
    implements DataComponentsScreenV2Event {
  const DataComponentsScreenV2DeleteComponent({required this.component});

  final Component component;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataComponentsScreenV2DeleteComponentCopyWith<
          DataComponentsScreenV2DeleteComponent>
      get copyWith => _$DataComponentsScreenV2DeleteComponentCopyWithImpl<
          DataComponentsScreenV2DeleteComponent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataComponentsScreenV2DeleteComponent &&
            (identical(other.component, component) ||
                other.component == component));
  }

  @override
  int get hashCode => Object.hash(runtimeType, component);

  @override
  String toString() {
    return 'DataComponentsScreenV2Event.deleteComponent(component: $component)';
  }
}

/// @nodoc
abstract mixin class $DataComponentsScreenV2DeleteComponentCopyWith<$Res>
    implements $DataComponentsScreenV2EventCopyWith<$Res> {
  factory $DataComponentsScreenV2DeleteComponentCopyWith(
          DataComponentsScreenV2DeleteComponent value,
          $Res Function(DataComponentsScreenV2DeleteComponent) _then) =
      _$DataComponentsScreenV2DeleteComponentCopyWithImpl;
  @useResult
  $Res call({Component component});
}

/// @nodoc
class _$DataComponentsScreenV2DeleteComponentCopyWithImpl<$Res>
    implements $DataComponentsScreenV2DeleteComponentCopyWith<$Res> {
  _$DataComponentsScreenV2DeleteComponentCopyWithImpl(this._self, this._then);

  final DataComponentsScreenV2DeleteComponent _self;
  final $Res Function(DataComponentsScreenV2DeleteComponent) _then;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? component = null,
  }) {
    return _then(DataComponentsScreenV2DeleteComponent(
      component: null == component
          ? _self.component
          : component // ignore: cast_nullable_to_non_nullable
              as Component,
    ));
  }
}

/// @nodoc

class DataComponentsScreenV2DeleteRequest
    implements DataComponentsScreenV2Event {
  const DataComponentsScreenV2DeleteRequest(
      {required this.sourceName,
      required this.request,
      this.deleteRequestBodyComponent = false,
      this.deleteResponseComponent = false});

  final String sourceName;
  final RequestComponent request;
  @JsonKey()
  final bool deleteRequestBodyComponent;
  @JsonKey()
  final bool deleteResponseComponent;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataComponentsScreenV2DeleteRequestCopyWith<
          DataComponentsScreenV2DeleteRequest>
      get copyWith => _$DataComponentsScreenV2DeleteRequestCopyWithImpl<
          DataComponentsScreenV2DeleteRequest>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataComponentsScreenV2DeleteRequest &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName) &&
            (identical(other.request, request) || other.request == request) &&
            (identical(other.deleteRequestBodyComponent,
                    deleteRequestBodyComponent) ||
                other.deleteRequestBodyComponent ==
                    deleteRequestBodyComponent) &&
            (identical(
                    other.deleteResponseComponent, deleteResponseComponent) ||
                other.deleteResponseComponent == deleteResponseComponent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sourceName, request,
      deleteRequestBodyComponent, deleteResponseComponent);

  @override
  String toString() {
    return 'DataComponentsScreenV2Event.deleteRequest(sourceName: $sourceName, request: $request, deleteRequestBodyComponent: $deleteRequestBodyComponent, deleteResponseComponent: $deleteResponseComponent)';
  }
}

/// @nodoc
abstract mixin class $DataComponentsScreenV2DeleteRequestCopyWith<$Res>
    implements $DataComponentsScreenV2EventCopyWith<$Res> {
  factory $DataComponentsScreenV2DeleteRequestCopyWith(
          DataComponentsScreenV2DeleteRequest value,
          $Res Function(DataComponentsScreenV2DeleteRequest) _then) =
      _$DataComponentsScreenV2DeleteRequestCopyWithImpl;
  @useResult
  $Res call(
      {String sourceName,
      RequestComponent request,
      bool deleteRequestBodyComponent,
      bool deleteResponseComponent});

  $RequestComponentCopyWith<$Res> get request;
}

/// @nodoc
class _$DataComponentsScreenV2DeleteRequestCopyWithImpl<$Res>
    implements $DataComponentsScreenV2DeleteRequestCopyWith<$Res> {
  _$DataComponentsScreenV2DeleteRequestCopyWithImpl(this._self, this._then);

  final DataComponentsScreenV2DeleteRequest _self;
  final $Res Function(DataComponentsScreenV2DeleteRequest) _then;

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sourceName = null,
    Object? request = null,
    Object? deleteRequestBodyComponent = null,
    Object? deleteResponseComponent = null,
  }) {
    return _then(DataComponentsScreenV2DeleteRequest(
      sourceName: null == sourceName
          ? _self.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String,
      request: null == request
          ? _self.request
          : request // ignore: cast_nullable_to_non_nullable
              as RequestComponent,
      deleteRequestBodyComponent: null == deleteRequestBodyComponent
          ? _self.deleteRequestBodyComponent
          : deleteRequestBodyComponent // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteResponseComponent: null == deleteResponseComponent
          ? _self.deleteResponseComponent
          : deleteResponseComponent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of DataComponentsScreenV2Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RequestComponentCopyWith<$Res> get request {
    return $RequestComponentCopyWith<$Res>(_self.request, (value) {
      return _then(_self.copyWith(request: value));
    });
  }
}

/// @nodoc
mixin _$DataComponentsScreenV2SR {
  String get message;

  /// Create a copy of DataComponentsScreenV2SR
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataComponentsScreenV2SRCopyWith<DataComponentsScreenV2SR> get copyWith =>
      _$DataComponentsScreenV2SRCopyWithImpl<DataComponentsScreenV2SR>(
          this as DataComponentsScreenV2SR, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataComponentsScreenV2SR &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DataComponentsScreenV2SR(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DataComponentsScreenV2SRCopyWith<$Res> {
  factory $DataComponentsScreenV2SRCopyWith(DataComponentsScreenV2SR value,
          $Res Function(DataComponentsScreenV2SR) _then) =
      _$DataComponentsScreenV2SRCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DataComponentsScreenV2SRCopyWithImpl<$Res>
    implements $DataComponentsScreenV2SRCopyWith<$Res> {
  _$DataComponentsScreenV2SRCopyWithImpl(this._self, this._then);

  final DataComponentsScreenV2SR _self;
  final $Res Function(DataComponentsScreenV2SR) _then;

  /// Create a copy of DataComponentsScreenV2SR
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [DataComponentsScreenV2SR].
extension DataComponentsScreenV2SRPatterns on DataComponentsScreenV2SR {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Error() when error != null:
        return error(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Error():
        return error(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Error() when error != null:
        return error(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Error():
        return error(_that.message);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Error implements DataComponentsScreenV2SR {
  const _Error({required this.message});

  @override
  final String message;

  /// Create a copy of DataComponentsScreenV2SR
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DataComponentsScreenV2SR.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $DataComponentsScreenV2SRCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of DataComponentsScreenV2SR
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Error(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$DataComponentsScreenV2State {
  Components get components;
  bool get projectExists;
  bool get swaggerUrlExists;

  /// Create a copy of DataComponentsScreenV2State
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataComponentsScreenV2StateCopyWith<DataComponentsScreenV2State>
      get copyWith => _$DataComponentsScreenV2StateCopyWithImpl<
              DataComponentsScreenV2State>(
          this as DataComponentsScreenV2State, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataComponentsScreenV2State &&
            (identical(other.components, components) ||
                other.components == components) &&
            (identical(other.projectExists, projectExists) ||
                other.projectExists == projectExists) &&
            (identical(other.swaggerUrlExists, swaggerUrlExists) ||
                other.swaggerUrlExists == swaggerUrlExists));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, components, projectExists, swaggerUrlExists);

  @override
  String toString() {
    return 'DataComponentsScreenV2State(components: $components, projectExists: $projectExists, swaggerUrlExists: $swaggerUrlExists)';
  }
}

/// @nodoc
abstract mixin class $DataComponentsScreenV2StateCopyWith<$Res> {
  factory $DataComponentsScreenV2StateCopyWith(
          DataComponentsScreenV2State value,
          $Res Function(DataComponentsScreenV2State) _then) =
      _$DataComponentsScreenV2StateCopyWithImpl;
  @useResult
  $Res call({Components components, bool projectExists, bool swaggerUrlExists});

  $ComponentsCopyWith<$Res> get components;
}

/// @nodoc
class _$DataComponentsScreenV2StateCopyWithImpl<$Res>
    implements $DataComponentsScreenV2StateCopyWith<$Res> {
  _$DataComponentsScreenV2StateCopyWithImpl(this._self, this._then);

  final DataComponentsScreenV2State _self;
  final $Res Function(DataComponentsScreenV2State) _then;

  /// Create a copy of DataComponentsScreenV2State
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? components = null,
    Object? projectExists = null,
    Object? swaggerUrlExists = null,
  }) {
    return _then(_self.copyWith(
      components: null == components
          ? _self.components
          : components // ignore: cast_nullable_to_non_nullable
              as Components,
      projectExists: null == projectExists
          ? _self.projectExists
          : projectExists // ignore: cast_nullable_to_non_nullable
              as bool,
      swaggerUrlExists: null == swaggerUrlExists
          ? _self.swaggerUrlExists
          : swaggerUrlExists // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of DataComponentsScreenV2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ComponentsCopyWith<$Res> get components {
    return $ComponentsCopyWith<$Res>(_self.components, (value) {
      return _then(_self.copyWith(components: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DataComponentsScreenV2State].
extension DataComponentsScreenV2StatePatterns on DataComponentsScreenV2State {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataComponentsScreenV2StateData value)? data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DataComponentsScreenV2StateData() when data != null:
        return data(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataComponentsScreenV2StateData value) data,
  }) {
    final _that = this;
    switch (_that) {
      case DataComponentsScreenV2StateData():
        return data(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataComponentsScreenV2StateData value)? data,
  }) {
    final _that = this;
    switch (_that) {
      case DataComponentsScreenV2StateData() when data != null:
        return data(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Components components, bool projectExists, bool swaggerUrlExists)?
        data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DataComponentsScreenV2StateData() when data != null:
        return data(
            _that.components, _that.projectExists, _that.swaggerUrlExists);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Components components, bool projectExists, bool swaggerUrlExists)
        data,
  }) {
    final _that = this;
    switch (_that) {
      case DataComponentsScreenV2StateData():
        return data(
            _that.components, _that.projectExists, _that.swaggerUrlExists);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Components components, bool projectExists, bool swaggerUrlExists)?
        data,
  }) {
    final _that = this;
    switch (_that) {
      case DataComponentsScreenV2StateData() when data != null:
        return data(
            _that.components, _that.projectExists, _that.swaggerUrlExists);
      case _:
        return null;
    }
  }
}

/// @nodoc

class DataComponentsScreenV2StateData implements DataComponentsScreenV2State {
  const DataComponentsScreenV2StateData(
      {required this.components,
      this.projectExists = false,
      this.swaggerUrlExists = false});

  @override
  final Components components;
  @override
  @JsonKey()
  final bool projectExists;
  @override
  @JsonKey()
  final bool swaggerUrlExists;

  /// Create a copy of DataComponentsScreenV2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataComponentsScreenV2StateDataCopyWith<DataComponentsScreenV2StateData>
      get copyWith => _$DataComponentsScreenV2StateDataCopyWithImpl<
          DataComponentsScreenV2StateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataComponentsScreenV2StateData &&
            (identical(other.components, components) ||
                other.components == components) &&
            (identical(other.projectExists, projectExists) ||
                other.projectExists == projectExists) &&
            (identical(other.swaggerUrlExists, swaggerUrlExists) ||
                other.swaggerUrlExists == swaggerUrlExists));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, components, projectExists, swaggerUrlExists);

  @override
  String toString() {
    return 'DataComponentsScreenV2State.data(components: $components, projectExists: $projectExists, swaggerUrlExists: $swaggerUrlExists)';
  }
}

/// @nodoc
abstract mixin class $DataComponentsScreenV2StateDataCopyWith<$Res>
    implements $DataComponentsScreenV2StateCopyWith<$Res> {
  factory $DataComponentsScreenV2StateDataCopyWith(
          DataComponentsScreenV2StateData value,
          $Res Function(DataComponentsScreenV2StateData) _then) =
      _$DataComponentsScreenV2StateDataCopyWithImpl;
  @override
  @useResult
  $Res call({Components components, bool projectExists, bool swaggerUrlExists});

  @override
  $ComponentsCopyWith<$Res> get components;
}

/// @nodoc
class _$DataComponentsScreenV2StateDataCopyWithImpl<$Res>
    implements $DataComponentsScreenV2StateDataCopyWith<$Res> {
  _$DataComponentsScreenV2StateDataCopyWithImpl(this._self, this._then);

  final DataComponentsScreenV2StateData _self;
  final $Res Function(DataComponentsScreenV2StateData) _then;

  /// Create a copy of DataComponentsScreenV2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? components = null,
    Object? projectExists = null,
    Object? swaggerUrlExists = null,
  }) {
    return _then(DataComponentsScreenV2StateData(
      components: null == components
          ? _self.components
          : components // ignore: cast_nullable_to_non_nullable
              as Components,
      projectExists: null == projectExists
          ? _self.projectExists
          : projectExists // ignore: cast_nullable_to_non_nullable
              as bool,
      swaggerUrlExists: null == swaggerUrlExists
          ? _self.swaggerUrlExists
          : swaggerUrlExists // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of DataComponentsScreenV2State
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ComponentsCopyWith<$Res> get components {
    return $ComponentsCopyWith<$Res>(_self.components, (value) {
      return _then(_self.copyWith(components: value));
    });
  }
}

// dart format on
