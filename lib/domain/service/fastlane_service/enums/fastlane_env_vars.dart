enum FastlaneEnvVars {
  jsonKeyFile(variableName: 'JSON_KEY_FILE'),
  packageId(variableName: 'PACKAGE_NAME'),
  firebaseAppId(variableName: 'FIREBASE_APP_ID'),
  bundleId(variableName: 'BUNDLE_ID'),
  appleDeveloperUseName(variableName: 'APPLE_DEVELOPER_USERNAME'),
  appStoreConnectTeamId(variableName: 'APP_STORE_CONNECT_TEAM_ID'),
  developerPortalTeamId(variableName: 'DEVELOPER_PORTAL_TEAM_ID'),
  issuerId(variableName: 'ISSUER_ID'),
  keyId(variableName: 'KEY_ID'),
  keyContent(variableName: 'KEY_CONTENT'),
  slackURL(variableName: 'SLACK_URL');

  const FastlaneEnvVars({required this.variableName});

  final String variableName;
}
