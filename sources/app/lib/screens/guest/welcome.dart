import 'inscription.dart';
import 'package:flutter/material.dart';
import 'connexion.dart';
import 'dart:ui';
import 'package:animate_do/animate_do.dart';

class WelcomePage extends StatelessWidget {
  const   WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClothWay',
      theme: ThemeData(
        fontFamily: 'InterFont',
      ),
      home: const MyHomePage(title: 'ClothWay'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            ImageHome(),
            Positioned(
              left: MediaQuery.of(context).size.width/2-180,
              top: MediaQuery.of(context).size.height/2-200,
              right: 10,
              child: BounceInDown(
                  child: TextHome(),
                ),
              ),
            Positioned(
              left: MediaQuery.of(context).size.width/2,
              top: MediaQuery.of(context).size.height/2+230,
              child: ButtonHome2(),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width/2-170,
              top: MediaQuery.of(context).size.height/2+230,
              child: ButtonHome1(),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonHome1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => inscriptionPage()),
                  );
                },
                child: Text(
                  "S'inscrire",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'NorFont'),
                    ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
              );
  }
}

class ButtonHome2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => connexionPage()),
                  );
                },
                child: Text(
                  "S'identifier",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'NorFont'),
                    ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
              );
  }
}

class ImageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
              height: 810,
              width: 400,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/image/home_page.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: new Container(
                  decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
    );
  }
}

class TextHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: const <TextSpan>[
          TextSpan(
            text: 'ClothWay ',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 50,
              fontFamily: 'NorFont',
              ),
          ),
          TextSpan(
            text: "L'impacte écologique de vos vetements calculé pour acheter tout en respectant la planète",
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontFamily: "InterFont",
              /*foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = Colors.white,*/
              ),
            ),
        ],
      ),
    );
  }
}