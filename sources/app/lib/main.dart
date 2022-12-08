import 'package:flutter/material.dart';
import 'screens/guest/auth.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clothway',
      home: AuthScreen(),
    );
  }
}
