import 'package:bis/screens/guest/connexion.dart';
import 'package:bis/screens/guest/homepage.dart';
import 'package:bis/screens/guest/inscription.dart';
import 'package:bis/screens/guest/login.dart';
import 'package:bis/screens/guest/sendMailResetPassword.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

bool _motDePasse = false;

bool validPass(String str) {
  RegExp regex = RegExp(r'^(?=.*?[0-9]).{8,}$');
  return regex.hasMatch(str);
}

Future<bool> connection(String email, String password) async {
  String url = "http://192.168.0.24:8080/signup";
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

class connexionPage extends StatefulWidget {
  @override
  _connexionPage createState() => _connexionPage();
}

class _connexionPage extends State<connexionPage> {
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
                        "Connectez vous",
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
                  const Text("No account ?"),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => inscriptionPage(),
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
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Mot de passe oublié ? "),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => resetPasswordPage(),
                        ),
                      ),
                    },
                    child: const Text(
                      "Cliquez ici",
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
