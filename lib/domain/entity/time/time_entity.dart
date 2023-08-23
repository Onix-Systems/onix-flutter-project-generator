import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_entity.freezed.dart';

@freezed
class TimeEntity with _$TimeEntity {
  const factory TimeEntity({
    required DateTime currentDateTime,
  }) = _TimeEntity;
}
