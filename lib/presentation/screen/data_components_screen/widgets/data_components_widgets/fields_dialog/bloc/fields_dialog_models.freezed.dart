// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fields_dialog_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FieldsDialogEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Property> properties, String componentName)
        init,
    required TResult Function(bool isComponent) addField,
    required TResult Function(int index) removeField,
    required TResult Function(int index, Property property) updateField,
    required TResult Function() validate,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Property> properties, String componentName)? init,
    TResult? Function(bool isComponent)? addField,
    TResult? Function(int index)? removeField,
    TResult? Function(int index, Property property)? updateField,
    TResult? Function()? validate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Property> properties, String componentName)? init,
    TResult Function(bool isComponent)? addField,
    TResult Function(int index)? removeField,
    TResult Function(int index, Property property)? updateField,
    TResult Function()? validate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FieldsDialogEventInit value) init,
    required TResult Function(FieldsDialogEventAddField value) addField,
    required TResult Function(FieldsDialogEventRemoveField value) removeField,
    required TResult Function(FieldsDialogEventUpdateField value) updateField,
    required TResult Function(FieldsDialogEventValidate value) validate,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FieldsDialogEventInit value)? init,
    TResult? Function(FieldsDialogEventAddField value)? addField,
    TResult? Function(FieldsDialogEventRemoveField value)? removeField,
    TResult? Function(FieldsDialogEventUpdateField value)? updateField,
    TResult? Function(FieldsDialogEventValidate value)? validate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FieldsDialogEventInit value)? init,
    TResult Function(FieldsDialogEventAddField value)? addField,
    TResult Function(FieldsDialogEventRemoveField value)? removeField,
    TResult Function(FieldsDialogEventUpdateField value)? updateField,
    TResult Function(FieldsDialogEventValidate value)? validate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldsDialogEventCopyWith<$Res> {
  factory $FieldsDialogEventCopyWith(
          FieldsDialogEvent value, $Res Function(FieldsDialogEvent) then) =
      _$FieldsDialogEventCopyWithImpl<$Res, FieldsDialogEvent>;
}

/// @nodoc
class _$FieldsDialogEventCopyWithImpl<$Res, $Val extends FieldsDialogEvent>
    implements $FieldsDialogEventCopyWith<$Res> {
  _$FieldsDialogEventCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FieldsDialogEventInitCopyWith<$Res> {
  factory _$$FieldsDialogEventInitCopyWith(_$FieldsDialogEventInit value,
          $Res Function(_$FieldsDialogEventInit) then) =
      __$$FieldsDialogEventInitCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Property> properties, String componentName});
}

