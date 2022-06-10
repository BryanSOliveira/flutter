import 'package:flutter/material.dart';
import 'Home.dart';

// flutter run -d chrome --web-renderer html
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
