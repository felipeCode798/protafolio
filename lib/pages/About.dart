import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolioapp/components/proyectstile.dart';
import 'package:porfolioapp/models/cart.dart';
import 'package:porfolioapp/models/proyects.dart';
import 'package:provider/provider.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Buscar...',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Soy Desarollado de Software, me encanta crear aplicaciones y aprender nuevas tecnologias.',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Proyectos Destacados',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Ver todos',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Proyects proyects = value.getProyectsList()[index];
                return ProyectsTile(
                  proyects: proyects,
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
