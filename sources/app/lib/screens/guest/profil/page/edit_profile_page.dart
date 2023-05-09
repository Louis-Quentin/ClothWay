import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:bis/screens/guest/profil/model/user.dart';
import 'package:bis/screens/guest/profil/widget/textfield_widget.dart';
import 'package:bis/screens/guest/profil/utils/user_preferences.dart';
import 'package:bis/screens/guest/profil/widget/appbar_widget.dart';
import 'package:bis/screens/guest/profil/widget/button_widget.dart';
import 'package:bis/screens/guest/profil/widget/profile_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  @override
  Widget build(BuildContext context) => Builder(
          builder: (context) => Scaffold(
            appBar: buildAppBar(context),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: UserPreferences.myUser.imagePath,
                  isEdit: true,
                  onClicked: () async {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Full Name',
                  text: UserPreferences.myUser.name,
                  onChanged: (name) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: UserPreferences.myUser.email,
                  onChanged: (email) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'About',
                  text: UserPreferences.myUser.about,
                  maxLines: 5,
                  onChanged: (about) {},
                ),
              ],
            ),
          ),
      );
}
