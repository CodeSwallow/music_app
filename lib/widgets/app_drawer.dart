import 'package:flutter/material.dart';
import 'package:music_app/screens/play_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Colors.blueGrey, Colors.purple],
              ),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              style: const ButtonStyle(
                alignment: Alignment.centerLeft,
              ),
              icon: const Icon(Icons.home),
              label: const Text('Home'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              style: const ButtonStyle(
                alignment: Alignment.centerLeft,
              ),
              icon: const Icon(Icons.play_arrow),
              label: const Text('Playlists'),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(PlayScreen.routeName);
              },
            ),
          ),
          // SizedBox(
          //   width: double.infinity,
          //   child: TextButton.icon(
          //     style: ButtonStyle(
          //       alignment: Alignment.centerLeft,
          //     ),
          //     icon: Icon(Icons.star),
          //     label: Text('Favorites'),
          //     onPressed: () {
          //       Navigator.of(context)
          //           .pushReplacementNamed(SongListScreen.routeName);
          //     },
          //   ),
          // ),
          // SizedBox(
          //   width: double.infinity,
          //   child: TextButton.icon(
          //     style: ButtonStyle(
          //       alignment: Alignment.centerLeft,
          //     ),
          //     icon: Icon(Icons.music_note),
          //     label: Text('Songs'),
          //     onPressed: () {
          //       Navigator.of(context).pushNamed(PlayerScreen.routeName);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