/// @nodoc
class __$$FieldsDialogEventInitCopyWithImpl<$Res>
    extends _$FieldsDialogEventCopyWithImpl<$Res, _$FieldsDialogEventInit>
    implements _$$FieldsDialogEventInitCopyWith<$Res> {
  __$$FieldsDialogEventInitCopyWithImpl(_$FieldsDialogEventInit _value,
      $Res Function(_$FieldsDialogEventInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? properties = null,
    Object? componentName = null,
  }) {
    return _then(_$FieldsDialogEventInit(
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<Property>,
      componentName: null == componentName
          ? _value.componentName
          : componentName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FieldsDialogEventInit implements FieldsDialogEventInit {
  const _$FieldsDialogEventInit(
      {required final List<Property> properties, required this.componentName})
      : _properties = properties;

  final List<Property> _properties;
  @override
  List<Property> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
// ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  final String componentName;

  @override
  String toString() {
    return 'FieldsDialogEvent.init(properties: $properties, componentName: $componentName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldsDialogEventInit &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            (identical(other.componentName, componentName) ||
                other.componentName == componentName));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_properties), componentName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldsDialogEventInitCopyWith<_$FieldsDialogEventInit> get copyWith =>
      __$$FieldsDialogEventInitCopyWithImpl<_$FieldsDialogEventInit>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Property> properties, String componentName)
        init,
    required TResult Function(bool isComponent) addField,
    required TResult Function(int index) removeField,
    required TResult Function(int index, Property property) updateField,
    required TResult Function() validate,
  }) {
    return init(properties, componentName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Property> properties, String componentName)? init,
    TResult? Function(bool isComponent)? addField,
    TResult? Function(int index)? removeField,
    TResult? Function(int index, Property property)? updateField,
    TResult? Function()? validate,
  }) {
    return init?.call(properties, componentName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Property> properties, String componentName)? init,
    TResult Function(bool isComponent)? addField,
    TResult Function(int index)? removeField,
    TResult Function(int index, Property property)? updateField,
    TResult Function()? validate,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(properties, componentName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FieldsDialogEventInit value) init,
    required TResult Function(FieldsDialogEventAddField value) addField,
    required TResult Function(FieldsDialogEventRemoveField value) removeField,
    required TResult Function(FieldsDialogEventUpdateField value) updateField,
    required TResult Function(FieldsDialogEventValidate value) validate,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FieldsDialogEventInit value)? init,
    TResult? Function(FieldsDialogEventAddField value)? addField,
    TResult? Function(FieldsDialogEventRemoveField value)? removeField,
    TResult? Function(FieldsDialogEventUpdateField value)? updateField,
    TResult? Function(FieldsDialogEventValidate value)? validate,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FieldsDialogEventInit value)? init,
    TResult Function(FieldsDialogEventAddField value)? addField,
    TResult Function(FieldsDialogEventRemoveField value)? removeField,
    TResult Function(FieldsDialogEventUpdateField value)? updateField,
    TResult Function(FieldsDialogEventValidate value)? validate,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class FieldsDialogEventInit implements FieldsDialogEvent {
  const factory FieldsDialogEventInit(
      {required final List<Property> properties,
      required final String componentName}) = _$FieldsDialogEventInit;

  List<Property> get properties;
  String get componentName;
  @JsonKey(ignore: true)
  _$$FieldsDialogEventInitCopyWith<_$FieldsDialogEventInit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FieldsDialogEventAddFieldCopyWith<$Res> {
  factory _$$FieldsDialogEventAddFieldCopyWith(
          _$FieldsDialogEventAddField value,
          $Res Function(_$FieldsDialogEventAddField) then) =
      __$$FieldsDialogEventAddFieldCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isComponent});
}

/// @nodoc
class __$$FieldsDialogEventAddFieldCopyWithImpl<$Res>
    extends _$FieldsDialogEventCopyWithImpl<$Res, _$FieldsDialogEventAddField>
    implements _$$FieldsDialogEventAddFieldCopyWith<$Res> {
  __$$FieldsDialogEventAddFieldCopyWithImpl(_$FieldsDialogEventAddField _value,
      $Res Function(_$FieldsDialogEventAddField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isComponent = null,
  }) {
    return _then(_$FieldsDialogEventAddField(
      isComponent: null == isComponent
          ? _value.isComponent
          : isComponent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FieldsDialogEventAddField implements FieldsDialogEventAddField {
  const _$FieldsDialogEventAddField({this.isComponent = false});

  @override
  @JsonKey()
  final bool isComponent;

  @override
  String toString() {
    return 'FieldsDialogEvent.addField(isComponent: $isComponent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldsDialogEventAddField &&
            (identical(other.isComponent, isComponent) ||
                other.isComponent == isComponent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isComponent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldsDialogEventAddFieldCopyWith<_$FieldsDialogEventAddField>
      get copyWith => __$$FieldsDialogEventAddFieldCopyWithImpl<
          _$FieldsDialogEventAddField>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Property> properties, String componentName)
        init,
    required TResult Function(bool isComponent) addField,
    required TResult Function(int index) removeField,
    required TResult Function(int index, Property property) updateField,
    required TResult Function() validate,
  }) {
    return addField(isComponent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Property> properties, String componentName)? init,
    TResult? Function(bool isComponent)? addField,
    TResult? Function(int index)? removeField,
    TResult? Function(int index, Property property)? updateField,
    TResult? Function()? validate,
  }) {
    return addField?.call(isComponent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Property> properties, String componentName)? init,
    TResult Function(bool isComponent)? addField,
    TResult Function(int index)? removeField,
    TResult Function(int index, Property property)? updateField,
    TResult Function()? validate,
    required TResult orElse(),
  }) {
    if (addField != null) {
      return addField(isComponent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FieldsDialogEventInit value) init,
    required TResult Function(FieldsDialogEventAddField value) addField,
    required TResult Function(FieldsDialogEventRemoveField value) removeField,
    required TResult Function(FieldsDialogEventUpdateField value) updateField,
    required TResult Function(FieldsDialogEventValidate value) validate,
  }) {
    return addField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FieldsDialogEventInit value)? init,
    TResult? Function(FieldsDialogEventAddField value)? addField,
    TResult? Function(FieldsDialogEventRemoveField value)? removeField,
    TResult? Function(FieldsDialogEventUpdateField value)? updateField,
    TResult? Function(FieldsDialogEventValidate value)? validate,
  }) {
    return addField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FieldsDialogEventInit value)? init,
    TResult Function(FieldsDialogEventAddField value)? addField,
    TResult Function(FieldsDialogEventRemoveField value)? removeField,
    TResult Function(FieldsDialogEventUpdateField value)? updateField,
    TResult Function(FieldsDialogEventValidate value)? validate,
    required TResult orElse(),
  }) {
    if (addField != null) {
      return addField(this);
    }
    return orElse();
  }
}

