import 'package:flutter/material.dart';
import 'package:smart_shopy/firebase/firebase_firestore_helper/firebase_firestore.dart';
import 'package:smart_shopy/models/product_model/product_model.dart';
import 'package:smart_shopy/models/user_model/user_model.dart';

class AppProvider with ChangeNotifier {
  UserModel? _userModel;
  UserModel? get getUserInfo => _userModel;

  //* Add Item to cart
  List<ProductModel> _cartProductList = [];

  void addCartProduct(ProductModel productModel) {
    _cartProductList.add(productModel);
    notifyListeners();
  }

  void removeCartProduct(ProductModel productModel) {
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getCartProductList => _cartProductList;

  //* Add item to favorite

  List<ProductModel> _favoriteProductList = [];

  void addfavoriteProduct(ProductModel productModel) {
    _favoriteProductList.add(productModel);
    notifyListeners();
  }

  void removeFavoriteProduct(ProductModel productModel) {
    _favoriteProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getFavoriteProductList => _favoriteProductList;

  //* User information

  getUserInfoFirebase() async {
    _userModel = await FirebaseFirestoreHelper.instance.getUserInfo();
    notifyListeners();
  }
}
