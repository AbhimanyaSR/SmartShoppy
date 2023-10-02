import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shopy/constants/constants.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/constants/routes.dart';
import 'package:smart_shopy/models/product_model/product_model.dart';
import 'package:smart_shopy/provider/app_provider.dart';
import 'package:smart_shopy/screens/buy_product/check_out.dart';
import 'package:smart_shopy/screens/cart_screen/cart_screen.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({super.key, required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      //* App bar
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Routes.instance
                  .push(widget: const CartScreen(), context: context);
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),

      //* Body
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* Product Image
              Image.network(
                widget.singleProduct.image,
                height: 400,
                width: 400,
              ),
              15.heightBox,

              //* product Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.singleProduct.name.text
                      .fontFamily(bold)
                      .size(20)
                      .make(),

                  //* product favorite Button
                  IconButton(
                    onPressed: () {
                      setState(
                        () {
                          widget.singleProduct.isFavorite =
                              !widget.singleProduct.isFavorite;
                        },
                      );
                      if (widget.singleProduct.isFavorite) {
                        appProvider.addfavoriteProduct(widget.singleProduct);
                      } else {
                        appProvider.removeFavoriteProduct(widget.singleProduct);
                        setState(() {
                          widget.singleProduct.isFavorite = false;
                        });
                      }
                    },
                    icon: widget.singleProduct.isFavorite
                        ? const Icon(
                            Icons.favorite,
                            color: redColor,
                          )
                        : const Icon(
                            Icons.favorite_border_outlined,
                          ),
                  ),
                  12.heightBox,
                ],
              ),

              //* Product Description
              widget.singleProduct.description.text.make(),
              16.heightBox,
              Row(
                children: [
                  CircleAvatar(
                    maxRadius: 15,
                    backgroundColor: redColor,
                    child: const Icon(
                      Icons.remove,
                    ).onTap(
                      () {
                        if (qty > 0) {
                          setState(
                            () {
                              qty--;
                            },
                          );
                        }
                      },
                    ),
                  ),
                  12.widthBox,

                  //* Item Quantity
                  qty.toString().text.size(23).fontFamily(semibold).make(),
                  12.widthBox,
                  CircleAvatar(
                    maxRadius: 15,
                    backgroundColor: redColor,
                    child: const Icon(
                      Icons.add,
                    ).onTap(
                      () {
                        setState(
                          () {
                            qty++;
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
              // const Spacer(),

              30.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //* Add to cart button
                  OutlinedButton(
                    onPressed: () {
                      // AppProvider appProvider =
                      //     Provider.of<AppProvider>(context, listen: false);
                      ProductModel productModel =
                          widget.singleProduct.copyWith(qty: qty);
                      appProvider.addCartProduct(productModel);
                      showMessage(
                        itemAddedtoCart,
                      );
                    },
                    child: addToCart.text.size(15).make(),
                  ),

                  //* buy now button
                  25.widthBox,
                  SizedBox(
                    height: 37,
                    width: 130,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                      ),
                      onPressed: () {
                        Routes.instance.push(
                          widget: const CheckOut(),
                          context: context,
                        );
                      },
                      child: buynow.text.color(whiteColor).size(15).make(),
                    ),
                  )
                ],
              ),
              50.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
