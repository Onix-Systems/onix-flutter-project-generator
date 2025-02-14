import 'package:collection/collection.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_component_dialog/bloc/component_dialog_models.dart';

class ComponentDialogCubit
    extends BaseCubit<ComponentDialogState, ComponentDialogSR> {
  ComponentDialogCubit() : super(const ComponentDialogState());

  void init(Components components) {
    final enums = components.enums.map((e) => e.name).toList();
    final dataObjects =
        components.dataObjects.map((e) => e.fileReference.reference).toList();

    final componentNames = [...enums, ...dataObjects].sorted(
      (a, b) => a.compareTo(b),
    );

    emit(
      state.copyWith(
        components: componentNames,
      ),
    );
  }
}
