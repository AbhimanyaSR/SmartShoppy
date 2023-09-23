import 'package:flutter/material.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/models/product_model/product_model.dart';
import 'package:smart_shopy/widgets/top_title/top_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitle(
              title: appname,
              subTitle: '',
            )
                .box
                .padding(
                  const EdgeInsets.only(
                    left: 12,
                    top: 5,
                  ),
                )
                .make(),
            TextFormField(
              decoration: InputDecoration(
                hintText: searchAnything,
                prefixIcon: Image.asset(
                  icSearch,
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
            categories.text
                .size(18)
                .fontFamily(bold)
                .make()
                .box
                .padding(
                  const EdgeInsets.all(12),
                )
                .make(),
            5.heightBox,
            SingleChildScrollView(
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
                          child: Image.network(e),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            10.heightBox,
            bestProduct.text
                .size(18)
                .fontFamily(bold)
                .make()
                .box
                .padding(
                  const EdgeInsets.all(12),
                )
                .make(),
            5.heightBox,

            //!
            12.heightBox,
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Container(
                  color: redColor.withOpacity(0.6),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

List<String> categoriesList = [
  "https://static.vecteezy.com/system/resources/thumbnails/000/964/198/small/fast-food-meal-set.jpg",
  "https://www.vector-eps.com/wp-content/gallery/fast-food-vector-icons/fast-food-vector1.jpg",
  "https://t4.ftcdn.net/jpg/03/31/10/91/360_F_331109152_MgHfVaOOrcqzbIZ4bzi69Na6RJKa7NgJ.jpg",
  "https://static.vecteezy.com/system/resources/thumbnails/000/964/198/small/fast-food-meal-set.jpg",
  "https://img.freepik.com/free-vector/hand-drawn-delicious-locro-illustration_23-2149197200.jpg?w=2000",
];

List<ProductModel> bestProducts = [
  //! 1
  ProductModel(
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuFwxYSxRxbgfgb34BTdK6mkQHfQenpI1RZg&usqp=CAU',
    id: '1',
    name: 'Banana',
    price: '40',
    description:
        "Fresh, ripe bananas! These delicious and nutritious fruits are a perfect snack or addition to your favorite recipes. Bananas are known for their sweet, tropical flavor and smooth texture. Packed with essential vitamins and minerals, they are a great source of potassium and provide a quick energy boost. Don't miss out on this healthy and convenient snack option. Grab a bunch of bananas today!",
    status: 'Pending',
    isFavorite: false,
  ),

  //! 2
  ProductModel(
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT--WPkHaBaMR4mb8b5IOtdm1o8xn9JtAGsd2IijAIe53Cc5hlgPg8_L21p4AGAi5YykZI&usqp=CAU',
    id: '2',
    name: 'Apple',
    price: '100',
    description:
        " Crisp and juicy apples! These delightful fruits are a delightful blend of sweetness and tartness, making them a versatile and healthy choice. Apples are packed with essential nutrients, including dietary fiber and vitamin C. They're perfect for snacking, adding to salads, or baking into pies and crisps. With a wide variety of flavors and colors, there's an apple for everyone's taste. Don't miss the chance to enjoy the natural goodness of apples – pick up a bag today!",
    status: 'Pending',
    isFavorite: false,
  ),

  //! 3
  ProductModel(
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6FC4a2s4XcKtZlFv5-VhXxlSWax5tdQGjZg&usqp=CAU',
    id: '3',
    name: 'Orange',
    price: '60',
    description:
        "Fresh, ripe bananas! These delicious and nutritious fruits are a perfect snack or addition to your favorite recipes. Bananas are known for their sweet, tropical flavor and smooth texture. Packed with essential vitamins and minerals, they are a great source of potassium and provide a quick energy boost. Don't miss out on this healthy and convenient snack option. Grab a bunch of bananas today!",
    status: 'Pending',
    isFavorite: false,
  ),

  //! 4
  ProductModel(
    image: 'https://www.orgpick.com/cdn/shop/products/payri.jpg?v=1552024121',
    id: '4',
    name: 'Mango',
    price: '70',
    description:
        "Experience the refreshing burst of citrus with our succulent oranges! These vibrant fruits are the epitome of zesty sweetness, packed with vitamin C and natural goodness. Each orange is handpicked at the perfect ripeness to ensure maximum juiciness and flavor.",
    status: 'Pending',
    isFavorite: false,
  ),
];
