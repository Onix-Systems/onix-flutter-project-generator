//@formatter:off
import 'package:{{project_name}}/core/arch/bloc/base_cubit.dart';
import 'package:{{project_name}}/core/arch/bloc/stream_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
{{^web_only}}import 'package:loader_overlay/loader_overlay.dart';{{/web_only}}
{{#web_only}}import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:{{project_name}}/core/extension/loader.dart';{{/web_only}}

typedef ListenDelegate<S> = void Function(BuildContext context, S state);
typedef StateListener<S> = Widget Function(S state);
typedef SingleResultListener<SR> = void Function(
  BuildContext context,
  SR singleResult,
);

abstract class BaseCubitState<S, B extends BaseCubit<S, SR>, SR,
    W extends StatefulWidget> extends State<W> {
  bool lazyBloc = false;
  B? _bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
      create: (context) {
        final bloc = createBloc();
        onBlocCreated(context, bloc);
        _bloc = bloc;
        return bloc;
      },
      lazy: lazyBloc,
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

  B blocOf(BuildContext context) => context.read<B>();

  B createBloc() => GetIt.I.get<B>();

  Widget srObserver({
    required BuildContext context,
    required Widget child,
    required SingleResultListener<SR> onSR,
  }) {
    return StreamListener<SR>(
      stream: (_bloc ?? blocOf(context)).singleResults,
      onData: (data) {
        onSR(context, data);
      },
      child: child,
    );
  }

  Widget blocConsumer({
    required StateListener<S> stateListener,
    ListenDelegate<S>? listenDelegate,
    BlocBuilderCondition<S>? buildWhen,
    BlocListenerCondition<S>? listenWhen,
  }) {
    return BlocConsumer<B, S>(
      builder: (_, state) => stateListener(state),
      listener: listenDelegate ?? _defaultListenDelegate,
      buildWhen: buildWhen,
      listenWhen: listenWhen,
    );
  }

  Widget blocBuilder({
    required BlocWidgetBuilder<S> builder,
    BlocBuilderCondition<S>? buildWhen,
  }) {
    return BlocBuilder<B, S>(builder: builder, buildWhen: buildWhen);
  }

  void onBlocCreated(BuildContext context, B bloc) {
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

  // ignore: no-empty-block
  void _defaultListenDelegate(BuildContext context, S state) {}
}
