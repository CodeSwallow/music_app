import 'song.dart';

class Playlist {
  final int? id;
  String name;
  final List<Song> _songs = [];

  Playlist({this.id, required this.name});

  void addSong(Song song) {
    if (!_songs.contains(song)) {
      _songs.add(song);
    }
  }

  void removeSong(Song song) {
    _songs.removeWhere((item) => item.title == song.title);
  }

  List<Song> get songs => _songs;

  Playlist.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"];

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name};
  }
}
