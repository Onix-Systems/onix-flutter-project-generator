import 'package:freezed_annotation/freezed_annotation.dart';

part 'time.freezed.dart';

part 'time.g.dart';

@freezed
class Time with _$Time {
  const factory Time({
    required DateTime currentDateTime,
  }) = _Time;

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);

  factory Time.empty() => Time(
        currentDateTime: DateTime(0),
      );
}
