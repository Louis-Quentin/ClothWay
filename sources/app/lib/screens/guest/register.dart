import 'package:flutter/material.dart';
import 'homepage.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Mail'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'username'),
              obscureText: true,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'password'),
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'password confirmation'),
              obscureText: true,
            ),
            ElevatedButton(
              child: Text('Register'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
