import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:music_app/models/playlist.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'music.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE playlists(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE songs(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, album TEXT NOT NULL, isFavorite INTEGER NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE playlist_songs(songId INTEGER, playlistId INTEGER, FOREIGN KEY (songId) REFERENCES songs (id), FOREIGN KEY (playlistId) REFERENCES playlists (id))",
        );
      },
      version: 1,
    );
  }

  Future<int> insertPlaylist(Playlist playlist) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('playlists', playlist.toMap());
    return result;
  }

  Future<List<Playlist>> retrievePlaylists() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('playlists');
    return queryResult.map((e) => Playlist.fromMap(e)).toList();
  }

  Future<void> deletePlaylist(int id) async {
    final db = await initializeDB();
    await db.delete(
      'playlists',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