abstract class FieldsDialogEventAddField implements FieldsDialogEvent {
  const factory FieldsDialogEventAddField({final bool isComponent}) =
      _$FieldsDialogEventAddField;

  bool get isComponent;
  @JsonKey(ignore: true)
  _$$FieldsDialogEventAddFieldCopyWith<_$FieldsDialogEventAddField>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FieldsDialogEventRemoveFieldCopyWith<$Res> {
  factory _$$FieldsDialogEventRemoveFieldCopyWith(
          _$FieldsDialogEventRemoveField value,
          $Res Function(_$FieldsDialogEventRemoveField) then) =
      __$$FieldsDialogEventRemoveFieldCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$FieldsDialogEventRemoveFieldCopyWithImpl<$Res>
    extends _$FieldsDialogEventCopyWithImpl<$Res,
        _$FieldsDialogEventRemoveField>
    implements _$$FieldsDialogEventRemoveFieldCopyWith<$Res> {
  __$$FieldsDialogEventRemoveFieldCopyWithImpl(
      _$FieldsDialogEventRemoveField _value,
      $Res Function(_$FieldsDialogEventRemoveField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$FieldsDialogEventRemoveField(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FieldsDialogEventRemoveField implements FieldsDialogEventRemoveField {
  const _$FieldsDialogEventRemoveField({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'FieldsDialogEvent.removeField(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldsDialogEventRemoveField &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldsDialogEventRemoveFieldCopyWith<_$FieldsDialogEventRemoveField>
      get copyWith => __$$FieldsDialogEventRemoveFieldCopyWithImpl<
          _$FieldsDialogEventRemoveField>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Property> properties, String componentName)
        init,
    required TResult Function(bool isComponent) addField,
    required TResult Function(int index) removeField,
    required TResult Function(int index, Property property) updateField,
    required TResult Function() validate,
  }) {
    return removeField(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Property> properties, String componentName)? init,
    TResult? Function(bool isComponent)? addField,
    TResult? Function(int index)? removeField,
    TResult? Function(int index, Property property)? updateField,
    TResult? Function()? validate,
  }) {
    return removeField?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Property> properties, String componentName)? init,
    TResult Function(bool isComponent)? addField,
    TResult Function(int index)? removeField,
    TResult Function(int index, Property property)? updateField,
    TResult Function()? validate,
    required TResult orElse(),
  }) {
    if (removeField != null) {
      return removeField(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FieldsDialogEventInit value) init,
    required TResult Function(FieldsDialogEventAddField value) addField,
    required TResult Function(FieldsDialogEventRemoveField value) removeField,
    required TResult Function(FieldsDialogEventUpdateField value) updateField,
    required TResult Function(FieldsDialogEventValidate value) validate,
  }) {
    return removeField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FieldsDialogEventInit value)? init,
    TResult? Function(FieldsDialogEventAddField value)? addField,
    TResult? Function(FieldsDialogEventRemoveField value)? removeField,
    TResult? Function(FieldsDialogEventUpdateField value)? updateField,
    TResult? Function(FieldsDialogEventValidate value)? validate,
  }) {
    return removeField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FieldsDialogEventInit value)? init,
    TResult Function(FieldsDialogEventAddField value)? addField,
    TResult Function(FieldsDialogEventRemoveField value)? removeField,
    TResult Function(FieldsDialogEventUpdateField value)? updateField,
    TResult Function(FieldsDialogEventValidate value)? validate,
    required TResult orElse(),
  }) {
    if (removeField != null) {
      return removeField(this);
    }
    return orElse();
  }
}

