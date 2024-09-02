import 'package:epredik_app/Login_and_SignUp/LoginAndSignUpPage.dart';
import 'package:epredik_app/User_Page/Home_page.dart';
import 'package:epredik_app/User_Page/nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const LoginandSignUp(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const LoginandSignUp(),
        '/3': (context) => const NavUser(),
        '/HomePage': (context) => const HomePage(),
      },
    ),
  );
}
