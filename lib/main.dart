import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'intro.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasViewedIntro = prefs.getBool('hasViewedIntro') ?? false;

  if (hasViewedIntro) {
    runApp(HomePageApp());
  } else {
    runApp(IntroApp());
    prefs.setBool('hasViewedIntro', true);
  }
}

class IntroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}

class HomePageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
