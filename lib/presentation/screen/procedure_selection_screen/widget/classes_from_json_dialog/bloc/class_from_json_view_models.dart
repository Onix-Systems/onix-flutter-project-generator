import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_from_json_view_models.freezed.dart';

@freezed
class ClassFromJsonViewSR with _$ClassFromJsonViewSR {
  const factory ClassFromJsonViewSR.success() = _ClassFromJsonViewSRSuccess;
}

@freezed
class ClassFromJsonViewState with _$ClassFromJsonViewState {
  const factory ClassFromJsonViewState({
    @Default('') String json,
    @Default('GeneratedClass') String className,
    @Default('') String generatedCode,
  }) = _ClassFromJsonViewState;
}
