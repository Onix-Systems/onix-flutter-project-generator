// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Screen _$ScreenFromJson(Map<String, dynamic> json) => Screen(
      name: json['name'] as String,
      state:
          $enumDecodeNullable(_$ScreenStateManagementEnumMap, json['state']) ??
              ScreenStateManagement.none,
      exists: json['exists'] as bool? ?? false,
    );

Map<String, dynamic> _$ScreenToJson(Screen instance) => <String, dynamic>{
      'name': instance.name,
      'state': _$ScreenStateManagementEnumMap[instance.state]!,
      'exists': instance.exists,
    };

const _$ScreenStateManagementEnumMap = {
  ScreenStateManagement.bloc: 'bloc',
  ScreenStateManagement.cubit: 'cubit',
  ScreenStateManagement.none: 'none',
};
