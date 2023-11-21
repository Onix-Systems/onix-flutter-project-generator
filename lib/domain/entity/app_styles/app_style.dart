abstract class AppStyle {
  final String id;
  final String name;

  const AppStyle({required this.id, required this.name});

  Map<String, dynamic> toJson();

  AppStyle fromJson(Map<String, dynamic> json);
}