abstract class FieldsDialogEventRemoveField implements FieldsDialogEvent {
  const factory FieldsDialogEventRemoveField({required final int index}) =
      _$FieldsDialogEventRemoveField;

  int get index;
  @JsonKey(ignore: true)
  _$$FieldsDialogEventRemoveFieldCopyWith<_$FieldsDialogEventRemoveField>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FieldsDialogEventUpdateFieldCopyWith<$Res> {
  factory _$$FieldsDialogEventUpdateFieldCopyWith(
          _$FieldsDialogEventUpdateField value,
          $Res Function(_$FieldsDialogEventUpdateField) then) =
      __$$FieldsDialogEventUpdateFieldCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, Property property});
}

/// @nodoc
class __$$FieldsDialogEventUpdateFieldCopyWithImpl<$Res>
    extends _$FieldsDialogEventCopyWithImpl<$Res,
        _$FieldsDialogEventUpdateField>
    implements _$$FieldsDialogEventUpdateFieldCopyWith<$Res> {
  __$$FieldsDialogEventUpdateFieldCopyWithImpl(
      _$FieldsDialogEventUpdateField _value,
      $Res Function(_$FieldsDialogEventUpdateField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? property = null,
  }) {
    return _then(_$FieldsDialogEventUpdateField(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      property: null == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as Property,
    ));
  }
}

/// @nodoc

class _$FieldsDialogEventUpdateField implements FieldsDialogEventUpdateField {
  const _$FieldsDialogEventUpdateField(
      {required this.index, required this.property});

  @override
  final int index;
  @override
  final Property property;

  @override
  String toString() {
    return 'FieldsDialogEvent.updateField(index: $index, property: $property)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldsDialogEventUpdateField &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.property, property) ||
                other.property == property));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, property);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldsDialogEventUpdateFieldCopyWith<_$FieldsDialogEventUpdateField>
      get copyWith => __$$FieldsDialogEventUpdateFieldCopyWithImpl<
          _$FieldsDialogEventUpdateField>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Property> properties, String componentName)
        init,
    required TResult Function(bool isComponent) addField,
    required TResult Function(int index) removeField,
    required TResult Function(int index, Property property) updateField,
    required TResult Function() validate,
  }) {
    return updateField(index, property);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Property> properties, String componentName)? init,
    TResult? Function(bool isComponent)? addField,
    TResult? Function(int index)? removeField,
    TResult? Function(int index, Property property)? updateField,
    TResult? Function()? validate,
  }) {
    return updateField?.call(index, property);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Property> properties, String componentName)? init,
    TResult Function(bool isComponent)? addField,
    TResult Function(int index)? removeField,
    TResult Function(int index, Property property)? updateField,
    TResult Function()? validate,
    required TResult orElse(),
  }) {
    if (updateField != null) {
      return updateField(index, property);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FieldsDialogEventInit value) init,
    required TResult Function(FieldsDialogEventAddField value) addField,
    required TResult Function(FieldsDialogEventRemoveField value) removeField,
    required TResult Function(FieldsDialogEventUpdateField value) updateField,
    required TResult Function(FieldsDialogEventValidate value) validate,
  }) {
    return updateField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FieldsDialogEventInit value)? init,
    TResult? Function(FieldsDialogEventAddField value)? addField,
    TResult? Function(FieldsDialogEventRemoveField value)? removeField,
    TResult? Function(FieldsDialogEventUpdateField value)? updateField,
    TResult? Function(FieldsDialogEventValidate value)? validate,
  }) {
    return updateField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FieldsDialogEventInit value)? init,
    TResult Function(FieldsDialogEventAddField value)? addField,
    TResult Function(FieldsDialogEventRemoveField value)? removeField,
    TResult Function(FieldsDialogEventUpdateField value)? updateField,
    TResult Function(FieldsDialogEventValidate value)? validate,
    required TResult orElse(),
  }) {
    if (updateField != null) {
      return updateField(this);
    }
    return orElse();
  }
}

