import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/presentation/screen/splash_screen/bloc/splash_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/extension/version_extension.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreenBloc
    extends BaseBloc<SplashScreenEvent, SplashScreenState, SplashScreenSR> {
  SplashScreenBloc() : super(const SplashScreenState.data()) {
    on<SplashScreenEventInit>(_onInit);
    on<SplashScreenEventOnAnimationFinished>(_onAnimationFinished);
    add(const SplashScreenEvent.init());
  }

  Future<void> _onInit(
    SplashScreenEventInit event,
    Emitter<SplashScreenState> emit,
  ) async {
    emit(state.copyWith(logoVisible: true));
  }

  Future<void> _onAnimationFinished(
    SplashScreenEventOnAnimationFinished event,
    Emitter<SplashScreenState> emit,
  ) async {
    final packageInfo = await PackageInfo.fromPlatform();

    final localVersion = packageInfo.version;

    final mainProcess = await Process.start('zsh', []);

    var remoteVersion = '';

    mainProcess.stdout.transform(utf8.decoder).listen((event) {
      if (event.contains('version: ')) {
        remoteVersion = event.replaceAll('version: ', '').split('+').first;
        mainProcess.kill();
      }
    });

    mainProcess.stdin.writeln(r'source $HOME/.zshrc');
    mainProcess.stdin.writeln(r'source $HOME/.bash_profile');

    mainProcess.stdin.writeln(
      'curl https://raw.githubusercontent.com/Onix-Systems/onix-flutter-project-generator/main/pubspec.yaml | grep version && exit',
    );

    await mainProcess.exitCode;

    try {
      final localVersionNumber = localVersion.asIntVersion();
      final remoteVersionNumber = remoteVersion.asIntVersion();
      if (localVersionNumber < remoteVersionNumber) {
        addSr(const SplashScreenSR.onNeedUpdate());
      } else {
        addSr(const SplashScreenSR.onContinue());
      }
    } catch (e) {
      logger.e(e);
      if (localVersion != remoteVersion) {
        addSr(const SplashScreenSR.onNeedUpdate());
      } else {
        addSr(const SplashScreenSR.onContinue());
      }
    }

    emit(
      state.copyWith(
        remoteVersion: remoteVersion,
        localVersion: localVersion,
      ),
    );
  }
}
