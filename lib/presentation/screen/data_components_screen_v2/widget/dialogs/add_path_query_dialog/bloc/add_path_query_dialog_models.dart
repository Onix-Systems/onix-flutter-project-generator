import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';

part 'add_path_query_dialog_models.freezed.dart';

@freezed
class AddPathQueryDialogSR with _$AddPathQueryDialogSR {
  const factory AddPathQueryDialogSR.success() = _AddPathQueryDialogSRSuccess;
}

@freezed
class AddPathQueryDialogState with _$AddPathQueryDialogState {
  const factory AddPathQueryDialogState({
    @Default([]) List<RequestParamComponent> params,
  }) = _AddPathQueryDialogState;
}
