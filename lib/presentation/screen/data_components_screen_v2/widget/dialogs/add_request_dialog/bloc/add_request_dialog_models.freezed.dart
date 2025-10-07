// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_request_dialog_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddRequestDialogSR {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddRequestDialogSR);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddRequestDialogSR()';
  }
}

/// @nodoc
class $AddRequestDialogSRCopyWith<$Res> {
  $AddRequestDialogSRCopyWith(
      AddRequestDialogSR _, $Res Function(AddRequestDialogSR) __);
}

/// Adds pattern-matching-related methods to [AddRequestDialogSR].
extension AddRequestDialogSRPatterns on AddRequestDialogSR {
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
    TResult Function(_AddRequestDialogSRSuccess value)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestDialogSRSuccess() when success != null:
        return success(_that);
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
    required TResult Function(_AddRequestDialogSRSuccess value) success,
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestDialogSRSuccess():
        return success(_that);
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
    TResult? Function(_AddRequestDialogSRSuccess value)? success,
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestDialogSRSuccess() when success != null:
        return success(_that);
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
    TResult Function()? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestDialogSRSuccess() when success != null:
        return success();
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
    required TResult Function() success,
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestDialogSRSuccess():
        return success();
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
    TResult? Function()? success,
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestDialogSRSuccess() when success != null:
        return success();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddRequestDialogSRSuccess implements AddRequestDialogSR {
  const _AddRequestDialogSRSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddRequestDialogSRSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddRequestDialogSR.success()';
  }
}

/// @nodoc
mixin _$AddRequestDialogState {
  RequestComponent get request;
  String get sourceName;
  List<String> get components;
  Set<DataObjectComponent> get children;
  Component? get bodyComponent;
  Component? get tempBodyComponent;
  Component? get responseComponent;
  Component? get tempResponseComponent;

  /// Create a copy of AddRequestDialogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddRequestDialogStateCopyWith<AddRequestDialogState> get copyWith =>
      _$AddRequestDialogStateCopyWithImpl<AddRequestDialogState>(
          this as AddRequestDialogState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddRequestDialogState &&
            (identical(other.request, request) || other.request == request) &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName) &&
            const DeepCollectionEquality()
                .equals(other.components, components) &&
            const DeepCollectionEquality().equals(other.children, children) &&
            (identical(other.bodyComponent, bodyComponent) ||
                other.bodyComponent == bodyComponent) &&
            (identical(other.tempBodyComponent, tempBodyComponent) ||
                other.tempBodyComponent == tempBodyComponent) &&
            (identical(other.responseComponent, responseComponent) ||
                other.responseComponent == responseComponent) &&
            (identical(other.tempResponseComponent, tempResponseComponent) ||
                other.tempResponseComponent == tempResponseComponent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      request,
      sourceName,
      const DeepCollectionEquality().hash(components),
      const DeepCollectionEquality().hash(children),
      bodyComponent,
      tempBodyComponent,
      responseComponent,
      tempResponseComponent);

  @override
  String toString() {
    return 'AddRequestDialogState(request: $request, sourceName: $sourceName, components: $components, children: $children, bodyComponent: $bodyComponent, tempBodyComponent: $tempBodyComponent, responseComponent: $responseComponent, tempResponseComponent: $tempResponseComponent)';
  }
}

/// @nodoc
abstract mixin class $AddRequestDialogStateCopyWith<$Res> {
  factory $AddRequestDialogStateCopyWith(AddRequestDialogState value,
          $Res Function(AddRequestDialogState) _then) =
      _$AddRequestDialogStateCopyWithImpl;
  @useResult
  $Res call(
      {RequestComponent request,
      String sourceName,
      List<String> components,
      Set<DataObjectComponent> children,
      Component? bodyComponent,
      Component? tempBodyComponent,
      Component? responseComponent,
      Component? tempResponseComponent});

  $RequestComponentCopyWith<$Res> get request;
}

