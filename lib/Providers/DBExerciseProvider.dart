import 'package:flutter/cupertino.dart';
import 'package:flutter_gym_app/models/exercise.dart';
import 'package:flutter_gym_app/services/DBExerciseHelper.dart';

class DBExerciseProvider extends ChangeNotifier {
  List<Exercise> exercises = [];

 fillList(List<Exercise> _exercise) {
    this.exercises = _exercise;
    notifyListeners();
  }

  insertIntoDatabase(Exercise exercise) async {
   await DBExerciseHelper.dbexerciseHelper.insertInToDatabase(exercise);
   getAllExercises(exercise.day_id);
  }
  
  getAllExercises(int day_id) async {
    List<Map<String, dynamic>> rows =
        await DBExerciseHelper.dbexerciseHelper.getAllexerciseDataFromDatabase(day_id);
    List<Exercise> listOfexcersise = rows.map((e) => Exercise.fromMap(e)).toList();
    fillList(listOfexcersise);
  }

  
   getAllExercises2() async {
    List<Map<String, dynamic>> rows =
        await DBExerciseHelper.dbexerciseHelper.getAllexerciseDataFromDatabase2();
    List<Exercise> listOfexcersise = rows.map((e) => Exercise.fromMap(e)).toList();
    fillList(listOfexcersise);
  }

getOneexerciseFromDatabase(int exId,int day_id)async{
 return await DBExerciseHelper.dbexerciseHelper.getOneexerciseFromDatabase(exId,day_id);
}
isExsisteInDatabase(int dayId)async{
 return await DBExerciseHelper.dbexerciseHelper.isExsisteInDatabase(dayId);
}


updateExercise(Exercise exercise) async {
    await  DBExerciseHelper.dbexerciseHelper.updateEXerciseDataInDatabase(exercise);
   getAllExercises(exercise.day_id);
  }

 deleteExercise(Exercise exercise) async {
   await DBExerciseHelper.dbexerciseHelper.deleteOneExerciseFromDatabase(exercise.id);
  //  getAllExercises();
  }

}