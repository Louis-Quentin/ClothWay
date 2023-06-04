import 'dart:convert';
import 'package:bis/screens/guest/inscription.dart';
import 'package:bis/screens/guest/getPasswordFromEmail.dart';
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

class resetPasswordPage extends StatefulWidget {
  @override
  _resetPasswordPage createState() => _resetPasswordPage();
}

class _resetPasswordPage extends State<resetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
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
                        "Saisissez votre adresse mail",
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
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () async => {
                print(emailController.text),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => getNewPassword(),
                  ),
                ),
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
                  "Envoyer à cette adresse mail",
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
