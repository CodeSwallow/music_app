import 'package:flutter/material.dart';
import 'package:music_app/screens/play_screen.dart';

import './screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        colorScheme: const ColorScheme.dark(),
      ),
      //home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const HomeScreen(),
        PlayScreen.routeName: (ctx) => PlayScreen(),
      },
    );
  }
}
