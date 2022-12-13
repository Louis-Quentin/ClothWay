import 'package:bis/screens/guest/homepage.dart';
import 'package:bis/screens/guest/login.dart';
import 'package:flutter/material.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
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
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Entrez un mot de',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'passe pour vous',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'inscrire',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }

  Widget passwordbar() {
    return SingleChildScrollView(
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          filled: true,
          fillColor: Colors.white,
          labelText: 'password',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(50.0),
          ),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                titlePage(),
                const SizedBox(height: 50),
                phrase(),
                const SizedBox(height: 50),
                const Text(
                  textAlign: TextAlign.left,
                  'Password*',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 15),
                passwordbar(),
                const SizedBox(height: 10),
                const Text(
                  textAlign: TextAlign.left,
                  '*Champs obligatoire',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 200),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 40),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1.5, color: Colors.white),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: const Text(
                          'Retour',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 40),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 40),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1.5, color: Colors.white),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        child: const Text(
                          'Continuer',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ), // child: const Text('Back'),
          ),
        ));
    // const SizedBox(height: 20),
  }
}
