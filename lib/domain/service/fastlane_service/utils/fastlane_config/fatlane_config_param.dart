abstract interface class FastlaneConfigParam {
  abstract final bool shouldBeCommented;
  abstract final String comment;

  const FastlaneConfigParam();

  List<String> toList();
}

class FastlaneOneLineParam extends FastlaneConfigParam {
  final String key;
  final String payload;
  @override
  final bool shouldBeCommented;
  @override
  final String comment;

  const FastlaneOneLineParam({
    required this.key,
    required this.payload,
    this.shouldBeCommented = false,
    this.comment = '',
  });

  @override
  List<String> toList() {
    final comment = this.comment.isEmpty ? '' : ' # ${this.comment}';
    return ['$key: $payload$comment'];
  }
}

class FastlaneMultiLineParam extends FastlaneConfigParam {
  final String key;
  final Map<String, String> payload;
  @override
  final bool shouldBeCommented;
  @override
  final String comment;

  const FastlaneMultiLineParam({
    required this.key,
    required this.payload,
    this.shouldBeCommented = false,
    this.comment = '',
  });

  @override
  List<String> toList() {
    final margin = ''.padLeft(2);
    final comment = this.comment.isEmpty ? '' : ' # ${this.comment}';
    final list = <String>['$key:'];

    for (final entry in payload.entries) {
      list.add('$margin${entry.key}: ${entry.value}$comment');
    }

    return list;
  }
}
