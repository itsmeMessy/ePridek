import 'package:epredik_app/User_Page/nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SampleButton extends StatefulWidget {
  const SampleButton({super.key});

  @override
  _SampleButtonState createState() => _SampleButtonState();
}

class _SampleButtonState extends State<SampleButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        decoration: BoxDecoration(
          color: _isHovered ? CupertinoColors.systemPurple : const Color(0xFFC8ACD6).withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: CupertinoButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NavUser()),
            );
          },
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

