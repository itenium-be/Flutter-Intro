import 'package:flutter_intro/model/zwaarste-lijst-entry.dart';

ZwaarsteLijstResult zwaarsteLijst = new ZwaarsteLijstResult(2021, [
  new ZwaarsteLijstEntry(1, 'Metallica', 'Master of Puppets'),
  new ZwaarsteLijstEntry(2, 'Tool', 'Schism'),
  new ZwaarsteLijstEntry(3, 'Brutus', 'All Along'),
  new ZwaarsteLijstEntry(4, "Slayer", "Raining Blood"),
  new ZwaarsteLijstEntry(5, "Amerna", "A Solitary Reign"),
  new ZwaarsteLijstEntry(6, "Iron Maiden", "Fear of the Dark"),
  new ZwaarsteLijstEntry(7, "Rammstein", "Deutschland"),
  new ZwaarsteLijstEntry(8, "Steak Number Eight", "The Sea Is Dying"),
  new ZwaarsteLijstEntry(9, "Channel Zero", "Black Fuel"),
  new ZwaarsteLijstEntry(10, "Slipknot", "Duality"),
]);

class ZwaarsteLijstResult {
  final int year;
  final List<ZwaarsteLijstEntry> top10;

  ZwaarsteLijstResult(this.year, this.top10);
}
