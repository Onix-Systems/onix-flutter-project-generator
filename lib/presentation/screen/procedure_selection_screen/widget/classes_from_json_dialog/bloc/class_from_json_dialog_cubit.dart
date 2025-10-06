import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/service/json_parser/json_parser.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/widget/classes_from_json_dialog/bloc/class_from_json_dialog_models.dart';

class ClassFromJsonDialogCubit
    extends BaseCubit<ClassFromJsonDialogState, ClassFromJsonDialogSR> {
  ClassFromJsonDialogCubit() : super(ClassFromJsonDialogState());

  String generate({required String json, String? className}) {
    final generatedCode = _generateClassesFromJson(
      json: json,
      name: className == null || className.isEmpty ? null : className,
    );

    addSr(ClassFromJsonDialogSR.success(generatedCode: generatedCode));

    return generatedCode;
  }

  String _generateClassesFromJson({required String json, String? name}) {
    final parsedResult = JsonParser.parseJson(json, name);

    if (parsedResult.isError) {
      onFailure(
        parsedResult.asError.error,
      );
      return '';
    }

    final parsed = parsedResult.data;
    final classes = parsed.sublist(1);

    final filteredClasses = <DataObjectComponent>{};

    for (final clazz in classes) {
      if (!filteredClasses.any((e) => e.name == clazz.name)) {
        filteredClasses.add(clazz);
      }
    }

    final result = <String>[
      parsed.first.basicObjectBody,
      ...filteredClasses.map((e) => e.basicObjectBody),
    ];

    return result.join('\n');
  }
}
