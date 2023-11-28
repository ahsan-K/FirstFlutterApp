import 'package:flutter/foundation.dart';

class FavouritProvider extends ChangeNotifier {
  FavouritProvider();
  var _favouritList = [2236];
  List get get_favouritList => _favouritList;

  void addToFavourite(int id) {
    _favouritList.add(id);
    notifyListeners();
  }

  void removeFromFavourite(int id) {
    _favouritList.removeWhere((item) => item == id);
    notifyListeners();
  }
}
