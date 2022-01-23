import 'package:flutter/cupertino.dart';
import 'package:flutter_gym_app/models/day.dart';
import 'package:flutter_gym_app/services/DBHelper.dart';

class DBDayProvider extends ChangeNotifier {
  List<Day> dayes = [];
int dayId;

setDayId(id){
  this.dayId=id;
}
 fillList(List<Day> _day) {
    this.dayes = _day;
    notifyListeners();
  }

  insertIntoDatabase(Day day) async {
    await DBDayHelper.dbDayHelper.insertInToDatabase(day);
    getAllDays();
  }
  getAllDays() async {
    List<Map<String, dynamic>> rows =
        await DBDayHelper.dbDayHelper.getAllDaysDataFromDatabase();
    List<Day> listOfDays = rows.map((e) => Day.fromMap(e)).toList();
    fillList(listOfDays);
  }
getOneDayFromDatabase(int dayId)async{
 Map<String, dynamic> rows =await DBDayHelper.dbDayHelper.getOnePersonFromDatabase(dayId);
}
updateDay(Day day) async {
    await DBDayHelper.dbDayHelper.updateDataInDatabase(day);
    getAllDays();
  }

 deleteDay(Day day) async {
   await DBDayHelper.dbDayHelper.deleteOnePersonFromDatabase(day.id);
    getAllDays();
  }



}