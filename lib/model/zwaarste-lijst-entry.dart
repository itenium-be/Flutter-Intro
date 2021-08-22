class ZwaarsteLijstEntry {
  final int ranking;
  final String artist;
  final String song;

  ZwaarsteLijstEntry(this.ranking, this.artist, this.song);

  @override
  String toString() {
    return '$ranking. $artist - $song';
  }
}
