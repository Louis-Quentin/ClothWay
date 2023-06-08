import 'package:bis/screens/guest/connexion.dart';
import 'package:bis/screens/guest/homepage.dart';
import 'package:bis/screens/guest/login.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';

bool _motDePasse = false;

bool validPass(String str) {
  RegExp regex = RegExp(r'^(?=.*?[0-9]).{8,}$');
  return regex.hasMatch(str);
}

Future<bool> connection(String email, String password) async {
  String url = "http://192.168.0.149:8080/signup";
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'Email': email, 'Password': password}),
  );
  if (response.statusCode == 201) {
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

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class inscriptionPage extends StatefulWidget {
  @override
  _inscriptionPageState createState() => _inscriptionPageState();
}

class _inscriptionPageState extends State<inscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  @override
  void initState() {
    super.initState();

    passwordController.addListener(() {
      setState(() {
        _motDePasse = validPass(passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  Widget initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.purple,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      height: 150,
                      width: 150,
                      child: Image.asset("assets/image/logoClothway.png"),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(
                        right: 20,
                        top: 20,
                      ),
                      child: const Text(
                        "Inscrivez vous",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: const TextField(
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Full Name",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: emailController,
                cursorColor: const Color(0xffF5591F),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Enter Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: const TextField(
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Phone Number",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                obscureText: false,
                controller: passwordController,
                cursorColor: const Color(0xffF5591F),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _motDePasse
                  ? 'Mot de passe valide'
                  : 'Mot de passe non valide\nLe mot de passe doit faire au moins 8 caractères avec 1 chiffre comprit',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: _motDePasse ? Colors.green : Colors.red,
              ),
            ),
            GestureDetector(
              onTap: () async => {
                print(emailController.text),
                print(passwordController.text),
                if (validPass(passwordController.text))
                  {
                    if (await connection(
                        emailController.text, passwordController.text))
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      ),
                  }
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
                padding: const EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      // (Color(0xffF5591F)),
                      // (Color(0xffF2861E)),
                      Colors.blue,
                      Colors.purple,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE),
                    ),
                  ],
                ),
                child: const Text(
                  "REGISTER",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Member ?"),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => connexionPage(),
                        ),
                      ),
                    },
                    child: const Text(
                      "Login Now",
                      style: TextStyle(
                        color: Color(0xffF5591F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> main() async {
  test('Test connexion', () async {
    final email = 'test@example.com';
    final password = 'password';

    // Création d'un faux serveur pour le test
    final server = MockServer();

    // URL du serveur
    server.url = 'http://127.0.0.1:8080/signup';

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


// Fonction similaire à l'originale avec 
Future<bool> connection_test(String email, String password, MockServer server) async {
  final response = await server.post(
    Uri.parse(server.url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'Email': email, 'Password': password}),
  );
  if (response.statusCode == 201) {
    print("inscription réussie");
    return true;
  } else {
    if (response.statusCode == 400) {
      print("inscription ratée");
      print(password);
    } else if (response.statusCode == 500) {
      print("problème venant du serveur");
    }
    return false;
  }
}