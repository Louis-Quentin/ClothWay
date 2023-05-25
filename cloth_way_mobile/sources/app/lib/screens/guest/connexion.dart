import 'dart:convert';
import 'package:bis/screens/guest/inscription.dart';
import 'package:bis/screens/guest/welcome.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;
import 'package:animate_do/animate_do.dart';

Future<bool> connection(String email, String password) async {
  String url = "http://192.168.0.149:8080/signin";
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'Email': email, 'Password': password}),
  );
  print(response.body);
  print(response.statusCode);
  if (response.statusCode == 202) {
    print("inscription réussie");
    return true;
  } else {
    if (response.statusCode == 400) {
      print("inscription ratée");
    } else if (response.statusCode == 500) {
      print("problème venant du serveur");
    }
    return false;
  }
}

class connexionPage extends StatelessWidget {
  const connexionPage({super.key});

  Widget titlePage() {
    return Center(
        child: Container(
      alignment: Alignment.topLeft,
      child: const Text(
        'ClothWay',
        style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'NorFont'),
      ),
    ));
  }

  Widget phrase() {
    return Center(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: BounceInDown(
              child: const Text(
                'Connectez vous !',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'InterFont'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createBar({required String name}) {
    return SingleChildScrollView(
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          filled: true,
          fillColor: Colors.white,
          labelText: name,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }

  Widget passwordBar() {
    return SingleChildScrollView(
      child: TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          filled: true,
          fillColor: Colors.white,
          labelText: 'Password',
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
                const SizedBox(height: 100),
                phrase(),
                const SizedBox(height: 50),
                const Text(
                  textAlign: TextAlign.left,
                  'E-mail*',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 15),
                createBar(name: ' e-mail'),
                const SizedBox(height: 30),
                passwordBar(),
                const SizedBox(height: 5),
                const Text(
                  textAlign: TextAlign.left,
                  '*Champs obligatoires',
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
                                builder: (context) => const WelcomePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
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
                        onPressed: () async {
                          print(emailController.text);
                          print(passwordController.text);
                          if (await connection(
                              emailController.text, passwordController.text)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          }
                          ;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child: const Text(
                          "continuer",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'NorFont'),
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
