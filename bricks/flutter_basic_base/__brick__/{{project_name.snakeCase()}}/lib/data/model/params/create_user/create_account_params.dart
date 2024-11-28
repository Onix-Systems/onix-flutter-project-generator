import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_params.freezed.dart';

@freezed
class CreateAccountParams with _$CreateAccountParams {
  const factory CreateAccountParams({
    required String email,
    required String password,
  }) = _CreateAccountParams;
}
