import 'dart:convert';
import 'package:bis/screens/guest/inscription.dart';
import 'package:bis/screens/guest/welcome.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;
import 'package:animate_do/animate_do.dart';

import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';

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


Future<void> main() async {
  test('Test connexion', () async {
    final email = 'test@example.com';
    final password = 'password';

    // Création d'un faux serveur pour le test
    final server = MockServer();

    // URL du serveur
    server.url = 'http://127.0.0.1:8080/signin';

    // Définition de la réponse du serveur pour un test réussi
    server.responseStatusCode = 201;

    // Exécution de la connexion_test
    final result = await connection_test(email, password, server);

    expect(result, true);
    expect(server.requests.length, 1);
    expect(server.requests[0].url, server.url);
    expect(server.requests[0].headers?['Content-Type'], 'application/json; charset=UTF-8');

    expect(server.requests[0].body, jsonEncode({'Email': email, 'Password': password}));
  });
}

class MockServer {
  late String url;
  int? responseStatusCode;
  List<MockRequest> requests = [];

  // Simule une requête HTTP POST vers le serveur fictif.
  Future<http.Response> post(Uri url, {Map<String, String>? headers, body, Encoding? encoding}) async {
    // Ajoute la requête simulée à la liste des requêtes effectuées sur le serveur fictif.
    requests.add(MockRequest(url.toString(), headers, body));

    // Retourne le code d'état de la requête
    return http.Response('', responseStatusCode ?? 200);
  }
}

class MockRequest {
  String url;
  Map<String, String>? headers;
  dynamic body;
  // Requête HTTP simulée
  MockRequest(this.url, this.headers, this.body);
}

//Fonction similaire à l'originale
Future<bool> connection_test(String email, String password, MockServer server) async {
  final response = await server.post(
    Uri.parse(server.url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'Email': email, 'Password': password}),
  );
  if (response.statusCode == 201) {
    print("connexion réussie");
    return true;
  } else {
    if (response.statusCode == 400) {
      print("connexion ratée");
      print(password);
    } else if (response.statusCode == 500) {
      print("problème venant du serveur");
    }
    return false;
  }
}