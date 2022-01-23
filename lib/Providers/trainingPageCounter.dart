
import 'package:flutter/cupertino.dart';

class TainingPageCounterProvider extends ChangeNotifier{

double weightCounter =0.0;
double literOfWaterCounter =0.0;


setwight(double number){
weightCounter=number;
notifyListeners();
}

setWaterCounter(double number){
literOfWaterCounter = number;
  notifyListeners();
}
incrementweight(){
weightCounter++;
notifyListeners();
}

decrementweight(){
  if(weightCounter!=0){
 weightCounter--;

  }
notifyListeners();
}


incrementLiterOfWater(){
literOfWaterCounter++;
notifyListeners();
}

decrementLiterOfWater(){
   if(literOfWaterCounter!=0){
literOfWaterCounter--;

  }
notifyListeners();
}

} 