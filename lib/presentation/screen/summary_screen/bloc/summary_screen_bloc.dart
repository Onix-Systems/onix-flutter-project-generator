import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/service/config_service/config_service.dart';
import 'package:onix_flutter_bricks/presentation/screen/summary_screen/bloc/summary_screen_bloc_imports.dart';

class SummaryScreenBloc
    extends BaseBloc<SummaryScreenEvent, SummaryScreenState, SummaryScreenSR> {
  final ScreenRepository _screenRepository;
  final ConfigService _configService;

  SummaryScreenBloc({
    required ScreenRepository screenRepository,
    required ConfigService configService,
  })  : _configService = configService,
        _screenRepository = screenRepository,
        super(const SummaryScreenStateData(config: Config())) {
    on<SummaryScreenEventInit>(_onInit);
  }

  void _onInit(
    SummaryScreenEventInit event,
    Emitter<SummaryScreenState> emit,
  ) {
    _configService.updateWith(
      screens: _screenRepository.screens,
    );

    emit(
      state.copyWith(
        config: _configService.config,
      ),
    );
  }
}
