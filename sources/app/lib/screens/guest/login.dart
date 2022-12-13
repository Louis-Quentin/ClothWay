import 'package:flutter/material.dart';
import 'homepage.dart';

class LoginPage extends StatelessWidget {
  Widget titlePage() {
    return Center(
        child: Container(
      alignment: Alignment.topLeft,
      child: const Text(
        'ClothWay',
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
      ),
    ));
  }

  Widget phrase() {
    return Center(
        child: Container(
      alignment: Alignment.topLeft,
      child: const Text(
        'Entrez votre adresse e-mail pour vous inscrire',
        style: TextStyle(
            color: Colors.white, fontSize: 35, fontWeight: FontWeight.w900),
        //decoration: TextDecoration.underline),
      ),
    ));
  }

  Widget emailbar() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        filled: true,
        fillColor: Colors.white,
        labelText: 'Email',
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }

  Widget buttons(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                // Navigator.push(
                  // context,
                  // MaterialPageRoute(builder: (context) => const HomePage()),
              // );
              }
            ),
            // ElevatedButton(
              // child: const Text('Go Back'),
              // onPressed: () {
                // Navigator.push(
                  // context,
                  // MaterialPageRoute(builder: (context) => const HomePage()),
                // );
              // }
            // ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 209, 138, 5),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 10),
                  titlePage(),
                  const SizedBox(height: 70),
                  phrase(),
                  const SizedBox(height: 80),
                  const Text(
                    textAlign: TextAlign.left,
                    'E-mail*',
                    // color: Colors.white,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  emailbar(),
                  // const SizedBox(height: 20),
                  // buttons(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
