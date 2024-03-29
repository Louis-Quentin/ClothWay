
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bis/screens/guest/profil//page/edit_profile_page.dart';
import 'package:bis/screens/guest/profil/model/user.dart';
import 'package:bis/screens/guest/profil/utils/user_preferences.dart';
import 'package:bis/screens/guest/profil/widget/appbar_widget.dart';
import 'package:bis/screens/guest/profil/widget/button_widget.dart';
import 'package:bis/screens/guest/profil/widget/numbers_widget.dart';
import 'package:bis/screens/guest/profil/widget/profile_widget.dart';
import 'package:bis/screens/guest/Home_button.dart';

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
            title: Text("Profil"),
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

  Widget buildUpgradeButton() => ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(30, 30, 30, 30), // Background color
                  ),
                  child: const Text(
                    'Achetez version PRO',
                  ),
                );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'À propos',
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
