import 'package:climate/screen/city_screen.dart';
import 'package:climate/screen/loading_screen.dart';
import 'package:climate/screen/location_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/locationscreen': (context) => LocationScreen(),
        '/cityscreen': (context) => CityScreen()
      },
    );
  }
}
