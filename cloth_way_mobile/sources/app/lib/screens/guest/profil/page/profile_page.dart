
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bis/screens/guest/Home_button.dart';
import 'package:bis/screens/guest/profil//page/edit_profile_page.dart';
import 'package:bis/screens/guest/profil/model/user.dart';
import 'package:bis/screens/guest/profil/utils/user_preferences.dart';
import 'package:bis/screens/guest/profil/widget/appbar_widget.dart';
import 'package:bis/screens/guest/profil/widget/button_widget.dart';
import 'package:bis/screens/guest/profil/widget/numbers_widget.dart';
import 'package:bis/screens/guest/profil/widget/profile_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bis/screens/guest/profil/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    
    final user = UserPreferences.getUser();

    return Builder(
        builder: (context) => Scaffold(
          bottomNavigationBar: BottomButton(),
          appBar: AppBar(
            title: Text("Profile"),
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(30, 30, 30, 30)
            ),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                  setState(() {});
                },
              ),
              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 24),
              Center(child: buildUpgradeButton()),
              const SizedBox(height: 24),
              NumbersWidget(),
              const SizedBox(height: 48),
              buildAbout(user),
            ],
          ),
        ),
      );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}

class MockUserPreferences extends Mock implements UserPreferences {
  static const _keyUser = 'user';
  User getUser() {
    return User(
      imagePath: 'mockImagePath',
      name: 'mockName',
      email: 'mockEmail',
      about: 'mockAbout',
      isDarkMode: false,
    );
  }
  Future setUser(User user, SharedPreferences preferences) async {
    final json = jsonEncode(user.toJson());

    await preferences.setString(_keyUser, json);
  }
}

void main() {
  late ProfilePage profilePage;
  late MockUserPreferences mockUserPreferences;
  late SharedPreferences ok;
  

  setUp(() {
    mockUserPreferences = MockUserPreferences();
    profilePage = ProfilePage();
  });

  testWidgets('Affiche le nom et l\'email de l\'utilisateur', (WidgetTester tester) async {
    final user = User(imagePath: 'path/to/image.jpg',
      name: 'John Doe',
      email: 'john.doe@example.com',
      about: 'About me',
      isDarkMode: false,);
    when(mockUserPreferences.getUser()).thenReturn(user);

    await tester.pumpWidget(profilePage);

    expect(find.text(user.name), findsOneWidget);
    expect(find.text(user.email), findsOneWidget);
  });

  testWidgets('Ouvre la page d\'édition du profil lorsqu\'on clique sur l\'image', (WidgetTester tester) async {
    final user = User(imagePath: 'path/to/image.jpg',
      name: 'John Doe',
      email: 'john.doe@example.com',
      about: 'About me',
      isDarkMode: false,);
    when(mockUserPreferences.getUser()).thenReturn(user);

    await tester.pumpWidget(profilePage);

    await tester.tap(find.byType(ProfileWidget));

    verify(mockUserPreferences.getUser());
    verify(mockUserPreferences.setUser(user, ok));

    expect(find.byType(EditProfilePage), findsOneWidget);
  });

  testWidgets('Affiche le bouton d\'amélioration vers PRO', (WidgetTester tester) async {
   final user = User(imagePath: 'path/to/image.jpg',
      name: 'John Doe',
      email: 'john.doe@example.com',
      about: 'About me',
      isDarkMode: false,);
    when(mockUserPreferences.getUser()).thenReturn(user);

    await tester.pumpWidget(profilePage);

    expect(find.text('Upgrade To PRO'), findsOneWidget);
  });

  testWidgets('Affiche les détails de l\'utilisateur', (WidgetTester tester) async {
    final user = User(imagePath: 'path/to/image.jpg',
      name: 'John Doe',
      email: 'john.doe@example.com',
      about: 'About me',
      isDarkMode: false,);
    when(mockUserPreferences.getUser()).thenReturn(user);

    await tester.pumpWidget(profilePage);

    expect(find.text('About'), findsOneWidget);
    expect(find.text(user.about), findsOneWidget);
  });
}
