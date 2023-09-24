import 'package:flutter/material.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/constants/routes.dart';
import 'package:smart_shopy/firebase/firebase_firestore_helper/firebase_firestore.dart';
import 'package:smart_shopy/models/category_model/category_model.dart';
import 'package:smart_shopy/models/product_model/product_model.dart';
import 'package:smart_shopy/screens/product_details/product_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categoriesList = [];
  List<ProductModel> productModelList = [];
  bool isLoading = false;

  @override
  void initState() {
    getCategoryList();
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    categoriesList = await FirebaseFirestorehelper.instance.getCategories();
    productModelList = await FirebaseFirestorehelper.instance.getBestProducts();
    productModelList.shuffle();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* App bar
      appBar: AppBar(
        title: Text(
          appname,
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    //* App title
                    // const TopTitle(
                    //   title: appname,
                    //   subTitle: '',
                    // )
                    //     .box
                    //     .padding(
                    //       const EdgeInsets.only(
                    //         left: 12,
                    //         top: 5,
                    //       ),
                    //     )
                    //     .make(),

                    //* Search field
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: searchAnything,
                        hintStyle: TextStyle(
                          color: redColor.withOpacity(.5),
                        ),
                        prefixIcon: Image.asset(
                          icSearch,
                          color: redColor,
                          scale: 2.5,
                        ),
                      ),
                    )
                        .box
                        .padding(
                          const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                        )
                        .make(),
                    15.heightBox,

                    //* categories title
                    categories.text
                        .size(20)
                        .fontFamily(bold)
                        .make()
                        .box
                        .padding(
                          const EdgeInsets.all(12),
                        )
                        .make(),

                    //* Categories items
                    5.heightBox,
                    categoriesList.isEmpty
                        ? const Center(
                            child: Text('Categories is empty'),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: categoriesList
                                  .map(
                                    (e) => Card(
                                      color: whiteColor,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image.network(e.image),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),

                    //* Best products title
                    27.heightBox,
                    bestProd.text
                        .size(20)
                        .fontFamily(bold)
                        .make()
                        .box
                        .padding(
                          const EdgeInsets.all(12),
                        )
                        .make(),
                    2.heightBox,

                    //* Best products items
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

                                      // SizedBox(
                                      //   height: 80,
                                      //   width: 100,
                                      //   child: Image.network(
                                      //     singleProduct.image,
                                      //     fit: BoxFit.fill,
                                      //   ),
                                      // ),
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
                                        // style: OutlinedButton.styleFrom(
                                        //   backgroundColor: lightGold,
                                        //   foregroundColor: redColor.withOpacity(.1),
                                        //   side: const BorderSide(
                                        //     color: redColor,
                                        //     width: 0.7,
                                        //   ),
                                        // ),
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
