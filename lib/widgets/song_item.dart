import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SongItem extends StatelessWidget {
  const SongItem(this.songItem, this.playSong, this.position, {Key? key})
      : super(key: key);
  final IndexedAudioSource songItem;
  final Function playSong;
  final int position;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.play_circle_fill_outlined,
        color: Theme.of(context).primaryColorLight,
      ),
      title: Text(songItem.tag.toString()),
      onTap: () {
        playSong(position);
      },
    );
  }
}
