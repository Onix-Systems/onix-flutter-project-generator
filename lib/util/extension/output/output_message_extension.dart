import 'package:onix_flutter_bricks/util/enum/output_type.dart';

extension OutputMessageExtension on String {
  String toInfoMessage() {
    return '${OutputType.info.tag}$this';
  }

  String toErrorMessage() {
    return '${OutputType.error.tag}$this';
  }

  String toProgressMessage() {
    return '${OutputType.progress.tag}$this';
  }
}
