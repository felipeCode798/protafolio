import 'package:flutter/material.dart';
import 'package:porfolioapp/pages/home.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => ChangeTheme()),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
