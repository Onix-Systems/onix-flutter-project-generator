import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';

part 'add_request_dialog_models.freezed.dart';

@freezed
class AddRequestDialogSR with _$AddRequestDialogSR {
  const factory AddRequestDialogSR.success() = _AddRequestDialogSRSuccess;
}

@freezed
class AddRequestDialogState with _$AddRequestDialogState {
  const factory AddRequestDialogState({
    required RequestComponent request,
    @Default('') String sourceName,
    @Default([]) List<String> components,
    Component? bodyComponent,
  }) = _AddRequestDialogState;
}
