import 'package:epredik_app/User_Page/Home_page.dart';
import 'package:epredik_app/User_Page/Setting_page.dart';
import 'package:epredik_app/User_Page/Undecided_Page.dart';
import 'package:epredik_app/User_Page/result.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nb_utils/nb_utils.dart';

class NavUser extends StatefulWidget {
  const NavUser({super.key});

  @override
  State<NavUser> createState() => _NavUserState();
}

class _NavUserState extends State<NavUser> {
  int navBarIndex = 0;
  List navBody = [
    const HomePage(),
    const UndecidedPage(),
    const SettingPage(),
    const ResultPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFF17153B),
      body: navBody[navBarIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        child: GNav(
          hoverColor: const Color(0xFFC8ACD6).withOpacity(0.10),
          gap: 5,
          tabBorderRadius: 16,
          color: white,
          activeColor: white,
          haptic: true, 
          tabBackgroundColor: const Color(0xFFC8ACD6,).withOpacity(0.10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          
          tabs: const[
            GButton(icon: Icons.home, text: "Home",),
            GButton(icon: Icons.favorite_border_outlined, text: "e-Predik",),
            GButton(icon: Icons.recommend_outlined, text: "Recommend",),
            GButton(icon: Icons.settings, text: "Settings",),
          ],

        selectedIndex: navBarIndex,
        onTabChange: (index){
          setState(() {
            navBarIndex = index;
          });
        },
        ),
      ),
      
    );
  }
}