import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

mixin SignalsContentMixin on ScreenGenerationService {
  String createSignalsModel({
    required String projectName,
    required String screenName,
  }) {
    final codeLines = List<String>.empty(growable: true)
      ..add("import 'package:onix_flutter_signals/onix_flutter_signals.dart';")
      ..add("import 'package:signals/signals_flutter.dart';")
      ..addNewLine()
      ..add(
        'class ${screenName.pascalCase}ScreenModel extends SignalModel {',
      )
      ..add('final Signal<int> counter = signal(0);')
      ..addNewLine()
      ..add('${screenName.pascalCase}ScreenModel() {')
      ..add('computedValue = computed(() => counter.value);')
      ..add('init();')
      ..add('}')
      ..addNewLine()
      ..add('void init() {')
      ..add('//state = state.copyWith(count: state.count + 1);')
      ..add('}')
      ..addNewLine()
      ..add('//void increment() {')
      ..add('//state = state.copyWith(count: state.count + 1);')
      ..add('//}')
      ..add('}');

    return codeLines.join('\n');
  }
}
