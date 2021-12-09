import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/widgets/app_drawer.dart';
import 'package:music_app/widgets/custom_app_bar.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({Key? key}) : super(key: key);
  static const routeName = '/player_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Play'),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Play Screen'),
      ),
    );
  }
}
