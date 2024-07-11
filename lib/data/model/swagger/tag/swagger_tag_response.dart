import 'package:onix_flutter_bricks/app/util/extenstion/variable_name_extension.dart';

class SwaggerTagResponse {
  final String name;
  final String description;

  SwaggerTagResponse({
    required this.name,
    required this.description,
  });

  factory SwaggerTagResponse.fromJsonAllVersions(Map<String, dynamic> json) {
    final name = (json['name'] as String).clearDataComponentsName();
    final description = json['description'];
    return SwaggerTagResponse(name: name, description: description);
  }

  @override
  String toString() {
    return '---Tag---\n$name\n $description';
  }
}
