import 'inscription.dart';
import 'package:flutter/material.dart';
import 'connexion.dart';
import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/src/mock.dart';

// Import the files that contain the classes being tested


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
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
              left: MediaQuery.of(context).size.width / 2 - 180,
              top: MediaQuery.of(context).size.height / 2 - 400,
              right: 10,
              child: BounceInDown(
                child: TextHome(),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 125,
              bottom: MediaQuery.of(context).size.height / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonHome1(),
                  SizedBox(
                    width: 20.0,
                  ),
                  ButtonHome2(),
                ],
              ),
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
    double buttonWidth = MediaQuery.of(context).size.width * 0.04;
    double buttonHeight = MediaQuery.of(context).size.height * 0.006;

    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => inscriptionPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blueGrey,
        padding: EdgeInsets.symmetric(
          horizontal: buttonWidth,
          vertical: buttonHeight,
        ),
      ),
      child: const Text(
        "s'inscrire",
        style:
            TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'NorFont'),
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
          MaterialPageRoute(builder: (context) => connexionPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.008,
          vertical: MediaQuery.of(context).size.height * 0.003,
        ),
      ),
      child: const Text(
        "s'identifier",
        style:
            TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'NorFont'),
      ),
    );
  }
}

class ImageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double imageHeight = screenSize.height;
    final double imageWidth = screenSize.width * 0.8;

    return Container(
      height: imageHeight,
      width: imageWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/image/home_page.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
        ),
      ),
    );
  }
}

class TextHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double fontSize =
            constraints.maxWidth / 20; // adjust this value as needed
        return RichText(
          text: const TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'ClothWay ',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 50,
                  fontFamily: 'NorFont',
                ),
              ),
              TextSpan(
                text:
                    "L'impacte écologique de vos vetements calculé pour acheter tout en respectant la planète",
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
          textScaleFactor: fontSize / 14, // adjust this value as needed
        );
      },
    );
  }
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('WelcomePage', () {
    testWidgets('WelcomePage Renders MyHomePage as the home route', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: WelcomePage(),
      ));

  await tester.pumpAndSettle(); // On attend que toutes les tâches se terminent

  expect(find.byType(MyHomePage), findsOneWidget);
});

testWidgets('Tapping ButtonHome1 navigates to inscriptionPage',
      (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MaterialApp(
        home: WelcomePage(), // Page a tester
        navigatorObservers: [mockObserver], 
      ),
    );

    expect(find.byType(ButtonHome1), findsOneWidget); // Trouver le boutton
    await tester.tap(find.byType(ButtonHome1)); // CLiquer dessus
    await tester.pumpAndSettle(); // On laisse le temps à la page de charger
    expect(find.byType(inscriptionPage), findsOneWidget); // On check si on obtient bien la bonne redirection
  });

  testWidgets('Tapping ButtonHome2 navigates to connexionPage', // Problème de visibilité du boutton de la page de connexion
      (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MaterialApp(
        home: WelcomePage(),
        navigatorObservers: [mockObserver],
      ),
    );

    expect(find.byType(ButtonHome2), findsOneWidget);
    await tester.tap(find.byType(ButtonHome2));
    await tester.pumpAndSettle();

    expect(find.byType(connexionPage), findsOneWidget);
  });
  });
}
