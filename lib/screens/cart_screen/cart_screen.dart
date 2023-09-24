import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/provider/app_provider.dart';
import 'package:smart_shopy/screens/cart_screen/single_cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      //* App bar
      appBar: AppBar(
        title: myCart.text.size(23).fontFamily(bold).make(),
      ),
      //* Body
      body: appProvider.getCartProductList.isEmpty
          ? Center(
              child: yourCartisEmpty.text.fontFamily(semibold).size(16).make(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: appProvider.getCartProductList.length,
              itemBuilder: (context, index) {
                return SingleCartItem(
                  singleProduct: appProvider.getCartProductList[index],
                );
              },
            ),
    );
  }
}
