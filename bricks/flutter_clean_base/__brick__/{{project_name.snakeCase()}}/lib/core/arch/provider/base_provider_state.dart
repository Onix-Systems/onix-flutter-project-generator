//@formatter:off

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:onix_flutter_bricks/core/arch/provider/base_provider.dart';
import 'package:provider/provider.dart';

typedef StateListener<S> = Widget Function(S state);

abstract class BaseProviderState<P extends BaseProvider,
    S extends ProviderState, W extends StatefulWidget> extends State<W> {
  bool lazyProvider = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<P>(
      create: (ctx) {
        final provider = createProvider();
        onProviderCreated(context, provider);
        return provider;
      },
      lazy: lazyProvider,
      child: Builder(
        builder: (ctx) {
          initParams(context);
          return buildWidget(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    if (context.mounted) {
      context.loaderOverlay.hide();
    }
    super.dispose();
  }

  P providerOf(BuildContext context) => context.read<P>();

  P createProvider() => GetIt.I.get<P>();

  Widget providerConsumer({
    required StateListener<S> stateListener,
  }) {
    return Consumer<P>(
      builder: (_, provider, __) => stateListener(provider.state),
    );
  }

  void onProviderCreated(BuildContext context, P provider) {
    provider.progressStream.listen((event) async {
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
}
