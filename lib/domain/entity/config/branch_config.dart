import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_config.freezed.dart';
part 'branch_config.g.dart';

@freezed
class BranchConfig with _$BranchConfig {
  const factory BranchConfig({
    @Default('main') String branch,
    @Default('') String localVersion,
    @Default('') String remoteVersion,
  }) = _BranchConfig;

  factory BranchConfig.fromJson(Map<String, dynamic> json) =>
      _$BranchConfigFromJson(json);
}
