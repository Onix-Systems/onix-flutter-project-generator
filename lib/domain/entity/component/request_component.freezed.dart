// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestComponent {
  String get operationId;
  String get path;
  SwaggerPathRequestType get type;
  String get description;
  RequestBodyComponent? get requestBody;
  List<RequestMultipartComponent> get multipartBody;
  List<RequestQueryComponent> get queryParams;
  List<RequestPathComponent> get pathParams;
  ResponseParamComponent get response;
  bool get fromSwagger;

  /// Create a copy of RequestComponent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RequestComponentCopyWith<RequestComponent> get copyWith =>
      _$RequestComponentCopyWithImpl<RequestComponent>(
          this as RequestComponent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RequestComponent &&
            (identical(other.operationId, operationId) ||
                other.operationId == operationId) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.requestBody, requestBody) ||
                other.requestBody == requestBody) &&
            const DeepCollectionEquality()
                .equals(other.multipartBody, multipartBody) &&
            const DeepCollectionEquality()
                .equals(other.queryParams, queryParams) &&
            const DeepCollectionEquality()
                .equals(other.pathParams, pathParams) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.fromSwagger, fromSwagger) ||
                other.fromSwagger == fromSwagger));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      operationId,
      path,
      type,
      description,
      requestBody,
      const DeepCollectionEquality().hash(multipartBody),
      const DeepCollectionEquality().hash(queryParams),
      const DeepCollectionEquality().hash(pathParams),
      response,
      fromSwagger);
}

/// @nodoc
abstract mixin class $RequestComponentCopyWith<$Res> {
  factory $RequestComponentCopyWith(
          RequestComponent value, $Res Function(RequestComponent) _then) =
      _$RequestComponentCopyWithImpl;
  @useResult
  $Res call(
      {String operationId,
      String path,
      SwaggerPathRequestType type,
      String description,
      RequestBodyComponent? requestBody,
      List<RequestMultipartComponent> multipartBody,
      List<RequestQueryComponent> queryParams,
      List<RequestPathComponent> pathParams,
      ResponseParamComponent response,
      bool fromSwagger});

  $ResponseParamComponentCopyWith<$Res> get response;
}

/// @nodoc
class _$RequestComponentCopyWithImpl<$Res>
    implements $RequestComponentCopyWith<$Res> {
  _$RequestComponentCopyWithImpl(this._self, this._then);

  final RequestComponent _self;
  final $Res Function(RequestComponent) _then;

  /// Create a copy of RequestComponent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operationId = null,
    Object? path = null,
    Object? type = null,
    Object? description = null,
    Object? requestBody = freezed,
    Object? multipartBody = null,
    Object? queryParams = null,
    Object? pathParams = null,
    Object? response = null,
    Object? fromSwagger = null,
  }) {
    return _then(_self.copyWith(
      operationId: null == operationId
          ? _self.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as SwaggerPathRequestType,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      requestBody: freezed == requestBody
          ? _self.requestBody
          : requestBody // ignore: cast_nullable_to_non_nullable
              as RequestBodyComponent?,
      multipartBody: null == multipartBody
          ? _self.multipartBody
          : multipartBody // ignore: cast_nullable_to_non_nullable
              as List<RequestMultipartComponent>,
      queryParams: null == queryParams
          ? _self.queryParams
          : queryParams // ignore: cast_nullable_to_non_nullable
              as List<RequestQueryComponent>,
      pathParams: null == pathParams
          ? _self.pathParams
          : pathParams // ignore: cast_nullable_to_non_nullable
              as List<RequestPathComponent>,
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as ResponseParamComponent,
      fromSwagger: null == fromSwagger
          ? _self.fromSwagger
          : fromSwagger // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of RequestComponent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseParamComponentCopyWith<$Res> get response {
    return $ResponseParamComponentCopyWith<$Res>(_self.response, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RequestComponent].
extension RequestComponentPatterns on RequestComponent {
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
    TResult Function(_RequestComponent value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RequestComponent() when $default != null:
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
    TResult Function(_RequestComponent value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RequestComponent():
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
    TResult? Function(_RequestComponent value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RequestComponent() when $default != null:
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
            String operationId,
            String path,
            SwaggerPathRequestType type,
            String description,
            RequestBodyComponent? requestBody,
            List<RequestMultipartComponent> multipartBody,
            List<RequestQueryComponent> queryParams,
            List<RequestPathComponent> pathParams,
            ResponseParamComponent response,
            bool fromSwagger)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RequestComponent() when $default != null:
        return $default(
            _that.operationId,
            _that.path,
            _that.type,
            _that.description,
            _that.requestBody,
            _that.multipartBody,
            _that.queryParams,
            _that.pathParams,
            _that.response,
            _that.fromSwagger);
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
            String operationId,
            String path,
            SwaggerPathRequestType type,
            String description,
            RequestBodyComponent? requestBody,
            List<RequestMultipartComponent> multipartBody,
            List<RequestQueryComponent> queryParams,
            List<RequestPathComponent> pathParams,
            ResponseParamComponent response,
            bool fromSwagger)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RequestComponent():
        return $default(
            _that.operationId,
            _that.path,
            _that.type,
            _that.description,
            _that.requestBody,
            _that.multipartBody,
            _that.queryParams,
            _that.pathParams,
            _that.response,
            _that.fromSwagger);
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
            String operationId,
            String path,
            SwaggerPathRequestType type,
            String description,
            RequestBodyComponent? requestBody,
            List<RequestMultipartComponent> multipartBody,
            List<RequestQueryComponent> queryParams,
            List<RequestPathComponent> pathParams,
            ResponseParamComponent response,
            bool fromSwagger)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RequestComponent() when $default != null:
        return $default(
            _that.operationId,
            _that.path,
            _that.type,
            _that.description,
            _that.requestBody,
            _that.multipartBody,
            _that.queryParams,
            _that.pathParams,
            _that.response,
            _that.fromSwagger);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RequestComponent extends RequestComponent {
  const _RequestComponent(
      {required this.operationId,
      required this.path,
      required this.type,
      required this.description,
      required this.requestBody,
      required final List<RequestMultipartComponent> multipartBody,
      required final List<RequestQueryComponent> queryParams,
      required final List<RequestPathComponent> pathParams,
      required this.response,
      this.fromSwagger = true})
      : _multipartBody = multipartBody,
        _queryParams = queryParams,
        _pathParams = pathParams,
        super._();

  @override
  final String operationId;
  @override
  final String path;
  @override
  final SwaggerPathRequestType type;
  @override
  final String description;
  @override
  final RequestBodyComponent? requestBody;
  final List<RequestMultipartComponent> _multipartBody;
  @override
  List<RequestMultipartComponent> get multipartBody {
    if (_multipartBody is EqualUnmodifiableListView) return _multipartBody;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_multipartBody);
  }

  final List<RequestQueryComponent> _queryParams;
  @override
  List<RequestQueryComponent> get queryParams {
    if (_queryParams is EqualUnmodifiableListView) return _queryParams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queryParams);
  }

  final List<RequestPathComponent> _pathParams;
  @override
  List<RequestPathComponent> get pathParams {
    if (_pathParams is EqualUnmodifiableListView) return _pathParams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pathParams);
  }

  @override
  final ResponseParamComponent response;
  @override
  @JsonKey()
  final bool fromSwagger;

  /// Create a copy of RequestComponent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RequestComponentCopyWith<_RequestComponent> get copyWith =>
      __$RequestComponentCopyWithImpl<_RequestComponent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RequestComponent &&
            (identical(other.operationId, operationId) ||
                other.operationId == operationId) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.requestBody, requestBody) ||
                other.requestBody == requestBody) &&
            const DeepCollectionEquality()
                .equals(other._multipartBody, _multipartBody) &&
            const DeepCollectionEquality()
                .equals(other._queryParams, _queryParams) &&
            const DeepCollectionEquality()
                .equals(other._pathParams, _pathParams) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.fromSwagger, fromSwagger) ||
                other.fromSwagger == fromSwagger));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      operationId,
      path,
      type,
      description,
      requestBody,
      const DeepCollectionEquality().hash(_multipartBody),
      const DeepCollectionEquality().hash(_queryParams),
      const DeepCollectionEquality().hash(_pathParams),
      response,
      fromSwagger);
}

