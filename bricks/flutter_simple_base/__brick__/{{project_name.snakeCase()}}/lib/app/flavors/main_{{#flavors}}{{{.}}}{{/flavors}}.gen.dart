//@formatter:off
import 'package:{{project_name}}/flavors.dart';
import 'package:{{project_name}}/main.dart';

void main() async {
  F.appFlavor = Flavor.{{#flavors}}{{#lowerCase}}{{.}}{{/lowerCase}}{{/flavors}};
  await mainApp();
}