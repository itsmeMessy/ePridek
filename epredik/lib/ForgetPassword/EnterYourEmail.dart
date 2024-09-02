import 'package:epredik_app/Button_and_textfield/my_button.dart';
import 'package:epredik_app/Button_and_textfield/my_textfield.dart';
import 'package:epredik_app/ForgetPassword/EnterNewPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordText extends StatelessWidget {
  final TextEditingController emailControler = TextEditingController();

  PasswordText({super.key});

  void login() {
    runApp(PasswordText());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF17153B),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svg/eplogoo.svg'),
                const SizedBox(height: 50),
                const Center(
                  child: Text(
                    "Just enter the email address you used for your account here at ePredik and we'll send you an email further instructions",
                    textAlign: TextAlign.center, // Center the text
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                MyTextField(
                  hintText: "E-mail",
                  obscureText: false,
                  controller: emailControler,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewPassword(),
                      ),
                    );
                  },
                  child: MyButton(
                    text: "Reset Password",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}