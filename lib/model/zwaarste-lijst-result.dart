import 'package:flutter_intro/model/zwaarste-lijst-entry.dart';

class ZwaarsteLijstResult {
  final int year;
  final List<ZwaarsteLijstEntry> top10;

  ZwaarsteLijstResult(this.year, this.top10);

  ZwaarsteLijstResult.fromJson(Map<String, dynamic> json)
      : year = json['year'],
        top10 = (json['top10'] as List)
            .map((e) => ZwaarsteLijstEntry.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() => {
        'year': year,
        'top10': top10,
      };
}
