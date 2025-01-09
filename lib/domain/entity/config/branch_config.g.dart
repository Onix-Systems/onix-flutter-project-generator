// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BranchConfigImpl _$$BranchConfigImplFromJson(Map<String, dynamic> json) =>
    _$BranchConfigImpl(
      branch: json['branch'] as String? ?? 'main',
      localVersion: json['localVersion'] as String? ?? '',
      remoteVersion: json['remoteVersion'] as String? ?? '',
    );

Map<String, dynamic> _$$BranchConfigImplToJson(_$BranchConfigImpl instance) =>
    <String, dynamic>{
      'branch': instance.branch,
      'localVersion': instance.localVersion,
      'remoteVersion': instance.remoteVersion,
    };
