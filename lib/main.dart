import 'package:flutter/material.dart';
import 'package:music_app/providers/audio_provider.dart';
import 'package:music_app/screens/navScreens/all_songs_screen.dart';
import 'package:music_app/screens/play_screen.dart';
import 'package:provider/provider.dart';

import 'screens/navigation_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AudioProvider())],
      child: const MyApp(),
    ),
  );
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
        textTheme: const TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(color: Colors.white70),
          bodyText2: TextStyle(color: Colors.white),
        ),
        unselectedWidgetColor: Colors.white70,
        selectedRowColor: Colors.white,
        toggleableActiveColor: Colors.white70,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const NavigationScreen(),
        PlayScreen.routeName: (ctx) => const PlayScreen(),
        AllSongsScreen.routeName: (ctx) => const AllSongsScreen(),
      },
    );
  }
}
