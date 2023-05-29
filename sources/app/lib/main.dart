import 'package:flutter/material.dart';
import 'screens/guest/welcome.dart';
import 'package:flutter/services.dart';
import 'package:bis/screens/guest/profil/utils/user_preferences.dart';

//void main() => runApp(const App());

Future main() async {

  //await UserPreferences.init();

  runApp(const App());
}

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
