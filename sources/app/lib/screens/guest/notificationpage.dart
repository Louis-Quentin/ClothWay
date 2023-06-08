
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:animate_do/animate_do.dart';
import 'package:bis/screens/guest/Home_button.dart';

class NotificationPage extends StatelessWidget {
const NotificationPage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) => Scaffold(
  bottomNavigationBar: BottomButton(),
  appBar: AppBar(
    title: const Text('Notification'),
    ),
  );
}