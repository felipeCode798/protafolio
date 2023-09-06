import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolioapp/const/colors.dart';
import 'package:porfolioapp/pages/portfolio.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ChangeTheme>(context).isGrey
          ? Colors.grey[300]
          : Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundImage:
                    AssetImage('assets/images/felipe_gonzalez.png'),
              ),
              const SizedBox(height: 48),
              Text(
                'Felipe Gonzalez',
                style: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Desarrollador de Software',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: ColorsApp.blue,
                  ),
                  title: Text(
                    '+57 315 369 2739',
                    style: TextStyle(
                      color: ColorsApp.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: ColorsApp.blue,
                  ),
                  title: Text(
                    'felipe.gonzale.123@gmail.com',
                    style: TextStyle(
                      color: ColorsApp.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Portfolio(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsApp.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(25),
                  child: Center(
                    child: Text(
                      'Ver Portafolio',
                      style: TextStyle(
                        color: ColorsApp.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
