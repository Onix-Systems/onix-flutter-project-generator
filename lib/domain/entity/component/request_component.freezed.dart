// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RequestComponent {
  String get operationId => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  SwaggerPathRequestType get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  RequestBodyComponent? get requestBody => throw _privateConstructorUsedError;
  List<RequestMultipartComponent> get multipartBody =>
      throw _privateConstructorUsedError;
  List<RequestQueryComponent> get queryParams =>
      throw _privateConstructorUsedError;
  List<RequestPathComponent> get pathParams =>
      throw _privateConstructorUsedError;
  ResponseParamComponent get response => throw _privateConstructorUsedError;

  /// Create a copy of RequestComponent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestComponentCopyWith<RequestComponent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestComponentCopyWith<$Res> {
  factory $RequestComponentCopyWith(
          RequestComponent value, $Res Function(RequestComponent) then) =
      _$RequestComponentCopyWithImpl<$Res, RequestComponent>;
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
      ResponseParamComponent response});

  $ResponseParamComponentCopyWith<$Res> get response;
}

/// @nodoc
class _$RequestComponentCopyWithImpl<$Res, $Val extends RequestComponent>
    implements $RequestComponentCopyWith<$Res> {
  _$RequestComponentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
  }) {
    return _then(_value.copyWith(
      operationId: null == operationId
          ? _value.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SwaggerPathRequestType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      requestBody: freezed == requestBody
          ? _value.requestBody
          : requestBody // ignore: cast_nullable_to_non_nullable
              as RequestBodyComponent?,
      multipartBody: null == multipartBody
          ? _value.multipartBody
          : multipartBody // ignore: cast_nullable_to_non_nullable
              as List<RequestMultipartComponent>,
      queryParams: null == queryParams
          ? _value.queryParams
          : queryParams // ignore: cast_nullable_to_non_nullable
              as List<RequestQueryComponent>,
      pathParams: null == pathParams
          ? _value.pathParams
          : pathParams // ignore: cast_nullable_to_non_nullable
              as List<RequestPathComponent>,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ResponseParamComponent,
    ) as $Val);
  }

  /// Create a copy of RequestComponent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseParamComponentCopyWith<$Res> get response {
    return $ResponseParamComponentCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RequestComponentImplCopyWith<$Res>
    implements $RequestComponentCopyWith<$Res> {
  factory _$$RequestComponentImplCopyWith(_$RequestComponentImpl value,
          $Res Function(_$RequestComponentImpl) then) =
      __$$RequestComponentImplCopyWithImpl<$Res>;
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
      ResponseParamComponent response});

  @override
  $ResponseParamComponentCopyWith<$Res> get response;
}

/// @nodoc
class __$$RequestComponentImplCopyWithImpl<$Res>
    extends _$RequestComponentCopyWithImpl<$Res, _$RequestComponentImpl>
    implements _$$RequestComponentImplCopyWith<$Res> {
  __$$RequestComponentImplCopyWithImpl(_$RequestComponentImpl _value,
      $Res Function(_$RequestComponentImpl) _then)
      : super(_value, _then);

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
  }) {
    return _then(_$RequestComponentImpl(
      operationId: null == operationId
          ? _value.operationId
          : operationId // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SwaggerPathRequestType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      requestBody: freezed == requestBody
          ? _value.requestBody
          : requestBody // ignore: cast_nullable_to_non_nullable
              as RequestBodyComponent?,
      multipartBody: null == multipartBody
          ? _value._multipartBody
          : multipartBody // ignore: cast_nullable_to_non_nullable
              as List<RequestMultipartComponent>,
      queryParams: null == queryParams
          ? _value._queryParams
          : queryParams // ignore: cast_nullable_to_non_nullable
              as List<RequestQueryComponent>,
      pathParams: null == pathParams
          ? _value._pathParams
          : pathParams // ignore: cast_nullable_to_non_nullable
              as List<RequestPathComponent>,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ResponseParamComponent,
    ));
  }
}

/// @nodoc

class _$RequestComponentImpl extends _RequestComponent {
  const _$RequestComponentImpl(
      {required this.operationId,
      required this.path,
      required this.type,
      required this.description,
      required this.requestBody,
      required final List<RequestMultipartComponent> multipartBody,
      required final List<RequestQueryComponent> queryParams,
      required final List<RequestPathComponent> pathParams,
      required this.response})
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
  String toString() {
    return 'RequestComponent(operationId: $operationId, path: $path, type: $type, description: $description, requestBody: $requestBody, multipartBody: $multipartBody, queryParams: $queryParams, pathParams: $pathParams, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestComponentImpl &&
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
                other.response == response));
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
      response);

  /// Create a copy of RequestComponent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestComponentImplCopyWith<_$RequestComponentImpl> get copyWith =>
      __$$RequestComponentImplCopyWithImpl<_$RequestComponentImpl>(
          this, _$identity);
}

abstract class _RequestComponent extends RequestComponent {
  const factory _RequestComponent(
      {required final String operationId,
      required final String path,
      required final SwaggerPathRequestType type,
      required final String description,
      required final RequestBodyComponent? requestBody,
      required final List<RequestMultipartComponent> multipartBody,
      required final List<RequestQueryComponent> queryParams,
      required final List<RequestPathComponent> pathParams,
      required final ResponseParamComponent response}) = _$RequestComponentImpl;
  const _RequestComponent._() : super._();

  @override
  String get operationId;
  @override
  String get path;
  @override
  SwaggerPathRequestType get type;
  @override
  String get description;
  @override
  RequestBodyComponent? get requestBody;
  @override
  List<RequestMultipartComponent> get multipartBody;
  @override
  List<RequestQueryComponent> get queryParams;
  @override
  List<RequestPathComponent> get pathParams;
  @override
  ResponseParamComponent get response;

  /// Create a copy of RequestComponent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestComponentImplCopyWith<_$RequestComponentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
