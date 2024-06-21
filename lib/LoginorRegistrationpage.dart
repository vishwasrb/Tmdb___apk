import 'package:flutter/material.dart';

import 'package:mydemo_app/FirstPage.dart';
import 'package:mydemo_app/LoginPage.dart';

class LoginorRegistrationpage extends StatefulWidget {
  const LoginorRegistrationpage({super.key});

  @override
  State<LoginorRegistrationpage> createState() =>
      _LoginorRegistrationpageState();
}

class _LoginorRegistrationpageState extends State<LoginorRegistrationpage> {
  bool isLogin = true;

  void togglepage() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginpageConsumer(onTap: togglepage);
    } else {
      return FirstPage(onTap: togglepage);
    }
  }
}
