import 'package:flutter/cupertino.dart';
import 'package:flutter_gym_app/models/ChartItem.dart';

class CahrtProvider extends ChangeNotifier {
  List<ChartItem> mapCahrt;

  setListItemDatatCahrt(List<ChartItem> newItemsCahrt) {
    this.mapCahrt = newItemsCahrt;
    notifyListeners();
  }
}
