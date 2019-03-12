import 'package:flutter/material.dart';
import './pages/first_page.dart';
import './pages/quiz_page.dart';
import './pages/score_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}
