import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/provider/app_provider.dart';
import 'package:smart_shopy/screens/favorite_screen/single_favourite_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      //* App bar
      appBar: AppBar(
        title: favorites.text.size(23).fontFamily(bold).make(),
      ),
      //* Body
      body: appProvider.getFavoriteProductList.isEmpty
          ? Center(
              child: yourfavouriteisEmpty.text.fontFamily(semibold).size(16).make(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: appProvider.getFavoriteProductList.length,
              itemBuilder: (context, index) {
                return SingleFavourieItem(
                  singleProduct: appProvider.getFavoriteProductList[index],
                );
              },
            ),
    );
  }
}