/// @nodoc
class _$AddRequestDialogStateCopyWithImpl<$Res>
    implements $AddRequestDialogStateCopyWith<$Res> {
  _$AddRequestDialogStateCopyWithImpl(this._self, this._then);

  final AddRequestDialogState _self;
  final $Res Function(AddRequestDialogState) _then;

  /// Create a copy of AddRequestDialogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
    Object? sourceName = null,
    Object? components = null,
    Object? children = null,
    Object? bodyComponent = freezed,
    Object? tempBodyComponent = freezed,
    Object? responseComponent = freezed,
    Object? tempResponseComponent = freezed,
  }) {
    return _then(_self.copyWith(
      request: null == request
          ? _self.request
          : request // ignore: cast_nullable_to_non_nullable
              as RequestComponent,
      sourceName: null == sourceName
          ? _self.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String,
      components: null == components
          ? _self.components
          : components // ignore: cast_nullable_to_non_nullable
              as List<String>,
      children: null == children
          ? _self.children
          : children // ignore: cast_nullable_to_non_nullable
              as Set<DataObjectComponent>,
      bodyComponent: freezed == bodyComponent
          ? _self.bodyComponent
          : bodyComponent // ignore: cast_nullable_to_non_nullable
              as Component?,
      tempBodyComponent: freezed == tempBodyComponent
          ? _self.tempBodyComponent
          : tempBodyComponent // ignore: cast_nullable_to_non_nullable
              as Component?,
      responseComponent: freezed == responseComponent
          ? _self.responseComponent
          : responseComponent // ignore: cast_nullable_to_non_nullable
              as Component?,
      tempResponseComponent: freezed == tempResponseComponent
          ? _self.tempResponseComponent
          : tempResponseComponent // ignore: cast_nullable_to_non_nullable
              as Component?,
    ));
  }

  /// Create a copy of AddRequestDialogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RequestComponentCopyWith<$Res> get request {
    return $RequestComponentCopyWith<$Res>(_self.request, (value) {
      return _then(_self.copyWith(request: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AddRequestDialogState].
extension AddRequestDialogStatePatterns on AddRequestDialogState {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AddRequestDialogState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestDialogState() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_AddRequestDialogState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddRequestDialogState():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AddRequestDialogState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddRequestDialogState() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            RequestComponent request,
            String sourceName,
            List<String> components,
            Set<DataObjectComponent> children,
            Component? bodyComponent,
            Component? tempBodyComponent,
            Component? responseComponent,
            Component? tempResponseComponent)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddRequestDialogState() when $default != null:
        return $default(
            _that.request,
            _that.sourceName,
            _that.components,
            _that.children,
            _that.bodyComponent,
            _that.tempBodyComponent,
            _that.responseComponent,
            _that.tempResponseComponent);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            RequestComponent request,
            String sourceName,
            List<String> components,
            Set<DataObjectComponent> children,
            Component? bodyComponent,
            Component? tempBodyComponent,
            Component? responseComponent,
            Component? tempResponseComponent)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddRequestDialogState():
        return $default(
            _that.request,
            _that.sourceName,
            _that.components,
            _that.children,
            _that.bodyComponent,
            _that.tempBodyComponent,
            _that.responseComponent,
            _that.tempResponseComponent);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            RequestComponent request,
            String sourceName,
            List<String> components,
            Set<DataObjectComponent> children,
            Component? bodyComponent,
            Component? tempBodyComponent,
            Component? responseComponent,
            Component? tempResponseComponent)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddRequestDialogState() when $default != null:
        return $default(
            _that.request,
            _that.sourceName,
            _that.components,
            _that.children,
            _that.bodyComponent,
            _that.tempBodyComponent,
            _that.responseComponent,
            _that.tempResponseComponent);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddRequestDialogState implements AddRequestDialogState {
  const _AddRequestDialogState(
      {required this.request,
      this.sourceName = '',
      final List<String> components = const [],
      final Set<DataObjectComponent> children = const {},
      this.bodyComponent,
      this.tempBodyComponent,
      this.responseComponent,
      this.tempResponseComponent})
      : _components = components,
        _children = children;

  @override
  final RequestComponent request;
  @override
  @JsonKey()
  final String sourceName;
  final List<String> _components;
  @override
  @JsonKey()
  List<String> get components {
    if (_components is EqualUnmodifiableListView) return _components;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_components);
  }

  final Set<DataObjectComponent> _children;
  @override
  @JsonKey()
  Set<DataObjectComponent> get children {
    if (_children is EqualUnmodifiableSetView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_children);
  }

  @override
  final Component? bodyComponent;
  @override
  final Component? tempBodyComponent;
  @override
  final Component? responseComponent;
  @override
  final Component? tempResponseComponent;

  /// Create a copy of AddRequestDialogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddRequestDialogStateCopyWith<_AddRequestDialogState> get copyWith =>
      __$AddRequestDialogStateCopyWithImpl<_AddRequestDialogState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddRequestDialogState &&
            (identical(other.request, request) || other.request == request) &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName) &&
            const DeepCollectionEquality()
                .equals(other._components, _components) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.bodyComponent, bodyComponent) ||
                other.bodyComponent == bodyComponent) &&
            (identical(other.tempBodyComponent, tempBodyComponent) ||
                other.tempBodyComponent == tempBodyComponent) &&
            (identical(other.responseComponent, responseComponent) ||
                other.responseComponent == responseComponent) &&
            (identical(other.tempResponseComponent, tempResponseComponent) ||
                other.tempResponseComponent == tempResponseComponent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      request,
      sourceName,
      const DeepCollectionEquality().hash(_components),
      const DeepCollectionEquality().hash(_children),
      bodyComponent,
      tempBodyComponent,
      responseComponent,
      tempResponseComponent);

  @override
  String toString() {
    return 'AddRequestDialogState(request: $request, sourceName: $sourceName, components: $components, children: $children, bodyComponent: $bodyComponent, tempBodyComponent: $tempBodyComponent, responseComponent: $responseComponent, tempResponseComponent: $tempResponseComponent)';
  }
}

