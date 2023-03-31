import 'package:flutter/material.dart';
{{^isGoRouter}}import 'package:auto_route/auto_route.dart';

@RoutePage(){{/isGoRouter}}
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Hello, world!!!')),
    );
  }
}
