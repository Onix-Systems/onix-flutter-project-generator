// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BranchConfig _$BranchConfigFromJson(Map<String, dynamic> json) =>
    _BranchConfig(
      branch: json['branch'] as String? ?? 'main',
      localVersion: json['localVersion'] as String? ?? '',
      remoteVersion: json['remoteVersion'] as String? ?? '',
    );

Map<String, dynamic> _$BranchConfigToJson(_BranchConfig instance) =>
    <String, dynamic>{
      'branch': instance.branch,
      'localVersion': instance.localVersion,
      'remoteVersion': instance.remoteVersion,
    };
