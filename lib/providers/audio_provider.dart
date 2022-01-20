import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import 'package:music_app/models/song.dart';
import 'package:music_app/services/song_loader.dart';

class AudioProvider extends ChangeNotifier {
  AudioPlayer _allSongsPlayer = AudioPlayer();
  AudioPlayer _playlistPlayer = AudioPlayer();
  AudioPlayer _favoritesPlayer = AudioPlayer();
  late SongLoader _loader;

  AudioPlayer get allSongs => _allSongsPlayer;

  void loadAllSongs() {
    List<AudioSource> _songs = [];
    _loader = SongLoader();
    _allSongsPlayer = AudioPlayer();
    _loader.requestPermission().then((permGranted) {
      var songs = _loader.getExtDir();
      for (int i = 0; i < songs.length; i++) {
        _songs.add(AudioSource.uri(
          Uri.parse(songs[i].path),
          tag: Song(title: p.basenameWithoutExtension(songs[i].path)),
        ));
      }
      _allSongsPlayer.setAudioSource(
        ConcatenatingAudioSource(children: _songs),
      );
    });
    notifyListeners();
  }

  AudioPlayer loadPlaylist(String playlistName) {
    List<AudioSource> _songs = [];
    _loader = SongLoader();
    _playlistPlayer = AudioPlayer();
    _loader.requestPermission().then((permGranted) {
      var songs = _loader.getExtDir();
      for (int i = 0; i < songs.length; i++) {
        _songs.add(AudioSource.uri(
          Uri.parse(songs[i].path),
          tag: 'Song' + i.toString(),
        ));
      }
      _playlistPlayer.setAudioSource(
        ConcatenatingAudioSource(children: _songs),
      );
    });
    return _playlistPlayer;
  }

  void loadFavorites() {
    List<AudioSource> _songs = [];
    _loader = SongLoader();
    _favoritesPlayer = AudioPlayer();
    _loader.requestPermission().then((permGranted) {
      var songs = _loader.getExtDir();
      for (int i = 0; i < songs.length; i++) {
        _songs.add(AudioSource.uri(
          Uri.parse(songs[i].path),
          tag: 'Song' + i.toString(),
        ));
      }
      _favoritesPlayer.setAudioSource(
        ConcatenatingAudioSource(children: _songs),
      );
    });
    notifyListeners();
  }
}
