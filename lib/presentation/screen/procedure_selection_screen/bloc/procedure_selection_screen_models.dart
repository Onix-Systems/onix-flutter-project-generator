import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/config/fingerprint.dart';
import 'package:onix_flutter_bricks/domain/entity/config/output_line.dart';

part 'procedure_selection_screen_models.freezed.dart';

@freezed
class ProcedureSelectionScreenEvent with _$ProcedureSelectionScreenEvent {
  const factory ProcedureSelectionScreenEvent.init({
    required Config config,
  }) = ProcedureSelectionScreenEventInit;

  const factory ProcedureSelectionScreenEvent.onNewProject({
    required String projectPath,
  }) = ProcedureSelectionScreenEventOnNewProject;

  const factory ProcedureSelectionScreenEvent.onProjectOpen({
    required String projectURI,
  }) = ProcedureSelectionScreenEventOnProjectOpen;

  const factory ProcedureSelectionScreenEvent.onLocaleChange({
    required String language,
  }) = ProcedureSelectionScreenEventOnLocaleChange;

  const factory ProcedureSelectionScreenEvent.onGenerateAndroidSigning({
    required Directory directory,
    required List<String> signingVars,
    required bool overwrite,
  }) = ProcedureSelectionScreenEventOnAndroidSigning;

  const factory ProcedureSelectionScreenEvent.onGenerateFlavors({
    required Directory directory,
    required Set<String> flavors,
  }) = ProcedureSelectionScreenEventOnGenerateFlavors;

  const factory ProcedureSelectionScreenEvent.onOpenInStudio() =
      ProcedureSelectionScreenEventOpenProjectInStudio;

  const factory ProcedureSelectionScreenEvent.onFlavorizrOutputClose() =
      ProcedureSelectionScreenEventOnFlavorizrOutputClose;
}

@freezed
class ProcedureSelectionScreenSR with _$ProcedureSelectionScreenSR {
  const factory ProcedureSelectionScreenSR.loadFinished() = _LoadFinished;

  const factory ProcedureSelectionScreenSR.emptyConfig() = _EmptyConfig;

  const factory ProcedureSelectionScreenSR.onNewProject() = _onNewProject;

  const factory ProcedureSelectionScreenSR.onAndroidSigningCreated({
    required List<Fingerprint> fingerprints,
  }) = _onAndroidSigningCreated;
}

@freezed
class ProcedureSelectionScreenState with _$ProcedureSelectionScreenState {
  const factory ProcedureSelectionScreenState.data({
    required Config config,
    @Default('en') language,
    Directory? flavorizingDirectory,
    Stream<List<OutputLine>>? outputStream,
    @Default(false) bool flavorizrOutputVisible,
    @Default(false) bool isGenerating,
  }) = ProcedureSelectionScreenStateData;
}
