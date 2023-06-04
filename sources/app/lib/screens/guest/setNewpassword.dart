import 'dart:convert';
import 'package:bis/screens/guest/connexion.dart';
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
    print("connexion réussie");
    return true;
  } else {
    if (response.statusCode == 400) {
      print("connexion ratée");
    } else if (response.statusCode == 500) {
      print("problème venant du serveur");
    }
    return false;
  }
}

bool checkLength(String str) {
  RegExp regex = RegExp(r'^(?=.*?[0-9]).{8,}$');
  return regex.hasMatch(str);
}

final TextEditingController passwordControllerr = TextEditingController();
final TextEditingController password2Controller = TextEditingController();

bool checker = false;
bool both = false;

bool validPassword() {
  if (passwordControllerr.text.isEmpty) {
    return false;
  } else {
    return passwordControllerr.text == password2Controller.text;
  }
}

class setNewPassword extends StatefulWidget {
  @override
  _setNewPassword createState() => _setNewPassword();
}

class _setNewPassword extends State<setNewPassword> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  @override
  void initState() {
    super.initState();

    password2Controller.addListener(() {
      both = validPassword();
    });
    passwordControllerr.addListener(() {
      setState(() {
        checker = checkLength(passwordControllerr.text);
      });
    });
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
                        "entrez le mot de passe provisoire",
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
            ),
            const SizedBox(height: 30),
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
                controller: passwordControllerr,
                cursorColor: const Color(0xffF5591F),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.key,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Entrez votre nouveau mot de passe",
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
                controller: password2Controller,
                cursorColor: const Color(0xffF5591F),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.password,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Entrez votre nouveau mot de passe",
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
            ),
            const SizedBox(height: 30),
            Text(
              both
                  ? 'Mot de passe conforme'
                  : 'Les deux saisies sont différentes\n',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: both ? Colors.green : Colors.red,
              ),
            ),
            Text(
              checker
                  ? 'Mot de passe valide'
                  : 'Mot de passe non valide\nLe mot de passe doit faire au moins 8 caractères avec 1 chiffre comprit',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: checker ? Colors.green : Colors.red,
              ),
            ),
            GestureDetector(
              onTap: () async => {
                if (checker && both)
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => connexionPage(),
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
                  "Valider le nouveau mot de passe",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
