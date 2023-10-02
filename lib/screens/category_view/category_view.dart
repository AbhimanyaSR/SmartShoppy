import 'package:flutter/material.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/constants/routes.dart';
import 'package:smart_shopy/firebase/firebase_firestore_helper/firebase_firestore.dart';
import 'package:smart_shopy/models/category_model/category_model.dart';
import 'package:smart_shopy/models/product_model/product_model.dart';
import 'package:smart_shopy/screens/product_details/product_details.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ProductModel> productModelList = [];
  bool isLoading = false;

  void getCategoryList() async {
    setState(
      () {
        isLoading = true;
      },
    );
    productModelList = await FirebaseFirestoreHelper.instance
        .getCategoryViewProduct(widget.categoryModel.id);
    productModelList.shuffle();
    setState(
      () {
        isLoading = false;
      },
    );
  }

  @override
  void initState() {
    getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* App Bar
      //* App bar
      appBar: AppBar(
        title: Text(
          widget.categoryModel.name,
          style: const TextStyle(
            fontSize: 23,
          ),
        ),
      ),

      //* Body
      body: isLoading
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  color: redColor,
                ),
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    productModelList.isEmpty
                        ? const Center(
                            child: Text(
                              'Products is empty',
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(5),
                            child: GridView.builder(
                              itemCount: productModelList.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 0.76,
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                ProductModel singleProduct =
                                    productModelList[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: redColor.withOpacity(.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    children: [
                                      12.heightBox,
                                      //? Image
                                      Image.network(
                                        singleProduct.image,
                                        fit: BoxFit.fill,
                                      )
                                          .box
                                          .color(Colors.transparent)
                                          .height(100)
                                          .make(),

                                      //? Name
                                      20.heightBox,
                                      singleProduct.name.text
                                          .color(backClr)
                                          .size(16)
                                          .fontFamily(semibold)
                                          .make(),

                                      //? Price
                                      5.heightBox,
                                      '₹ ${singleProduct.price}'
                                          .text
                                          .color(Colors.black)
                                          .fontFamily(regular)
                                          .make(),

                                      22.heightBox,

                                      //? Button
                                      OutlinedButton(
                                        onPressed: () {
                                          Routes.instance.push(
                                            widget: ProductDetails(
                                                singleProduct: singleProduct),
                                            context: context,
                                          );
                                        },
                                        child: const Text(
                                          'Buy',
                                          // style: TextStyle(color: redColor),
                                        ),
                                      ).box.height(40).width(130).make(),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                    15.heightBox,
                  ],
                ),
              ),
            ),
    );
  }
}
