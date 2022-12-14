import 'package:bis/screens/guest/inscription.dart';
import 'package:flutter/material.dart';
import 'connexion.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Clotheway'),
          backgroundColor: Colors.green,
        ),
        body: Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            heightFactor: 40,
            child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => connexionPage()),
                  );
                }),
          ),
          ElevatedButton(
              child: const Text('Register'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => inscriptionPage()),
                );
              })
        ])));
  }
}
