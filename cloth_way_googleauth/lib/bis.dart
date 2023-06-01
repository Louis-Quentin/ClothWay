// Importation de bibliothèques nécessaires
import 'package:flutter/material.dart'; // Importation Flutter
import 'package:http/http.dart' as http; // Importation pour les requêtes HTTP
import 'dart:convert' show json; // Importation manipulation de JSON
import 'package:google_sign_in/google_sign_in.dart'; // Importation Google Signi In
import 'dart:async';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'src/sign_in_button.dart';
import 'dart:convert';

// Crée une classe mock pour GoogleSignInAccount
class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

// Crée une classe mock pour http.Response
class MockHttpResponse extends Mock implements http.Response {}

// Définition des scopes nécessaires pour l'authentification avec Google
const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

// Création d'une instance de GoogleSignIn avec les scopes
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: scopes,
);


// Classe pour la page principale
class tester extends StatefulWidget {
  const tester({super.key});

  @override
  State createState() => _testerState(); 
}
// Classe pour l'état de la page de la connexion Google
class _testerState extends State<tester> {
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

  // Cas d'erreur lors du clic sur le outon
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  // Demande d'autorisation pour les scopes
  Future<void> _handleAuthorizeScopes() async {
    final bool isAuthorized = await _googleSignIn.requestScopes(scopes);
    setState(() {
      _isAuthorized = isAuthorized;
    });
    if (isAuthorized) {
      _handleGetContact(_currentUser!);
    }
  }

  // Déconnection
  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  // ENgine, build la page en fonction de l'état définit avant
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
            // Les scopes sont autorisés 
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
            // L'utilisateur n'a pas autorisé tous les scopes requis
            const Text('Additional permissions needed to read your contacts.'),
            ElevatedButton(
              onPressed: _handleAuthorizeScopes,
              child: const Text('REQUEST PERMISSIONS'),
            ),
          ],
          //Bouton sign out 
          ElevatedButton(
            onPressed: _handleSignOut,
            child: const Text('SIGN OUT'),
          ),
        ],
      );
    } else {
      // Utilisation non connecté
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
          return _buildBody(); // Soit affichage des contactes, soit affichage du body !
        }
      },
    )
    
  );
}
}


void main() {
  // Test de la classe _testState
  group('_testState', () {
    late _testerState testState;
    late MockGoogleSignInAccount mockGoogleSignInAccount;

    setUp(() {
      testState = _testerState();
      mockGoogleSignInAccount = MockGoogleSignInAccount();
    });

    test('initial state', () {
      expect(testState._currentUser, isNull);
      expect(testState._isAuthorized, isFalse);
      expect(testState._isPopupVisible, isFalse);
      expect(testState._contactText, '');
      expect(testState._decodedData, isNull);
    });

    // test('handleGetContact - success', () async {
    //   final mockResponse = MockHttpResponse();
    //   when(mockGoogleSignInAccount.authHeaders)
    //       .thenAnswer((_) => Future.value({'Authorization': 'Bearer token'}));
    //   when(mockResponse.statusCode).thenReturn(200);
    //   when(mockResponse.body).thenReturn(
    //     // Mettez ici le corps de réponse JSON simulé pour le test
    //     jsonEncode({'data': 'test data'}),
    //   );
    //   when(http.get(Uri.parse('https://google.com'), headers: anyNamed('headers')))
    //       .thenAnswer((_) => Future.value(mockResponse));

    //   await testState._handleGetContact(mockGoogleSignInAccount);

    //   expect(testState._contactText, 'Loading contact info...');
    //   expect(testState._decodedData, {'data': 'test data'});
    // });
    // test('handleGetContact - failure', () async {
    //   final mockResponse = MockHttpResponse();
    //   when(mockGoogleSignInAccount.authHeaders)
    //       .thenAnswer((_) => Future.value({'Authorization': 'Bearer token'}));
    //   when(mockResponse.statusCode).thenReturn(400);
    //   when(http.get(Uri.parse('https://google.com'), headers: anyNamed('headers')))
    //       .thenAnswer((_) => Future.value(mockResponse));

    //   await testState._handleGetContact(mockGoogleSignInAccount);

    //   expect(testState._contactText,
    //       'People API gave a 400 response. Check logs for details.');
    //   expect(testState._decodedData, isNull);
    // });

    // Écrivez d'autres tests pour les autres méthodes de la classe _testState

  });
}
