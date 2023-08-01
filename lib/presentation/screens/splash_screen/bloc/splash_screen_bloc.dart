import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screens/splash_screen/bloc/splash_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/utils/consts.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(const SplashScreenState.data()) {
    on<Init>(_onInit);
    add(const Init());
  }

  FutureOr<void> _onInit(Init event, Emitter<SplashScreenState> emit) async {
    await Future.delayed(const Duration(seconds: 1)).then((_) {
      emit(state.copyWith(logoVisible: true));
    });

    final packageInfo = await PackageInfo.fromPlatform();

    final localVersion = packageInfo.version;

    var mainProcess = await Process.start('zsh', []);

    String version = '';

    mainProcess.stdout.transform(utf8.decoder).listen((event) {
      version = event.replaceAll('version: ', '').split('+').first;
      mainProcess.kill();
    });

    mainProcess.stdin.writeln('source \$HOME/.zshrc');
    mainProcess.stdin.writeln('source \$HOME/.bash_profile');

    mainProcess.stdin.writeln(
        'git archive --remote=${Consts.gitUri} ${Consts.gitBranch} pubspec.yaml | tar xO | grep version && exit');

    await mainProcess.exitCode;

    emit(state.copyWith(
        remoteVersion: version,
        localVersion: localVersion,
        loadFinished: true));
  }
}
