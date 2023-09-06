import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

List proyects = [
  {
    'name': 'Contador',
    'group': 'Flutter',
    'img': 'assets/images/contador-1.jpg',
    'description': 'Incrementa y decrementa',
  },
  {
    'name': 'Lista de tareas',
    'group': 'Flutter',
    'img': 'assets/images/lista_tareas-1.jpg',
    'description': 'Lista tareas pendientes',
  },
  {
    'name': 'Integrity',
    'group': 'Python',
    'img': 'assets/images/integrity-1.jpg',
    'description': 'Analisa la integirdad de documentos',
  },
  {
    'name': 'Control de Permisos',
    'group': 'Flutter',
    'img': 'assets/images/control_permisos.jpg',
    'description': 'Getina los permisos de los empleados',
  },
];

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ChangeTheme>(context).isGrey
          ? Colors.grey[300]
          : Colors.white,
      body: GroupedListView<dynamic, String>(
        elements: proyects,
        groupBy: (element) => element['group'],
        groupSeparatorBuilder: (String groupByValue) => Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Flexible(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        groupByValue,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        itemBuilder: (context, dynamic element) {
          return Card(
            elevation: 10,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      child: Image(
                        image: AssetImage(element['img']),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              element['name'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star, color: Colors.grey, size: 16),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    element['description'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemComparator: (item1, item2) =>
            item1['name'].compareTo(item2['name']), // optional
        useStickyGroupSeparators: true, // optional
        floatingHeader: true, // optional
        order: GroupedListOrder.ASC, // optional
      ),
    );
  }
}
