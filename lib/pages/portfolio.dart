import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolioapp/components/bottom_nav_bar.dart';
import 'package:porfolioapp/pages/About.dart';
import 'package:porfolioapp/pages/home.dart';
import 'package:porfolioapp/pages/services.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  int selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    const About(),
    const Services(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ChangeTheme>(context).isGrey
          ? Colors.grey[300]
          : Colors.white,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Switch(
              value: Provider.of<ChangeTheme>(context).isGrey,
              onChanged: (value) {
                Provider.of<ChangeTheme>(context, listen: false).toggleTheme();
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Provider.of<ChangeTheme>(context).isGrey
            ? Colors.grey[900]
            : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        AssetImage('assets/images/felipe_gonzalez.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    color: Colors.grey[700],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Provider.of<ChangeTheme>(context).isGrey
                          ? Colors.grey
                          : Colors.black,
                    ),
                    title: Text(
                      'Inicio',
                      style: TextStyle(
                        color: Provider.of<ChangeTheme>(context).isGrey
                            ? Colors.grey
                            : Colors.black,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Provider.of<ChangeTheme>(context).isGrey
                          ? Colors.grey
                          : Colors.black,
                    ),
                    title: Text(
                      'Sobre mi',
                      style: TextStyle(
                        color: Provider.of<ChangeTheme>(context).isGrey
                            ? Colors.grey
                            : Colors.black,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 25),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Provider.of<ChangeTheme>(context).isGrey
                      ? Colors.grey
                      : Colors.black,
                ),
                title: Text(
                  'Salir',
                  style: TextStyle(
                    color: Provider.of<ChangeTheme>(context).isGrey
                        ? Colors.grey
                        : Colors.black,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}
