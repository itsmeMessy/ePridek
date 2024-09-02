import 'package:epredik_app/Button_and_textfield/button_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



void main() {
  runApp(const LoginandSignUp());
}


class LoginandSignUp extends StatelessWidget {
  const LoginandSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Scaffold(
          backgroundColor: const Color(0xFF17153B),
          body: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                SvgPicture.asset('assets/svg/eplogoo.svg'),
              
                const SizedBox(height: 50),
                //sign up button
                const Button1(),
             
                const SizedBox(height: 12),
                //login button
                const Button3(),
            
                Container(),
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}



