import 'package:coffee_app/providers/favouriteProvider.dart';
import 'package:flutter/material.dart';
import 'screens/getStarted.dart';
import 'screens/home.dart';
import 'screens/profile.dart';
import 'screens/productList.dart';
import 'package:provider/provider.dart';
import './providers/productsProvider.dart';
import './providers/productsProvider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PoductProvider()),
        ChangeNotifierProvider(create: (_) => FavouritProvider()),

      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Home(),
      ),
      routes: {
        '/home': (context) => Home(),
        '/profile':(context) => Profile(),
        '/products':(context) => ProductList(),
      },
    );
  }
}
