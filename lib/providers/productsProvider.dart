import 'package:flutter/foundation.dart';

class PoductProvider extends ChangeNotifier {
  PoductProvider();
  var _productList = [
    {
      "id":2234,
      "name": "Evening Dress",
      "rating": 4.5,
      "company": "Dorothy Perkins",
      "price": 50,
      "image": "assets/images/product.png",
      "discount":10
    },
     {
      "id":2233,
      "name": "Evening Dress",
      "rating": 4.5,
      "company": "Dorothy Perkins",
      "price": 50,
      "image": "assets/images/product2.png",
      "discount":10

    },
     {
      "id":2236,
      "name": "Evening Dress",
      "rating": 4.5,
      "company": "Dorothy Perkins",
      "price": 50,
      "image": "assets/images/product4.png",
    },
    {
      "id":2231,
      "name": "Evening Dress",
      "rating": 4.5,
      "company": "Dorothy Perkins",
      "price": 50,
      "image": "assets/images/product2.png",
      "discount":10

    },
    {
      "id":2230,
      "name": "Evening Dress",
      "rating": 4.5,
      "company": "Dorothy Perkins",
      "price": 50,
      "image": "assets/images/product.png",
      "discount":10
    },
     {
      "id":2240,
      "name": "Evening Dress",
      "rating": 4.5,
      "company": "Dorothy Perkins",
      "price": 50,
      "image": "assets/images/product2.png",
      "discount":10

    },
  ];
  List get get_productList => _productList;

  void addProduct() {
    // _productList.add();
    notifyListeners();
  }
}
