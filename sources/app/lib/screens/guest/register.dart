import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Mail'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'username'),
              obscureText: true,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'password'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'password confirmation'),
              obscureText: true,
            ),
            ElevatedButton(
              child: Text('Register'),
              onPressed: () {
                // Handle login
              },
            ),
          ],
        ),
      ),
    );
  }
}
