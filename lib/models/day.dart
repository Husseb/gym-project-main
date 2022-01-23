import 'package:flutter_gym_app/services/DBHelper.dart';

class Day {
  int id;
  String dayName;
  String dateOfDate;
  double literOfWater;
  double weight;
  Day({this.id, this.dayName, this.dateOfDate, this.literOfWater, this.weight});

  Day.fromMap(Map<String, dynamic> map) {
    this.id = map[DBDayHelper.id];
    this.dayName = map[DBDayHelper.day];
    this.dateOfDate = map[DBDayHelper.date];
    this.literOfWater = map[DBDayHelper.water];
    this.weight = map[DBDayHelper.wight];
  }

  Map<String, dynamic> toMap() {
    return {
      DBDayHelper.id: id,
      DBDayHelper.day: dayName,
      DBDayHelper.date: dateOfDate,
      DBDayHelper.water: literOfWater,
      DBDayHelper.wight: weight,
    };
  }
}