/// @nodoc
abstract mixin class _$RequestComponentCopyWith<$Res>
    implements $RequestComponentCopyWith<$Res> {
  factory _$RequestComponentCopyWith(
          _RequestComponent value, $Res Function(_RequestComponent) _then) =
      __$RequestComponentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String operationId,
      String path,
      SwaggerPathRequestType type,
      String description,
      RequestBodyComponent? requestBody,
      List<RequestMultipartComponent> multipartBody,
      List<RequestQueryComponent> queryParams,
      List<RequestPathComponent> pathParams,
      ResponseParamComponent response,
      bool fromSwagger});

  @override
  $ResponseParamComponentCopyWith<$Res> get response;
}

/// @nodoc
class __$RequestComponentCopyWithImpl<$Res>
    implements _$RequestComponentCopyWith<$Res> {
  __$RequestComponentCopyWithImpl(this._self, this._then);

  final _RequestComponent _self;
  final $Res Function(_RequestComponent) _then;

  /// Create a copy of RequestComponent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? operationId = null,
    Object? path = null,
    Object? type = null,
    Object? description = null,
    Object? requestBody = freezed,
    Object? multipartBody = null,
    Object? queryParams = null,
    Object? pathParams = null,
    Object? response = null,
    Object? fromSwagger = null,
  }) {
    return _then(_RequestComponent(
      operationId: null == operationId
          ? _self.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as SwaggerPathRequestType,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      requestBody: freezed == requestBody
          ? _self.requestBody
          : requestBody // ignore: cast_nullable_to_non_nullable
              as RequestBodyComponent?,
      multipartBody: null == multipartBody
          ? _self._multipartBody
          : multipartBody // ignore: cast_nullable_to_non_nullable
              as List<RequestMultipartComponent>,
      queryParams: null == queryParams
          ? _self._queryParams
          : queryParams // ignore: cast_nullable_to_non_nullable
              as List<RequestQueryComponent>,
      pathParams: null == pathParams
          ? _self._pathParams
          : pathParams // ignore: cast_nullable_to_non_nullable
              as List<RequestPathComponent>,
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as ResponseParamComponent,
      fromSwagger: null == fromSwagger
          ? _self.fromSwagger
          : fromSwagger // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of RequestComponent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseParamComponentCopyWith<$Res> get response {
    return $ResponseParamComponentCopyWith<$Res>(_self.response, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

// dart format on
