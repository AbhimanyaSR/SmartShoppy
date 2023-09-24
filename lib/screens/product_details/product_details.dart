import 'package:flutter/material.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/models/product_model/product_model.dart';

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
    return Scaffold(
      //* App bar
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),

      //* Body
      body: Padding(
        padding: const EdgeInsets.all(12),
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
                widget.singleProduct.name.text.fontFamily(bold).size(20).make(),
                IconButton(
                  onPressed: () {
                    setState(
                      () {
                        widget.singleProduct.isFavorite =
                            !widget.singleProduct.isFavorite;
                      },
                    );
                  },

                  //* product favorite Button
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
                    size: 30,
                  ).onTap(
                    () {
                      if (qty > 0) {
                        setState(() {
                          qty--;
                        });
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
                    size: 30,
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
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: addToCart.text.size(15).make(),
                ),
                25.widthBox,
                SizedBox(
                  height: 37,
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: buynow.text.size(15).make(),
                  ),
                )
              ],
            ),
            12.heightBox,
          ],
        ),
      ),
    );
  }
}
