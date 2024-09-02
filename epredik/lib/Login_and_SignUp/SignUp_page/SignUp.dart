import 'dart:async';
import 'package:epredik_app/Button_and_textfield/Button_Register.dart';
import 'package:epredik_app/ForgetPassword/EnterYourEmail.dart';
import 'package:epredik_app/Login_and_SignUp/Login_page/Login.dart';
import 'package:epredik_app/Button_and_textfield/my_textfield.dart';
import 'package:epredik_app/DropDown/School.dart';
import 'package:epredik_app/DropDown/Strand.dart';
import 'package:epredik_app/backend/services/auth_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  bool isLoading = false;
  String? errorMessage; 

  String? selectedStrand;
  String? selectedSchool;

 void signUp(BuildContext context) async {
  AuthServices authServices = AuthServices();
  String username = usernameController.text.trim();
  String email = emailController.text.trim();
  String password = passwordController.text.trim();
  String confirmPassword = confirmController.text.trim();

  setState(() {
    isLoading = true;
    errorMessage = null;
  });

  if (password != confirmPassword) {
    setState(() {
      errorMessage = 'Passwords do not match!';
      isLoading = false;
    });
    Timer(const Duration(seconds: 5), () {
      setState(() {
        errorMessage = null;
      });
    });
    return;
  }

  try {
    String result = await authServices.signUp(
        email, username, password, selectedSchool!, selectedStrand!);

    if (result == 'success') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      setState(() {
        errorMessage = result; 
        isLoading = false;
      });
      Timer(const Duration(seconds: 5), () {
        setState(() {
          errorMessage = null;
        });
      });
    }
  } catch (e) {
    setState(() {
      errorMessage = 'An error occurred: $e';
      isLoading = false;
    });
    Timer(const Duration(seconds: 5), () {
      setState(() {
        errorMessage = null;
      });
    });
  } finally {
    setState(() {
      isLoading = false;
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
                      hintText: "Username",
                      obscureText: false,
                      controller: usernameController,
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      hintText: "Email",
                      obscureText: false,
                      controller: emailController,
                    ),
                    const SizedBox(height: 10),
                    DropdownStrand(
                      onStrandSelected: (value) {
                        selectedStrand = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    SchoolPage(
                      onSchoolSelected: (value) {
                        selectedSchool = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      hintText: "Password",
                      obscureText: true,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      hintText: "Confirm Password",
                      obscureText: true,
                      controller: confirmController,
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
                    ButtonRegister(
                      onPressed: () => signUp(context),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
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
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          child: const Text(
                            "Login Here",
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
                color: Colors.black54, // Semi-transparent background
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
