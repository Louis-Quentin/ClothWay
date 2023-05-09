import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bis/screens/guest/profil/model/user.dart';
import 'package:bis/screens/guest/profil/utils/user_preferences.dart';
import 'package:bis/screens/guest/profil/widget/appbar_widget.dart';
import 'package:bis/screens/guest/profil/widget/button_widget.dart';
import 'package:bis/screens/guest/profil/widget/numbers_widget.dart';
import 'package:bis/screens/guest/profil/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: UserPreferences.myUser.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(),
        ],
      ),
    );
  }

  Widget buildName() => Column(
        children: [
          Text(
            UserPreferences.myUser.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            UserPreferences.myUser.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildAbout() => Container(
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
              UserPreferences.myUser.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
