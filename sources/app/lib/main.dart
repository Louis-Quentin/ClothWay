import 'package:bis/screens/guest/login.dart';
import 'package:flutter/material.dart';
import 'screens/guest/auth.dart';
import 'screens/guest/login.dart';
import 'screens/guest/register.dart';
import 'screens/guest/welcome.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clothway',
      home: WelcomePage(),
    );
  }
}