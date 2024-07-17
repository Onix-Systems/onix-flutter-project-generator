import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/util/enum/fingerprint_type.dart';

part 'fingerprint.freezed.dart';

@freezed
class Fingerprint with _$Fingerprint {
  const factory Fingerprint({
    required FingerprintType type,
    required String value,
  }) = _Fingerprint;
}
