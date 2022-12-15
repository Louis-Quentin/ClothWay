import 'package:flutter/material.dart';
import 'screens/guest/welcome.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clothway',
      home: WelcomePage(),
    );
  }
}
