import 'package:recase/recase.dart';

class FileContent {
  static String bloc(
          {required String projectName, required String screenName}) =>
      '''import 'dart:async';

import 'package:$projectName/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:$projectName/presentation/screen/${screenName}_screen/bloc/${screenName}_screen_bloc_imports.dart';

class ${screenName.pascalCase}ScreenBloc extends BaseBloc<${screenName.pascalCase}ScreenEvent, ${screenName.pascalCase}ScreenState, ${screenName.pascalCase}ScreenSR> {
  ${screenName.pascalCase}ScreenBloc() : super(${screenName.pascalCase}ScreenState()) {
    on<${screenName.pascalCase}ScreenEventInit>(_onInit);
    add(const ${screenName.pascalCase}ScreenEvent.init());
  }

  FutureOr<void> _onInit(
    ${screenName.pascalCase}ScreenEventInit event,
    Emitter<${screenName.pascalCase}ScreenState> emit,
  ) {}

}
''';

  static String blocModels({required String screenName}) =>
      '''import 'package:freezed_annotation/freezed_annotation.dart';

part '${screenName}_screen_models.freezed.dart';

@freezed
class ${screenName.pascalCase}ScreenEvent with _\$${screenName.pascalCase}ScreenEvent {
  const factory ${screenName.pascalCase}ScreenEvent.init() = ${screenName.pascalCase}ScreenEventInit;
}

@freezed
class ${screenName.pascalCase}ScreenSR with _\$${screenName.pascalCase}ScreenSR {
  const factory ${screenName.pascalCase}ScreenSR.loadFinished() = _LoadFinished;
}

class ${screenName.pascalCase}ScreenState {}''';

  static String screen(
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
          required String projectName}) =>
      '''${isGoRouter ? 'import \'package:go_router/go_router.dart\';' : 'import \'package:auto_route/auto_route.dart\';'}
import 'package:$projectName/core/arch/bloc/base_block_state.dart';
import 'package:flutter/material.dart';
import 'package:$projectName/presentation/screen/${screenName}_screen/bloc/${screenName}_screen_bloc_imports.dart';

${isGoRouter ? '' : '@RoutePage()'}
class ${screenName.pascalCase}Screen extends StatefulWidget {
  const ${screenName.pascalCase}Screen({
    super.key,
  });

  @override
  State<${screenName.pascalCase}Screen> createState() => _${screenName.pascalCase}ScreenState();
}

class _${screenName.pascalCase}ScreenState
    extends BaseState<${screenName.pascalCase}ScreenState, ${screenName.pascalCase}ScreenBloc, ${screenName.pascalCase}ScreenSR, ${screenName.pascalCase}Screen> {
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
