// Importation de bibliothèques nécessaires
import 'package:flutter/material.dart'; // Importation Flutter
import 'package:http/http.dart' as http; // Importation pour les requêtes HTTP
import 'dart:convert' show json; // Importation manipulation de JSON
import 'package:google_sign_in/google_sign_in.dart'; // Importation Google Signi In
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'src/sign_in_button.dart';

// Définition des scopes nécessaires pour l'authentification avec Google
const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

// Création d'une instance de GoogleSignIn avec les scopes
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: scopes,
);

void main() {
  // Exécute l'application Flutter avec une interface utilisateur MaterialApp
  runApp(
    const MaterialApp(
      title: 'Google Sign In',
      home: test(), // Utilise la classe test comme page d'accueil
    ),
  );
}

// Classe pour la page principale
class test extends StatefulWidget {
  const test({super.key});

  @override
  State createState() => _testState(); 
}

// Classe pour l'état de la page de la connexion Google
class _testState extends State<test> {
  GoogleSignInAccount? _currentUser; // Compte Google
  bool _isAuthorized = false; // Autorisations
  bool _isPopupVisible = false;
  String _contactText = ''; // String pour le contact
  Map<String, dynamic>? _decodedData;

  @override
  void initState() {
    super.initState();

    // Si jamais l'utilisateur change
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) async {
      bool isAuthorized = account != null;

      // Vérifie si l'utilisateur est autorisé sur le Web en vérifiant les scopes
        if (kIsWeb && account != null) {
          isAuthorized = await _googleSignIn.canAccessScopes(scopes);
        }

        // Met à jour l'état de l'application avec le compte et l'autorisation
        setState(() {
          _currentUser = account;
          _isAuthorized = isAuthorized;
        });

        if (isAuthorized) {
          _handleGetContact(account!);
          // Si l'utilisateur est autorisé, appel de la fonction _handleGetContact avec compte le google.
        }
    });

    _googleSignIn.signInSilently();
    // Auth invisible
  }

  // Call API pour récup les informations
  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = 'Loading contact info...';
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = 'People API gave a ${response.statusCode} '
            'response. Check logs for details.';
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    print('La tah data : $data');
    setState(() {
      _decodedData = data;
    });
  }

  // Gère l'événement de clic sur le bouton de connexion
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  // Demande à l'utilisateur d'autoriser les scopes requis
  Future<void> _handleAuthorizeScopes() async {
    final bool isAuthorized = await _googleSignIn.requestScopes(scopes);
    setState(() {
      _isAuthorized = isAuthorized;
    });
    if (isAuthorized) {
      _handleGetContact(_currentUser!);
    }
  }

  // Déconnecte l'utilisateur
  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  // Construit le contenu de la page en fonction de l'état de connexion de l'utilisateur
  Widget _buildBody() {
    final GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      // L'utilisateur est connecté
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: user,
            ),
            title: Text(user.displayName ?? ''),
            subtitle: Text(user.email),
          ),
          const Text('Signed in successfully.'),
          if (_isAuthorized) ...<Widget>[
            // L'utilisateur a autorisé tous les scopes requis
            Text(_contactText),
            ElevatedButton(
              child: const Text('REFRESH'),
              onPressed: () {
                setState(() {
                  _isPopupVisible = true;
                });
                _handleGetContact(user);
              },
            ),
          ],
          if (!_isAuthorized) ...<Widget>[
            // L'utilisateur n'a pas autorisé tous les scopes requis.
            // (Les utilisateurs mobiles ne verront peut-être jamais ce bouton !)
            const Text('Additional permissions needed to read your contacts.'),
            ElevatedButton(
              onPressed: _handleAuthorizeScopes,
              child: const Text('REQUEST PERMISSIONS'),
            ),
          ],
          ElevatedButton(
            onPressed: _handleSignOut,
            child: const Text('SIGN OUT'),
          ),
        ],
      );
    } else {
      // L'utilisateur n'est pas connecté
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text('You are not currently signed in.'),
          // Méthode utilisée pour différencier le code mobile du code web avec des exports conditionnels.
          // Voir : src/sign_in_button.dart
          buildSignInButton(
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }

    @override
  //   Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Google Sign In'),
  //     ),
  //     body: ConstrainedBox(
  //       constraints: const BoxConstraints.expand(),
  //       child: _buildBody(),
  //     ),
  //   );
  // }
    Widget build(BuildContext context) {
  // ...
  Widget dataTextWidget;
  if (_decodedData != null) {
    dataTextWidget = Text('Decoded data: $_decodedData');
  } else {
    dataTextWidget = Text('No data available');
  }

  return Scaffold(
    // ...
    // ...
    body: Builder(
      builder: (BuildContext context) {
        if (_isPopupVisible) {
          return AlertDialog(
            title: Text('Decoded Data'),
            content: dataTextWidget,
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isPopupVisible = false;
                  });
                },
                child: Text('Close'),
              ),
            ],
          );
        } else {
          return _buildBody(); // Return an empty widget if _isPopupVisible is false
        }
      },
    )
    
  );
}
}
