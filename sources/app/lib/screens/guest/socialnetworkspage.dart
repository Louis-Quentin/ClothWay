
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:animate_do/animate_do.dart';

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
        //Navigator.push(context, MaterialPageRoute(builder:(context) => GmailPage(mail : optionalParam)));
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
        //Navigator.push(context, MaterialPageRoute(builder:(context) => GmailPage(mail : optionalParam)));
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