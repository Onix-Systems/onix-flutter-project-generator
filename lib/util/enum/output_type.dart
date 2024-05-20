enum OutputType {
  info('{#info}'),
  error('{#error}'),
  progress('{#progress}'),
  message('');

  const OutputType(
    this.tag,
  );

  final String tag;

  static OutputType fromTag(String tag) {
    switch (tag) {
      case '{#info}':
        return OutputType.info;
      case '{#error}':
        return OutputType.error;
      case '{#progress}':
        return OutputType.progress;
      default:
        return OutputType.message;
    }
  }
}
