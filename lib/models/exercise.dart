import 'package:flutter_gym_app/services/DBExerciseHelper.dart';

class Exercise {
  int id;
  int day_id;
  String trainingName;
  int targetNumber;
  int reachedNumber;
  double foodCalorise;
  double burnsCalories;
  int done;
  double wight;
  String url;
  Exercise({ this.id,this.day_id,this.trainingName,this.targetNumber,this.reachedNumber,this.foodCalorise,this.burnsCalories,this.done,this.wight,this.url});

Exercise.fromMap(Map<String, dynamic> map) {
    this.id = map[DBExerciseHelper.id];
    this.day_id = map[DBExerciseHelper.day_id];
    this.trainingName = map[DBExerciseHelper.trainingNam];
    this.targetNumber = map[DBExerciseHelper.targetNumber];
    this.reachedNumber = map[DBExerciseHelper.reachedNumber];
    this.foodCalorise = map[DBExerciseHelper.foodCalorise];
    this.burnsCalories = map[DBExerciseHelper.burnsCalories];
    this.done = map[DBExerciseHelper.done];
    this.wight = map[DBExerciseHelper.wight];
    this.url = map[DBExerciseHelper.url];
  }

  Map<String, dynamic> toMap() {
    return {
      DBExerciseHelper.day_id: day_id,
      DBExerciseHelper.trainingNam: trainingName,
      DBExerciseHelper.targetNumber: targetNumber,
      DBExerciseHelper.reachedNumber: reachedNumber,
      DBExerciseHelper.foodCalorise: foodCalorise,
      DBExerciseHelper.burnsCalories: burnsCalories,
      DBExerciseHelper.done: done,
      DBExerciseHelper.wight: wight ,
      DBExerciseHelper.url: url ,
        };
  }





}
