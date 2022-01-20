import 'package:flutter/material.dart';
import 'package:music_app/widgets/app_drawer.dart';
import 'package:music_app/widgets/custom_app_bar.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key? key}) : super(key: key);
  static const routeName = '/playlist_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Playlist'),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Playlist Screen'),
      ),
    );
  }
}
