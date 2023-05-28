import 'package:flutter/material.dart';
import 'intro.dart';

void main() {
  runApp(vorgApp());
}

class vorgApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
