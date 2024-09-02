import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonRegister extends StatelessWidget {
  final VoidCallback onPressed; 

  const ButtonRegister({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      height: 50,
      child: CupertinoButton(
        color: const Color(0xFFC8ACD6),
        onPressed: onPressed, 
        child: Text(
          'Register',
          style: GoogleFonts.inter(
            color: const Color(0xFF17153B),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
