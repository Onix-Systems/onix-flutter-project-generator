// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Screen _$ScreenFromJson(Map<String, dynamic> json) => Screen(
      name: json['name'] as String,
      bloc: json['bloc'] as bool? ?? false,
      exists: json['exists'] as bool? ?? false,
    );

Map<String, dynamic> _$ScreenToJson(Screen instance) => <String, dynamic>{
      'name': instance.name,
      'bloc': instance.bloc,
      'exists': instance.exists,
    };
