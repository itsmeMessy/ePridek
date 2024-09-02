import 'package:epredik_app/Button_and_textfield/button_login.dart';
import 'dart:async';
import 'package:epredik_app/Button_and_textfield/my_textfield.dart';
import 'package:epredik_app/ForgetPassword/EnterYourEmail.dart';
import 'package:epredik_app/Login_and_SignUp/SignUp_page/SignUp.dart';
import 'package:epredik_app/User_Page/Home_page.dart';
import 'package:epredik_app/backend/services/auth_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;

  void login(BuildContext context) async {
    AuthServices authServices = AuthServices();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    setState(() {
      isLoading = true;
      errorMessage = null; 
    });

    String result = await authServices.login(email, password);

    setState(() {
      isLoading = false;
    });

    if (result == 'success') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      setState(() {
        errorMessage = result; // Display the error message below the logo
      });
      
      // Automatically clear the error message after 5 seconds
      Timer(const Duration(seconds: 5), () {
        setState(() {
          errorMessage = null; // Clear the error message
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF17153B),
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/eplogoo.svg'),
                    const SizedBox(height: 20),
                    // Display error message below the logo
                    if (errorMessage != null)
                      Text(
                        errorMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    const SizedBox(height: 20),
                    MyTextField(
                      hintText: "E-mail",
                      obscureText: false,
                      controller: emailController,
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      hintText: "Password",
                      obscureText: true,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PasswordText()),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                color: Color(0xFFC8ACD6),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ButtonLogin(
                      onPressed: () => login(context),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              color: Color(0xFFC8ACD6),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpPage()),
                            );
                          },
                          child: const Text(
                            "Register Here",
                            style: TextStyle(
                              color: Color(0xFFC8ACD6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Loading overlay
            if (isLoading)
              Container(
                color: Colors.black54,
                child: Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
