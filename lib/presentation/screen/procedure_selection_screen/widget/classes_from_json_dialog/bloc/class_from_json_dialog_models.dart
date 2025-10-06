import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_from_json_dialog_models.freezed.dart';

@freezed
sealed class ClassFromJsonDialogSR with _$ClassFromJsonDialogSR {
  const factory ClassFromJsonDialogSR.success({
    required String generatedCode,
  }) = _ClassFromJsonDialogSRSuccess;
}

class ClassFromJsonDialogState {}
