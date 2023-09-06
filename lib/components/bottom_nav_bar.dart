import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:porfolioapp/const/colors.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(
          color: ColorsApp.white,
        ),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Inicio',
          ),
          GButton(
            icon: Icons.work,
            text: 'Portafolio',
          ),
          // GButton(
          //   icon: Icons.person,
          //   text: 'Sobre Mi',
          // ),
        ],
      ),
    );
  }
}
