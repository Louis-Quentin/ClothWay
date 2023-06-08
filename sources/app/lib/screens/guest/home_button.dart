import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:animate_do/animate_do.dart';
import 'connexion.dart';

//Création du bouton
class BottomButton extends StatelessWidget {
  @override
  //Création du builder
  Widget build(BuildContext context) {
    return Container(
      //Définitions des specs du bouton
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color.fromARGB(232, 30, 30, 30),
        borderRadius: BorderRadius.circular(30.0), // Ajoute le coin arrondi
      ),
      //Définition des actions du bouton
      child: TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false,
          ); //Retour fixe du bouton vers la route HomePage
        },
        child: Text(
          'Accueil',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }
}