import 'package:onix_flutter_bricks/domain/service/fastlane_service/enums/fastlane_env_vars.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/utils/fastlane_config/fastlane_envs_creator.dart';

abstract base class PlatformEnvCreator {
  const PlatformEnvCreator({
    this.creator = const FastlaneEnvsCreator(),
  });

  final FastlaneEnvsCreator creator;

  Future<void> createEnv({
    required String path,
    required FastlaneEnvsData data,
    String flavor = '',
  });
}

final class FastlaneIosEnvCreator extends PlatformEnvCreator {
  const FastlaneIosEnvCreator({super.creator});

  @override
  Future<void> createEnv({
    required String path,
    required FastlaneEnvsData data,
    String flavor = '',
  }) async {
    final file = await creator.create(path: path, name: flavor);
    await creator.write(
      file: file,
      data: {
        FastlaneEnvVars.bundleId: '',
        FastlaneEnvVars.appleDeveloperUseName: '',
        FastlaneEnvVars.appStoreConnectTeamId: '',
        FastlaneEnvVars.developerPortalTeamId: '',
        FastlaneEnvVars.issuerId: '',
        FastlaneEnvVars.keyId: '',
        FastlaneEnvVars.keyContent: '',
        FastlaneEnvVars.firebaseAppId: '',
        FastlaneEnvVars.slackURL: '',
      }..addAll(data),
    );
  }
}

final class FastlaneAndroidEnvCreator extends PlatformEnvCreator {
  const FastlaneAndroidEnvCreator({super.creator});

  @override
  Future<void> createEnv({
    required String path,
    required FastlaneEnvsData data,
    String flavor = '',
  }) async {
    final file = await creator.create(path: path, name: flavor);
    await creator.write(
      file: file,
      data: {
        FastlaneEnvVars.jsonKeyFile: '',
        FastlaneEnvVars.packageId: '',
        FastlaneEnvVars.firebaseAppId: '',
        FastlaneEnvVars.slackURL: '',
      }..addAll(data),
    );
  }
}
