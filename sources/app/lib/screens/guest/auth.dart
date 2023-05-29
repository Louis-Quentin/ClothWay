import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  // AuthScreen({Key: key}) : super(key: Key);
  @override
  _AuthScreenState createState() => _AuthScreenState();
}
  
class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'Welcome to\n'.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                        ),
                        children: [
                          TextSpan(
                              text: 'ClothWay '.toUpperCase(),
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(text: '!'.toUpperCase()),
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Register Now !'),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Form(
                    child: Column(
                      children: [
                        const Text(
                          'Enter your Email',
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Ex: firstname.lastname@email.com',
                              border: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(0.0),
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(0.0),
                                  borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 100,
                            ),
                          ),
                          onPressed: () => print('send'),
                          child: Text(
                            'send'.toUpperCase(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
