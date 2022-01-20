class Song {
  final int? id;
  String title;
  late String album;
  bool _isFavorite = false;
  Duration? duration;

  Song({this.id, required this.title, this.album = 'Unknown', this.duration});

  void setFavorite() {
    if (_isFavorite) {
      _isFavorite = false;
    } else {
      _isFavorite = true;
    }
  }

  int boolToInt() {
    if (_isFavorite) {
      return 1;
    } else {
      return 0;
    }
  }

  Song.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["name"],
        album = res["album"],
        _isFavorite = res["isFavorite"] == 0 ? false : true;

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'album': album,
      'isFavorite': boolToInt()
    };
  }

  @override
  String toString() {
    return title;
  }
}
