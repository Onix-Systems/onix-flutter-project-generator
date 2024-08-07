//@formatter:off
import 'package:{{project_name}}/core/arch/bloc/base_cubit.dart';
import 'package:{{project_name}}/core/arch/bloc/bloc_builders_mixin.dart';
import 'package:{{project_name}}/core/arch/bloc/bloc_typedefs.dart';
import 'package:{{project_name}}/core/arch/bloc/stream_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
{{^web_only}}import 'package:loader_overlay/loader_overlay.dart';{{/web_only}}
{{#web_only}}import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:{{project_name}}/core/extension/loader.dart';{{/web_only}}

abstract class BaseCubitState<S, C extends BaseCubit<S, SR>, SR,
W extends StatefulWidget> extends State<W>
    with BlocBuildersMixin<C, S, SR> {
  bool lazyCubit = false;
  C? _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>(
      create: (context) {
        final cubit = createCubit();
        onCubitCreated(context, cubit);
        _cubit = cubit;
        return cubit;
      },
      lazy: lazyCubit,
      child: Builder(
        builder: (context) {
          initParams(context);
          return buildWidget(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    {{#web_only}}Loader.hide();{{/web_only}}
    {{^web_only}}if (context.mounted) {
    context.loaderOverlay.hide();
    }{{/web_only}}
    if (_bloc != null) {
    _bloc?.dispose();
    }
    super.dispose();
  }

  C cubitOf(BuildContext context) => context.read<C>();

  C createCubit() => GetIt.I.get<C>();

  Widget srObserver({
    required BuildContext context,
    required Widget child,
    required SingleResultListener<SR> onSR,
  }) {
    return StreamListener<SR>(
      stream: (_cubit ?? cubitOf(context)).singleResults,
      onData: (data) {
        onSR(context, data);
      },
      child: child,
    );
  }


  void onCubitCreated(BuildContext context, C bloc) {
    bloc.progressStream.listen((event) async {
      if (event.showProgress) {
        {{#web_only}}context.progressShow();{{/web_only}}
      {{^web_only}}context.loaderOverlay.show();{{/web_only}}
      } else {
      {{#web_only}}context.progressHide();{{/web_only}}
      {{^web_only}}context.loaderOverlay.hide();{{/web_only}}
      }
    });
  }

  // ignore: no-empty-block
  void initParams(BuildContext context) {}

  Widget buildWidget(BuildContext context);
}


abstract class BaseCubitState<S, C extends BaseCubit<S, SR>, SR,
W extends StatefulWidget> extends State<W>
    with BlocBuildersMixin<C, S, SR> {
  bool lazyCubit = false;
  C? _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>(
      create: (context) {
        final cubit = createCubit();
        onCubitCreated(context, cubit);
        _cubit = cubit;
        return cubit;
      },
      lazy: lazyCubit,
      child: Builder(
        builder: (context) {
          initParams(context);
          return buildWidget(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    {{#web_only}}Loader.hide();{{/web_only}}
    {{^web_only}}if (context.mounted) {
    context.loaderOverlay.hide();
    }{{/web_only}}
    if (_bloc != null) {
    _bloc?.dispose();
    }
    super.dispose();
  }

  B cubitOf(BuildContext context) => context.read<B>();

  B createCubit() => GetIt.I.get<B>();

  Widget srObserver({
    required BuildContext context,
    required Widget child,
    required SingleResultListener<SR> onSR,
  }) {
    return StreamListener<SR>(
      stream: (_cubit ?? cubitOf(context)).singleResults,
      onData: (data) {
        onSR(context, data);
      },
      child: child,
    );
  }

  void onCubitCreated(BuildContext context, B bloc) {
    bloc.progressStream.listen((event) async {
      if (event) {
        {{#web_only}}context.progressShow();{{/web_only}}
      {{^web_only}}context.loaderOverlay.show();{{/web_only}}
      } else {
      {{#web_only}}context.progressHide();{{/web_only}}
      {{^web_only}}context.loaderOverlay.hide();{{/web_only}}
      }
    });
  }

  // ignore: no-empty-block
  void initParams(BuildContext context) {}

  Widget buildWidget(BuildContext context);
}
