import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class SongLoader {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  Future<bool> requestPermission() async {
    var status = await Permission.storage.request();
    return status.isGranted;
  }

  List<FileSystemEntity> getExtDir() {
    Directory dir = Directory('/storage/emulated/0/Music');
    List<FileSystemEntity> _files;
    _files = dir.listSync(recursive: true, followLinks: false);
    List<FileSystemEntity> _songs = [];

    for (FileSystemEntity entity in _files) {
      String path = entity.path;
      if (path.endsWith('.mp3')) _songs.add(entity);
    }
    return _songs;
  }
}
