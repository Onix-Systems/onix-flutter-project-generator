import 'package:{{project_name}}/flavors.dart';
import 'package:{{project_name}}/main.dart';

void main() async {
  F.appFlavor = Flavor
  .{{#flavors}}{{#upperCase}}{{.}}{{/upperCase}}{{/flavors}};
  await
  mainApp
  (
  );
}