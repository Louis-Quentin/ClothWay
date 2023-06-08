
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'homepage.dart';
import 'package:animate_do/animate_do.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<bool> getSocialNetwork(String socialNet) async {
  String url = "http://127.0.0.1:8080/get_social_network";
  final response = await http.post(
    Uri.parse(url),
    body: jsonEncode(<String, String>{"SocialNetwork" : socialNet}),
  );
  if (response.statusCode == 200) {
    print("Bonne reception url");
    return true;
  } else {
    if (response.statusCode == 400) {
      print("Echec reception url");
    }
    return false;
  }
}

launchURL(String url) async {
  final my_url = Uri.parse(url);
  if (await canLaunchUrl(my_url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'could not launch $url';
  }
}

class Service_twitter extends StatelessWidget {
  String image;
  String text;

  Service_twitter({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 177,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(159, 63, 68, 114),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              image,
              width: 150,
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
            ),
          ],
        ),
      ),
      onTap: () {
        const url = 'https://twitter.com/_clothway_';
        launchURL(url);
       },
    );
  }
}

class Service_insta extends StatelessWidget {
  String image;
  String text;

  Service_insta({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 177,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(159, 63, 68, 114),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              image,
              width: 150,
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
            ),
          ],
        ),
      ),
      onTap: () {
        const url = 'https://www.instagram.com/clothwayclothway/';
        launchURL(url);
        },
    );
  }
}

class SocialPage extends StatelessWidget {
const SocialPage({Key? key}) : super(key: key);

@override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text("Réseaux sociaux"),
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(30, 30, 30, 30)
            ),
      backgroundColor: const Color.fromRGBO(30, 30, 30, 30),
      body: Container(
          constraints: BoxConstraints.expand(),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ClothWay',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Pour mieux suivre nos actualités, retrouvez tous nos réseaux sociaux ci-dessous',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Service_twitter(
                                      image: 'assets/image/twitter.png',
                                      text: 'Twitter',
                                    ),
                                    Service_insta(
                                      image: 'assets/image/instagram.png',
                                      text: 'Instagram',
                                    ),
                                  ],
                                ),
                              ],
                            ))
                      ])))),
    );
  }
}