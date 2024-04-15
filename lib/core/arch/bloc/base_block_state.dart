import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/stream_listener.dart';

typedef ListenDelegate<S> = void Function(BuildContext context, S state);
typedef StateListener<S> = Widget Function(S state);
typedef SingleResultListener<SR> = void Function(
  BuildContext context,
  SR singleResult,
);

abstract class BaseState<S, B extends BaseBloc<dynamic, S, SR>, SR,
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
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    });
  }

  // ignore: no-empty-block
  void initParams(BuildContext context) {}

  Widget buildWidget(BuildContext context);

  // ignore: no-empty-block
  void _defaultListenDelegate(BuildContext context, S state) {}
}