abstract class FieldsDialogEventUpdateField implements FieldsDialogEvent {
  const factory FieldsDialogEventUpdateField(
      {required final int index,
      required final Property property}) = _$FieldsDialogEventUpdateField;

  int get index;
  Property get property;
  @JsonKey(ignore: true)
  _$$FieldsDialogEventUpdateFieldCopyWith<_$FieldsDialogEventUpdateField>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FieldsDialogEventValidateCopyWith<$Res> {
  factory _$$FieldsDialogEventValidateCopyWith(
          _$FieldsDialogEventValidate value,
          $Res Function(_$FieldsDialogEventValidate) then) =
      __$$FieldsDialogEventValidateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FieldsDialogEventValidateCopyWithImpl<$Res>
    extends _$FieldsDialogEventCopyWithImpl<$Res, _$FieldsDialogEventValidate>
    implements _$$FieldsDialogEventValidateCopyWith<$Res> {
  __$$FieldsDialogEventValidateCopyWithImpl(_$FieldsDialogEventValidate _value,
      $Res Function(_$FieldsDialogEventValidate) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FieldsDialogEventValidate implements FieldsDialogEventValidate {
  const _$FieldsDialogEventValidate();

  @override
  String toString() {
    return 'FieldsDialogEvent.validate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldsDialogEventValidate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Property> properties, String componentName)
        init,
    required TResult Function(bool isComponent) addField,
    required TResult Function(int index) removeField,
    required TResult Function(int index, Property property) updateField,
    required TResult Function() validate,
  }) {
    return validate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Property> properties, String componentName)? init,
    TResult? Function(bool isComponent)? addField,
    TResult? Function(int index)? removeField,
    TResult? Function(int index, Property property)? updateField,
    TResult? Function()? validate,
  }) {
    return validate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Property> properties, String componentName)? init,
    TResult Function(bool isComponent)? addField,
    TResult Function(int index)? removeField,
    TResult Function(int index, Property property)? updateField,
    TResult Function()? validate,
    required TResult orElse(),
  }) {
    if (validate != null) {
      return validate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FieldsDialogEventInit value) init,
    required TResult Function(FieldsDialogEventAddField value) addField,
    required TResult Function(FieldsDialogEventRemoveField value) removeField,
    required TResult Function(FieldsDialogEventUpdateField value) updateField,
    required TResult Function(FieldsDialogEventValidate value) validate,
  }) {
    return validate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FieldsDialogEventInit value)? init,
    TResult? Function(FieldsDialogEventAddField value)? addField,
    TResult? Function(FieldsDialogEventRemoveField value)? removeField,
    TResult? Function(FieldsDialogEventUpdateField value)? updateField,
    TResult? Function(FieldsDialogEventValidate value)? validate,
  }) {
    return validate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FieldsDialogEventInit value)? init,
    TResult Function(FieldsDialogEventAddField value)? addField,
    TResult Function(FieldsDialogEventRemoveField value)? removeField,
    TResult Function(FieldsDialogEventUpdateField value)? updateField,
    TResult Function(FieldsDialogEventValidate value)? validate,
    required TResult orElse(),
  }) {
    if (validate != null) {
      return validate(this);
    }
    return orElse();
  }
}

abstract class FieldsDialogEventValidate implements FieldsDialogEvent {
  const factory FieldsDialogEventValidate() = _$FieldsDialogEventValidate;
}

/// @nodoc
mixin _$FieldsDialogSR {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function() validated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function()? validated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function()? validated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_Validated value) validated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_Validated value)? validated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_Validated value)? validated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldsDialogSRCopyWith<$Res> {
  factory $FieldsDialogSRCopyWith(
          FieldsDialogSR value, $Res Function(FieldsDialogSR) then) =
      _$FieldsDialogSRCopyWithImpl<$Res, FieldsDialogSR>;
}

