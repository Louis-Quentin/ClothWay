
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:animate_do/animate_do.dart';

class ConfidentialityPage extends StatelessWidget {
const ConfidentialityPage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) => Scaffold(
  appBar: AppBar(
    title: const Text('Confidentialité'),
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
                          'Politique de confidentialité',
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
                          "Chez ClothWay, nous attachons une grande importance à la confidentialité et à la protection des données de nos clients. Cette politique de confidentialité explique comment nous recueillons, utilisons, divulguons et protégeons les informations personnelles que vous nous fournissez lorsque vous utilisez nos services. Nous vous recommandons de lire attentivement cette politique pour comprendre comment nous traitons vos informations.",
                           style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '1. Informations personnelles collectées',
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
                          "Nous collectons des informations personnelles lorsque vous effectuez un achat sur notre site web, vous abonnez à notre newsletter ou interagissez avec notre service client. Les informations personnelles que nous collectons peuvent inclure votre nom, votre adresse e-mail, votre adresse de livraison, votre numéro de téléphone et d'autres informations nécessaires au traitement de vos commandes.",
                           style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '2. Utilisation des informations',
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
                          "Nous utilisons les informations personnelles que nous collectons pour vous fournir nos produits et services, gérer votre compte, traiter vos commandes, vous envoyer des mises à jour sur nos offres spéciales, répondre à vos demandes et améliorer votre expérience utilisateur. Nous pouvons également utiliser vos informations de manière anonyme et agrégée à des fins statistiques ou de recherche.",
                           style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '3. Divulgation des informations',
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
                          "Nous ne vendons, ne louons ni ne partageons vos informations personnelles avec des tiers à des fins commerciales, sauf si nous obtenons votre consentement préalable ou si la loi l'exige. Cependant, nous pouvons divulguer vos informations à nos prestataires de services de confiance qui nous aident à exploiter notre entreprise, à condition qu'ils acceptent de protéger ces informations de manière confidentielle.",
                           style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '4. Sécurité des données',
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
                          "Nous mettons en place des mesures de sécurité techniques, administratives et physiques pour protéger vos informations personnelles contre tout accès non autorisé, toute divulgation, toute altération ou toute destruction. Cependant, veuillez noter qu'aucune méthode de transmission sur Internet ou de stockage électronique n'est totalement sécurisée. Par conséquent, nous ne pouvons garantir une sécurité absolue de vos informations.",
                           style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '5. Cookies et technologies similaires',
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
                          "Nous utilisons des cookies et des technologies similaires pour améliorer votre expérience sur notre site web. Ces technologies nous permettent de collecter des informations telles que votre adresse IP, votre type de navigateur, votre fournisseur de services Internet, les pages que vous visitez sur notre site et les liens sur lesquels vous cliquez. Vous pouvez configurer votre navigateur pour qu'il refuse tous les cookies ou vous avertisse lorsqu'un cookie est envoyé.",
                           style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '6. Liens vers des sites tiers',
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
                          "Notre site web peut contenir des liens vers des sites web de tiers. Veuillez noter que nous ne sommes pas responsables des pratiques de confidentialité de ces sites. Nous vous encourageons à lire les politiques de confidentialité de ces sites avant de fournir vos informations personnelles.",
                           style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "7. Modifications de la politique de confidentialité",
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
                          "Nous nous réservons le droit de modifier cette politique de confidentialité à tout moment. Toute modification sera publiée sur cette page avec la date de mise à jour. Nous vous encourageons à consulter régulièrement cette politique pour rester informé de nos pratiques en matière de confidentialité.",
                           style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '8. Contactez-nous',
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
                          "Si vous avez des questions, des préoccupations ou des commentaires",
                           style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ])))),
    );
}