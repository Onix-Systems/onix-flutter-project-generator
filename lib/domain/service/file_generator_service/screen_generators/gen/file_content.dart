import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:recase/recase.dart';

class FileContent {
  static String bloc(
          {required String projectName,
          required String screenName,
          required ScreenStateManagement stateManagement}) =>
      '''import 'dart:async';

import 'package:$projectName/core/arch/bloc/base_${stateManagement.name}.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:$projectName/presentation/screen/${screenName}_screen/bloc/${screenName}_screen_imports.dart';

class ${screenName.pascalCase}Screen${stateManagement.name.pascalCase} extends Base${stateManagement.name.pascalCase}<${stateManagement == ScreenStateManagement.bloc ? '${screenName.pascalCase}ScreenEvent, ' : ''}${screenName.pascalCase}ScreenState, ${screenName.pascalCase}ScreenSR> {
  ${screenName.pascalCase}Screen${stateManagement.name.pascalCase}() : super(${screenName.pascalCase}ScreenState()) {
    ${stateManagement == ScreenStateManagement.bloc ? 'on<${screenName.pascalCase}ScreenEventInit>(_onInit);' : ''}
    ${stateManagement == ScreenStateManagement.bloc ? 'add(const ${screenName.pascalCase}ScreenEvent.init());' : ''}
  }

  FutureOr<void> ${stateManagement == ScreenStateManagement.bloc ? '_onInit' : 'init'} (
    ${stateManagement == ScreenStateManagement.bloc ? '${screenName.pascalCase}ScreenEventInit event,' : ''}
    ${stateManagement == ScreenStateManagement.bloc ? 'Emitter<${screenName.pascalCase}ScreenState> emit,' : ''}
  ) {
    ${stateManagement == ScreenStateManagement.cubit ? 'emit(state.copyWith(isLoading: false));' : ''}  
  }

}
''';

  static String models(
          {required String screenName,
          required ScreenStateManagement stateManagement}) =>
      '''import 'package:freezed_annotation/freezed_annotation.dart';

part '${screenName}_screen_models.freezed.dart';

${stateManagement == ScreenStateManagement.bloc ? '''@freezed
class ${screenName.pascalCase}ScreenEvent with _\$${screenName.pascalCase}ScreenEvent {
  const factory ${screenName.pascalCase}ScreenEvent.init() = ${screenName.pascalCase}ScreenEventInit;
}''' : ''}

@freezed
class ${screenName.pascalCase}ScreenSR with _\$${screenName.pascalCase}ScreenSR {
  const factory ${screenName.pascalCase}ScreenSR.loadFinished() = _LoadFinished;
}

${stateManagement == ScreenStateManagement.bloc ? 'class ${screenName.pascalCase}ScreenState {}' : '''@freezed
class ${screenName.pascalCase}ScreenState with _\$${screenName.pascalCase}ScreenState{
const factory ${screenName.pascalCase}ScreenState({
    @Default(true) bool isLoading,
  }) = _${screenName.pascalCase}ScreenState;
  }'''}
''';

  static String screenNoBloc(
          {required bool isGoRouter, required String screenName}) =>
      '''${isGoRouter ? 'import \'package:go_router/go_router.dart\';' : 'import \'package:auto_route/auto_route.dart\';'}
import 'package:flutter/material.dart';

${isGoRouter ? '' : '@RoutePage()'}
class ${screenName.pascalCase}Screen extends StatelessWidget {
  const ${screenName.pascalCase}Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('${screenName.pascalCase} screen')),
    );
  }
}''';

  static String screenBloc(
          {required bool isGoRouter,
          required String screenName,
          required String projectName,
          required ScreenStateManagement stateManagement}) =>
      '''${isGoRouter ? 'import \'package:go_router/go_router.dart\';' : 'import \'package:auto_route/auto_route.dart\';'}
${stateManagement == ScreenStateManagement.bloc ? 'import \'package:$projectName/core/arch/bloc/base_block_state.dart\';' : 'import \'package:$projectName/core/arch/bloc/base_cubit_state.dart\';'}
import 'package:flutter/material.dart';
import 'package:$projectName/presentation/screen/${screenName}_screen/bloc/${screenName}_screen_imports.dart';

${isGoRouter ? '' : '@RoutePage()'}
class ${screenName.pascalCase}Screen extends StatefulWidget {
  const ${screenName.pascalCase}Screen({
    super.key,
  });

  @override
  State<${screenName.pascalCase}Screen> createState() => _${screenName.pascalCase}ScreenState();
}

class _${screenName.pascalCase}ScreenState
    extends Base${stateManagement == ScreenStateManagement.cubit ? 'Cubit' : ''}State<${screenName.pascalCase}ScreenState, ${screenName.pascalCase}Screen${stateManagement.name.pascalCase}, ${screenName.pascalCase}ScreenSR, ${screenName.pascalCase}Screen> {
  @override
  Widget buildWidget(BuildContext context) {
    return srObserver(
      context: context,
      child: Scaffold(
        body: SizedBox.expand(
          child: blocConsumer(
            stateListener: (state) => _buildMainContainer(context, state),
          ),
        ),
      ),
      onSR: _onSingleResult,
    );
  }

  void _onSingleResult(BuildContext context, ${screenName.pascalCase}ScreenSR singleResult) {
    singleResult.when(
      loadFinished: () {
        
      },
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    ${screenName.pascalCase}ScreenState state,
  ) {
    return const Center(
      child: Text('${screenName.pascalCase} screen'),
    );
  }
}
''';
}
