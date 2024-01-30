import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_style_metadata.freezed.dart';

// https://www.figma.com/developers/api#style-type
@freezed
class TypeStyleMetadata with _$TypeStyleMetadata {
  const factory TypeStyleMetadata({
    required String fontFamily,
    required num fontWeight,
    required num fontSize,
    required num letterSpacing,
  }) = _TypeStyleMetadata;
}
