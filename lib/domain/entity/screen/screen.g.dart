// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Screen _$ScreenFromJson(Map<String, dynamic> json) => Screen(
      name: json['name'] as String,
      stateManager: json['stateManager'] as String? ?? '',
      exists: json['exists'] as bool? ?? false,
      initial: json['initial'] as bool? ?? false,
    );

Map<String, dynamic> _$ScreenToJson(Screen instance) => <String, dynamic>{
      'name': instance.name,
      'stateManager': instance.stateManager,
      'exists': instance.exists,
      'initial': instance.initial,
    };
