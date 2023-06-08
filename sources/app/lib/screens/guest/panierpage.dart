
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:bis/screens/guest/Home_button.dart';

import 'package:animate_do/animate_do.dart';

class PanierPage extends StatelessWidget {
const PanierPage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) => Scaffold(
  bottomNavigationBar: BottomButton(),
  appBar: AppBar(
    title: const Text('Panier'),
    ),
  );
}