/// @nodoc
abstract mixin class _$AddRequestDialogStateCopyWith<$Res>
    implements $AddRequestDialogStateCopyWith<$Res> {
  factory _$AddRequestDialogStateCopyWith(_AddRequestDialogState value,
          $Res Function(_AddRequestDialogState) _then) =
      __$AddRequestDialogStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {RequestComponent request,
      String sourceName,
      List<String> components,
      Set<DataObjectComponent> children,
      Component? bodyComponent,
      Component? tempBodyComponent,
      Component? responseComponent,
      Component? tempResponseComponent});

  @override
  $RequestComponentCopyWith<$Res> get request;
}

/// @nodoc
class __$AddRequestDialogStateCopyWithImpl<$Res>
    implements _$AddRequestDialogStateCopyWith<$Res> {
  __$AddRequestDialogStateCopyWithImpl(this._self, this._then);

  final _AddRequestDialogState _self;
  final $Res Function(_AddRequestDialogState) _then;

  /// Create a copy of AddRequestDialogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? request = null,
    Object? sourceName = null,
    Object? components = null,
    Object? children = null,
    Object? bodyComponent = freezed,
    Object? tempBodyComponent = freezed,
    Object? responseComponent = freezed,
    Object? tempResponseComponent = freezed,
  }) {
    return _then(_AddRequestDialogState(
      request: null == request
          ? _self.request
          : request // ignore: cast_nullable_to_non_nullable
              as RequestComponent,
      sourceName: null == sourceName
          ? _self.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String,
      components: null == components
          ? _self._components
          : components // ignore: cast_nullable_to_non_nullable
              as List<String>,
      children: null == children
          ? _self._children
          : children // ignore: cast_nullable_to_non_nullable
              as Set<DataObjectComponent>,
      bodyComponent: freezed == bodyComponent
          ? _self.bodyComponent
          : bodyComponent // ignore: cast_nullable_to_non_nullable
              as Component?,
      tempBodyComponent: freezed == tempBodyComponent
          ? _self.tempBodyComponent
          : tempBodyComponent // ignore: cast_nullable_to_non_nullable
              as Component?,
      responseComponent: freezed == responseComponent
          ? _self.responseComponent
          : responseComponent // ignore: cast_nullable_to_non_nullable
              as Component?,
      tempResponseComponent: freezed == tempResponseComponent
          ? _self.tempResponseComponent
          : tempResponseComponent // ignore: cast_nullable_to_non_nullable
              as Component?,
    ));
  }

  /// Create a copy of AddRequestDialogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RequestComponentCopyWith<$Res> get request {
    return $RequestComponentCopyWith<$Res>(_self.request, (value) {
      return _then(_self.copyWith(request: value));
    });
  }
}

// dart format on
