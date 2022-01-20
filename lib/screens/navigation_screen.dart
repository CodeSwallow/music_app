import 'package:flutter/material.dart';
import 'package:music_app/services/database_handler.dart';
import 'package:provider/provider.dart';
import 'package:music_app/providers/audio_provider.dart';

import 'package:music_app/screens/navScreens/all_songs_screen.dart';
import 'package:music_app/screens/navScreens/favorites_screen.dart';
import 'package:music_app/screens/navScreens/home_screen.dart';
import 'package:music_app/screens/navScreens/playlist_screen.dart';
import 'package:music_app/screens/navScreens/search_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late DatabaseHandler dbHandler;
  int currentIndex = 0;
  List screens = [
    const HomeScreen(),
    const AllSongsScreen(),
    const PlaylistScreen(),
    const FavoritesScreen(),
    const SearchScreen(),
  ];

  @override
  void initState() {
    super.initState();

    dbHandler = DatabaseHandler();
    dbHandler.initializeDB();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<AudioProvider>(context, listen: false).loadAllSongs();
    });
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.grey.withOpacity(.5),
        showUnselectedLabels: true,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_sharp),
            label: 'All Songs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_sharp),
            label: 'Playlists',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_sharp),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_sharp),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
