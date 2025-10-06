import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';

part 'add_request_params_dialog_models.freezed.dart';

@freezed
sealed class AddRequestParamsDialogSR with _$AddRequestParamsDialogSR {
  const factory AddRequestParamsDialogSR.success() =
      _AddRequestParamsDialogSRSuccess;
}

@freezed
sealed class AddRequestParamsDialogState with _$AddRequestParamsDialogState {
  const factory AddRequestParamsDialogState({
    @Default([]) List<RequestParamComponent> params,
    @Default([]) List<String> types,
  }) = _AddRequestParamsDialogState;
}
