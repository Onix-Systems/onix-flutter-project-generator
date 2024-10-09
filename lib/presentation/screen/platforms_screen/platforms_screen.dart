import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/bloc/platforms_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/widgets/platform_screen_body.dart';
import 'package:onix_flutter_bricks/presentation/widget/title_bar.dart';

class PlatformsScreen extends StatefulWidget {
  final Config config;

  const PlatformsScreen({
    required this.config,
    super.key,
  });

  @override
  State<PlatformsScreen> createState() => _PlatformsScreenState();
}

class _PlatformsScreenState extends BaseState<PlatformsScreenState,
    PlatformsScreenBloc, PlatformsScreenSR, PlatformsScreen> {
  @override
  PlatformsScreenBloc createBloc() => PlatformsScreenBloc();

  @override
  void onBlocCreated(BuildContext context, PlatformsScreenBloc bloc) {
    bloc.add(PlatformsScreenEvent.init(config: widget.config));
    super.onBlocCreated(context, bloc);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: TitleBar(
        title: S.of(context).selectProjectPlatforms,
      ),
      child: SizedBox.expand(
        child: blocBuilder(
          builder: (context, state) {
            return PlatformScreenBody(
              config: state.config,
              onAction: (platform) {
                blocOf(context).add(
                  PlatformsScreenEvent.onPlatformsChange(item: platform),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
