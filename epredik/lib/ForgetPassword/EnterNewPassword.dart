import 'package:epredik_app/Button_and_textfield/my_button.dart';
import 'package:epredik_app/Button_and_textfield/my_textfield.dart';
import 'package:epredik_app/ForgetPassword/EnterYourEmail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class NewPassword extends StatelessWidget {
   final TextEditingController typepassowordcontroler = TextEditingController();
   final TextEditingController retypepasswordcontroler = TextEditingController();

   NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF17153B),
        appBar: AppBar(
          backgroundColor: const Color(0xFF17153B),
          leading: IconButton(onPressed: () {

            Navigator.push(context,MaterialPageRoute(builder: (context) => PasswordText()),);

            }, 
            
          icon: const Icon(Icons.arrow_back_ios_new_rounded), color: white,),

          title: Text(
                      'Back',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                 const Row(
                  children: [
                    Text(
                      "Set New Password", 
                      textAlign: TextAlign.left, 
                      style: TextStyle(
                        fontSize: 20, 
                        color: white, 
                        fontWeight: 
                        FontWeight.w400), ),
                  ],
                ),

                const SizedBox(height: 10),
                MyTextField(
                      hintText: "Type a Password",
                      obscureText: true,
                      controller: typepassowordcontroler,
                    ),
                const SizedBox(height: 10,),
                MyTextField(
                      hintText: "Retype Password",
                      obscureText: true,
                      controller: retypepasswordcontroler,
                    ),    
                const SizedBox(height: 10),
            
                    MyButton(
                      text: "Save and Sign in",
                      onPressed: () {
                        
                      },
                    ),           
                
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}