/// @nodoc
class _$FieldsDialogSRCopyWithImpl<$Res, $Val extends FieldsDialogSR>
    implements $FieldsDialogSRCopyWith<$Res> {
  _$FieldsDialogSRCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$_LoadFinishedCopyWithImpl<$Res>
    extends _$FieldsDialogSRCopyWithImpl<$Res, _$_LoadFinished>
    implements _$$_LoadFinishedCopyWith<$Res> {
  __$$_LoadFinishedCopyWithImpl(
      _$_LoadFinished _value, $Res Function(_$_LoadFinished) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadFinished implements _LoadFinished {
  const _$_LoadFinished();

  @override
  String toString() {
    return 'FieldsDialogSR.loadFinished()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadFinished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function() validated,
  }) {
    return loadFinished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function()? validated,
  }) {
    return loadFinished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function()? validated,
    required TResult orElse(),
  }) {
    if (loadFinished != null) {
      return loadFinished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_Validated value) validated,
  }) {
    return loadFinished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_Validated value)? validated,
  }) {
    return loadFinished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_Validated value)? validated,
    required TResult orElse(),
  }) {
    if (loadFinished != null) {
      return loadFinished(this);
    }
    return orElse();
  }
}

abstract class _LoadFinished implements FieldsDialogSR {
  const factory _LoadFinished() = _$_LoadFinished;
}

/// @nodoc
abstract class _$$_ValidatedCopyWith<$Res> {
  factory _$$_ValidatedCopyWith(
          _$_Validated value, $Res Function(_$_Validated) then) =
      __$$_ValidatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ValidatedCopyWithImpl<$Res>
    extends _$FieldsDialogSRCopyWithImpl<$Res, _$_Validated>
    implements _$$_ValidatedCopyWith<$Res> {
  __$$_ValidatedCopyWithImpl(
      _$_Validated _value, $Res Function(_$_Validated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Validated implements _Validated {
  const _$_Validated();

  @override
  String toString() {
    return 'FieldsDialogSR.validated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Validated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFinished,
    required TResult Function() validated,
  }) {
    return validated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFinished,
    TResult? Function()? validated,
  }) {
    return validated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFinished,
    TResult Function()? validated,
    required TResult orElse(),
  }) {
    if (validated != null) {
      return validated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFinished value) loadFinished,
    required TResult Function(_Validated value) validated,
  }) {
    return validated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFinished value)? loadFinished,
    TResult? Function(_Validated value)? validated,
  }) {
    return validated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFinished value)? loadFinished,
    TResult Function(_Validated value)? validated,
    required TResult orElse(),
  }) {
    if (validated != null) {
      return validated(this);
    }
    return orElse();
  }
}

abstract class _Validated implements FieldsDialogSR {
  const factory _Validated() = _$_Validated;
}

/// @nodoc
mixin _$FieldsDialogState {
  dynamic get componentName => throw _privateConstructorUsedError;
  List<Property> get properties => throw _privateConstructorUsedError;
  List<DataComponent> get components => throw _privateConstructorUsedError;
  List<int> get errorIndexes => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic componentName, List<Property> properties,
            List<DataComponent> components, List<int> errorIndexes)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic componentName, List<Property> properties,
            List<DataComponent> components, List<int> errorIndexes)?
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic componentName, List<Property> properties,
            List<DataComponent> components, List<int> errorIndexes)?
        data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FieldsDialogStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FieldsDialogStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FieldsDialogStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FieldsDialogStateCopyWith<FieldsDialogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldsDialogStateCopyWith<$Res> {
  factory $FieldsDialogStateCopyWith(
          FieldsDialogState value, $Res Function(FieldsDialogState) then) =
      _$FieldsDialogStateCopyWithImpl<$Res, FieldsDialogState>;
  @useResult
  $Res call(
      {dynamic componentName,
      List<Property> properties,
      List<DataComponent> components,
      List<int> errorIndexes});
}

