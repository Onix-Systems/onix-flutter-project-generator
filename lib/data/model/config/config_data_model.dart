import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/data_component/data_component_model.dart';
import 'package:onix_flutter_bricks/data/model/platforms/platforms_data_model.dart';
import 'package:onix_flutter_bricks/data/model/screen/screen_data_model.dart';
import 'package:onix_flutter_bricks/data/model/source/source_data_model.dart';

part 'config_data_model.g.dart';

@JsonSerializable()
class ConfigDataModel {
  final String? localVersion;
  final String? remoteVersion;
  final String? projectPath;
  final String? projectName;
  final bool? projectExist;
  final String? organization;
  final PlatformsDataModel? platforms;
  final bool? flavorize;
  final String? flavor;
  final bool? generateSigningKey;
  final bool? firebaseAuth;
  final bool? useSonar;
  final bool? graphQL;
  final String? router;
  final String? localization;
  final String? theming;
  final List<String>? signingVars;
  final Set<ScreenDataModel>? screens;
  final String? swaggerUrl;
  final Set<DataComponentModel>? dataComponents;
  final Set<SourceDataModel>? sources;

  const ConfigDataModel({
    this.localVersion,
    this.remoteVersion,
    this.projectPath,
    this.projectName,
    this.projectExist,
    this.organization,
    this.platforms,
    this.flavorize,
    this.flavor,
    this.generateSigningKey,
    this.firebaseAuth,
    this.useSonar,
    this.graphQL,
    this.router,
    this.localization,
    this.theming,
    this.signingVars,
    this.screens,
    this.swaggerUrl,
    this.dataComponents,
    this.sources,
  });

  factory ConfigDataModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigDataModelToJson(this);
}
