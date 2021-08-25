class ZwaarsteLijstEntry {
  final int ranking;
  final String artist;
  final String song;

  ZwaarsteLijstEntry(this.ranking, this.artist, this.song);

  ZwaarsteLijstEntry.fromJson(Map<String, dynamic> json)
      : ranking = json['ranking'],
        artist = json['artist'],
        song = json['song'];

  Map<String, dynamic> toJson() => {
        'artist': artist,
        'song': song,
      };

  @override
  String toString() {
    return '$ranking. $artist - $song';
  }

  String getIconAssetName() {
    String escapedName = this.artist.toLowerCase().replaceAll(' ', '_');
    return 'assets/graphics/bands/$escapedName.png';
  }
}
