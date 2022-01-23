import 'package:flutter/cupertino.dart';

class ExercissDetailsCounterProvider extends ChangeNotifier {
  int reachedNumber = 0;
  int targiteNumber = 0;
  double weight = 0.0;
  double caloriesBurned = 0.0;
  double caloriesFood = 0.0;
  int done = 0;

  setNumer(int num1) {
    this.reachedNumber = num1;
    notifyListeners();
  }

  settargiteNumber(int num1) {
    this.targiteNumber = num1;
    notifyListeners();
  }

  setweight(double weight1) {
    this.weight = weight1;
    notifyListeners();
  }

  setcaloriesBurned(double caloriesBurned1) {
    this.caloriesBurned = caloriesBurned1;
    notifyListeners();
  }

  setcaloriesFood(double caloriesFood1) {
    this.caloriesFood = caloriesFood1;
    notifyListeners();
  }

  setDone(done1) {
    this.done = done1;
  }

  numberIncrease() {
    reachedNumber++;
    notifyListeners();
  }

  numberDecrease() {
    if (reachedNumber != 0) {
      reachedNumber--;
      notifyListeners();
    }
  }

  targiteNumberIncrease() {
    targiteNumber++;
    notifyListeners();
  }

  targiteNumberDecrease() {
    if (targiteNumber != 0) {
      targiteNumber--;
      notifyListeners();
    }
  }

  weightIncrease() {
    weight++;
    notifyListeners();
  }

  weightDecrease() {
    if (weight != 0) {
      weight--;
      notifyListeners();
    }
  }

  caloriesBurnedIncrease() {
    caloriesBurned++;
    notifyListeners();
  }

  caloriesBurnedDecrease() {
    if (caloriesBurned != 0) {
      caloriesBurned--;
      notifyListeners();
    }
  }

  caloriesFoodBIncrease() {
    caloriesFood++;
    notifyListeners();
  }

  caloriesFoodDecrease() {
    if (caloriesFood != 0) {
      caloriesFood--;
      notifyListeners();
    }
  }
}
