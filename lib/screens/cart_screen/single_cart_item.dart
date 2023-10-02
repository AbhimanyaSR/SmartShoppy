import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shopy/constants/constants.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/models/product_model/product_model.dart';
import 'package:smart_shopy/provider/app_provider.dart';

class SingleCartItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleCartItem({
    super.key,
    required this.singleProduct,
  });

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
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
    AppProvider appProvider = Provider.of<AppProvider>(context);

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
              height: 150,
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
                        Row(
                          children: [
                            //? Remove
                            CircleAvatar(
                              maxRadius: 13,
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
                            qty
                                .toString()
                                .text
                                .size(23)
                                .fontFamily(semibold)
                                .make(),
                            12.widthBox,

                            //? Add
                            CircleAvatar(
                              maxRadius: 13,
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
                            ),
                          ],
                        ),
                        15.heightBox,
                        MaterialButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (!appProvider.getFavoriteProductList.contains(
                              widget.singleProduct,
                            )) {
                              appProvider
                                  .addfavoriteProduct(widget.singleProduct);
                              showMessage(itemAddedtoWishlist);
                            } else {
                              setState(
                                () {
                                  appProvider.removeFavoriteProduct(
                                      widget.singleProduct);
                                  showMessage(itemRemovedfromWishlist);
                                },
                              );
                            }
                          },
                          child: Text(
                            appProvider.getFavoriteProductList
                                    .contains(widget.singleProduct)
                                ? removefromWishlist
                                : addtoWishlist,
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: semibold,
                            ),
                          ),
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

                        //* Delete
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 15,
                            right: 15,
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: redColor,
                          ).onTap(
                            () {
                              AppProvider appProvider =
                                  Provider.of<AppProvider>(context,
                                      listen: false);
                              appProvider
                                  .removeCartProduct(widget.singleProduct);
                              showMessage(
                                itemRemovedfromCart,
                              );
                            },
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
