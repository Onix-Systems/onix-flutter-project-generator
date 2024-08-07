///To add custom progress data in BLoC extends from this class
abstract class BaseProgressState {
  const BaseProgressState();
}

class DefaultProgressState extends BaseProgressState {
  final bool showProgress;

  const DefaultProgressState({required this.showProgress});
}
