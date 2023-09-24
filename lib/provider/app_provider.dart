import 'package:flutter/material.dart';
import 'package:smart_shopy/models/product_model/product_model.dart';

class AppProvider with ChangeNotifier {
  List<ProductModel> _cartProductList = [];

  //* Add Item to cart
  void addCartProduct(ProductModel productModel) {
    _cartProductList.add(productModel);
    notifyListeners();
  }

  //* Add Item to cart
  void removeCartProduct(ProductModel productModel) {
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getCartProductList => _cartProductList;
}
