import 'package:flutter/material.dart';

class BannedApp extends StatelessWidget {
  const BannedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'App is not working on jail broken or rooted device.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32),
            ),
          ),
        ),
      ),
    );
  }
}
