import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'song_item.dart';

class SongListView extends StatelessWidget {
  final AudioPlayer _audioPlayer;
  const SongListView(this._audioPlayer, {Key? key}) : super(key: key);

  void playSong(int? index) {
    _audioPlayer
        .seek(const Duration(seconds: 0), index: index)
        .then((value) => _audioPlayer.play());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SequenceState?>(
      stream: _audioPlayer.sequenceStateStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final state = snapshot.data;
          final sequence = state?.sequence ?? [];
          return ListView.builder(
            itemCount: sequence.length,
            itemBuilder: (ctx, i) => SongItem(sequence[i], playSong, i),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
