import 'package:flutter/material.dart';
import 'homepage.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  Widget titleRegisterPage() {
    return Center(
      child: Container(
        alignment: Alignment.topLeft,
        child: const Text(
          'Entrez votre adresse e-mail pour vous inscrire',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.w900

          ),
            //decoration: TextDecoration.underline),
        ),
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 209, 138, 5),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleRegisterPage(),
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
              child: const Text('Register'),
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
