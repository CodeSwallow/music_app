import 'package:flutter/material.dart';
import 'package:music_app/providers/audio_provider.dart';
import 'package:provider/provider.dart';
import 'package:music_app/widgets/app_drawer.dart';
import 'package:music_app/widgets/custom_app_bar.dart';
import 'package:music_app/widgets/song_listview.dart';

class AllSongsScreen extends StatelessWidget {
  const AllSongsScreen({Key? key}) : super(key: key);
  static const routeName = '/all_songs_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Home'),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SongListView(context.read<AudioProvider>().allSongs),
            ),
          ],
        ),
      ),
    );
  }
}