/// @nodoc
class _$FieldsDialogStateCopyWithImpl<$Res, $Val extends FieldsDialogState>
    implements $FieldsDialogStateCopyWith<$Res> {
  _$FieldsDialogStateCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? componentName = freezed,
    Object? properties = null,
    Object? components = null,
    Object? errorIndexes = null,
  }) {
    return _then(_value.copyWith(
      componentName: freezed == componentName
          ? _value.componentName
          : componentName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<Property>,
      components: null == components
          ? _value.components
          : components // ignore: cast_nullable_to_non_nullable
              as List<DataComponent>,
      errorIndexes: null == errorIndexes
          ? _value.errorIndexes
          : errorIndexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FieldsDialogStateDataCopyWith<$Res>
    implements $FieldsDialogStateCopyWith<$Res> {
  factory _$$FieldsDialogStateDataCopyWith(_$FieldsDialogStateData value,
          $Res Function(_$FieldsDialogStateData) then) =
      __$$FieldsDialogStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic componentName,
      List<Property> properties,
      List<DataComponent> components,
      List<int> errorIndexes});
}

/// @nodoc
class __$$FieldsDialogStateDataCopyWithImpl<$Res>
    extends _$FieldsDialogStateCopyWithImpl<$Res, _$FieldsDialogStateData>
    implements _$$FieldsDialogStateDataCopyWith<$Res> {
  __$$FieldsDialogStateDataCopyWithImpl(_$FieldsDialogStateData _value,
      $Res Function(_$FieldsDialogStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? componentName = freezed,
    Object? properties = null,
    Object? components = null,
    Object? errorIndexes = null,
  }) {
    return _then(_$FieldsDialogStateData(
      componentName:
          freezed == componentName ? _value.componentName! : componentName,
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<Property>,
      components: null == components
          ? _value._components
          : components // ignore: cast_nullable_to_non_nullable
              as List<DataComponent>,
      errorIndexes: null == errorIndexes
          ? _value._errorIndexes
          : errorIndexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$FieldsDialogStateData implements FieldsDialogStateData {
  const _$FieldsDialogStateData(
      {this.componentName = '',
      final List<Property> properties = const [],
      final List<DataComponent> components = const [],
      final List<int> errorIndexes = const []})
      : _properties = properties,
        _components = components,
        _errorIndexes = errorIndexes;

  @override
  @JsonKey()
  final dynamic componentName;
  final List<Property> _properties;
  @override
  @JsonKey()
  List<Property> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
// ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  final List<DataComponent> _components;
  @override
  @JsonKey()
  List<DataComponent> get components {
    if (_components is EqualUnmodifiableListView) return _components;
// ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_components);
  }

  final List<int> _errorIndexes;
  @override
  @JsonKey()
  List<int> get errorIndexes {
    if (_errorIndexes is EqualUnmodifiableListView) return _errorIndexes;
// ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errorIndexes);
  }

  @override
  String toString() {
    return 'FieldsDialogState.data(componentName: $componentName, properties: $properties, components: $components, errorIndexes: $errorIndexes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldsDialogStateData &&
            const DeepCollectionEquality()
                .equals(other.componentName, componentName) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            const DeepCollectionEquality()
                .equals(other._components, _components) &&
            const DeepCollectionEquality()
                .equals(other._errorIndexes, _errorIndexes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(componentName),
      const DeepCollectionEquality().hash(_properties),
      const DeepCollectionEquality().hash(_components),
      const DeepCollectionEquality().hash(_errorIndexes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldsDialogStateDataCopyWith<_$FieldsDialogStateData> get copyWith =>
      __$$FieldsDialogStateDataCopyWithImpl<_$FieldsDialogStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic componentName, List<Property> properties,
            List<DataComponent> components, List<int> errorIndexes)
        data,
  }) {
    return data(componentName, properties, components, errorIndexes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic componentName, List<Property> properties,
            List<DataComponent> components, List<int> errorIndexes)?
        data,
  }) {
    return data?.call(componentName, properties, components, errorIndexes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic componentName, List<Property> properties,
            List<DataComponent> components, List<int> errorIndexes)?
        data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(componentName, properties, components, errorIndexes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FieldsDialogStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FieldsDialogStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FieldsDialogStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class FieldsDialogStateData implements FieldsDialogState {
  const factory FieldsDialogStateData(
      {final dynamic componentName,
      final List<Property> properties,
      final List<DataComponent> components,
      final List<int> errorIndexes}) = _$FieldsDialogStateData;

  @override
  dynamic get componentName;
  @override
  List<Property> get properties;
  @override
  List<DataComponent> get components;
  @override
  List<int> get errorIndexes;
  @override
  @JsonKey(ignore: true)
  _$$FieldsDialogStateDataCopyWith<_$FieldsDialogStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
