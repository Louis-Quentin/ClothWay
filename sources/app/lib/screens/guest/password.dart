import 'package:bis/screens/guest/homepage.dart';
import 'package:bis/screens/guest/inscription.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:animate_do/animate_do.dart';

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
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900, fontFamily: 'NorFont'),
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
                  fontWeight: FontWeight.w900,
                  fontFamily: 'InterFont'),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'passe pour vous',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'InterFont'),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'inscrire',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'InterFont'),
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
          labelText: ' mot-de-passe',
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
        backgroundColor: const Color.fromRGBO(30, 30, 30, 30),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                titlePage(),
                const SizedBox(height: 80),
                BounceInDown(
                child: phrase()),
                const SizedBox(height: 50),
                const Text(
                  textAlign: TextAlign.left,
                  'Mot-de-passe*',
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => inscriptionPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        ),
                        child: const Text(
                          "retour",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'NorFont'),
                            ),
                      ),
                      const SizedBox(width: 80),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        child: Text(
                          "continuer",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'NorFont'),
                            ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
