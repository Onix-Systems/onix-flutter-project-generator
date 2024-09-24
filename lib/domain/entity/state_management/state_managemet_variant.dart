abstract class StateManagementVariant {
  String get name;

  const StateManagementVariant();
}

final class StatelessStateManagementVariant extends StateManagementVariant {
  @override
  String get name => 'Stateless';

  const StatelessStateManagementVariant();
}

final class StatefulStateManagementVariant extends StateManagementVariant {
  @override
  String get name => 'Stateful';

  const StatefulStateManagementVariant();
}

final class BlocStateManagementVariant extends StateManagementVariant {
  @override
  String get name => 'Bloc';

  const BlocStateManagementVariant();
}

final class CubitStateManagementVariant extends StateManagementVariant {
  @override
  String get name => 'Cubit';

  const CubitStateManagementVariant();
}
