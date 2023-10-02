import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shopy/constants/constants.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/models/product_model/product_model.dart';
import 'package:smart_shopy/provider/app_provider.dart';

class SingleFavourieItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleFavourieItem({
    super.key,
    required this.singleProduct,
  });

  @override
  State<SingleFavourieItem> createState() => _SingleFavourieItemState();
}

class _SingleFavourieItemState extends State<SingleFavourieItem> {
  int qty = 1;

  @override
  void initState() {
    qty = widget.singleProduct.qty ?? 1;
    setState(
      () {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: redColor,
          width: 2.5,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 140,
              color: redColor.withOpacity(.1),
              child: Image.network(
                widget.singleProduct.image,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 140,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* Item Name
                        20.heightBox,
                        widget.singleProduct.name.text
                            .color(backClr)
                            .size(16)
                            .fontFamily(bold)
                            .make(),

                        15.heightBox,

                        //* item Count
                        15.heightBox,
                        removefromWishlist.text
                            .size(15)
                            .color(redColor)
                            .fontFamily(semibold)
                            .make()
                            .onTap(
                          () {
                            setState(
                              () {
                                widget.singleProduct.isFavorite = false;
                              },
                            );
                            // AppProvider appProvider = Provider.of<AppProvider>(
                            //     context,
                            //     listen: false);
                            // appProvider
                            //     .removeFavoriteProduct(widget.singleProduct);
                            setState(() {
                              AppProvider appProvider =
                                  Provider.of<AppProvider>(
                                context,
                                listen: false,
                              );
                              appProvider
                                  .removeFavoriteProduct(widget.singleProduct);
                            });
                            showMessage(
                              itemRemovedfromWishlist,
                            );
                          },
                        ),
                      ],
                    ),
                    //* Price
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                              right: 15,
                              bottom: 0,
                            ),
                            child: '₹ ${widget.singleProduct.price}'
                                .text
                                .size(15)
                                .color(Colors.black)
                                .fontFamily(semibold)
                                .make(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
