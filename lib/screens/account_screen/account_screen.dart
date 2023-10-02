import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/constants/routes.dart';
import 'package:smart_shopy/provider/app_provider.dart';
import 'package:smart_shopy/screens/favorite_screen/favorite_screen.dart';
import 'package:smart_shopy/screens/order_screen/order_screen.dart';
import 'package:smart_shopy/widgets/primary_button/primary_button.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      //* App bar
      appBar: AppBar(
        title: myAccount.text.fontFamily(bold).size(23).make(),
      ),

      //* Body
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                children: [
                  // appProvider.getUserInfo.image == null ?
                  Icon(
                    Icons.person_outline,
                    color: redColor,
                    shadows: <Shadow>[
                      Shadow(
                        color: backClr.withOpacity(.5),
                        blurRadius: 10,
                      ),
                    ],
                    size: 130,
                  ),
                  // : Image.network(appProvider.getUserInfo.image!),
                  Text(
                    appProvider.getUserInfo.name,

                    // 'Abhimanya',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: bold,
                      letterSpacing: 1,
                      color: redColor,
                      shadows: <Shadow>[
                        Shadow(
                          color: backClr.withOpacity(.5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  8.heightBox,
                  const Text(
                    appProvider.getUserInfo.email,
                    // 'abhimanya07@gmail.com',
                    style: TextStyle(),
                  ),
                  15.heightBox,
                  SizedBox(
                    width: 170,
                    child: PrimaryButton(
                      onPressed: () {
                        // Routes.instance.push(
                        //   widget: const EditProfile(),
                        //   context: context,
                        // );
                      },
                      title: editProfile,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Routes.instance
                        .push(widget: const OrderScreen(), context: context);
                  },
                  leading: const Icon(
                    Icons.shopping_bag_outlined,
                  ),
                  title: const Text('Your Orders'),
                ),
                ListTile(
                  onTap: () {
                    Routes.instance
                        .push(widget: const FavoriteScreen(), context: context);
                  },
                  leading: const Icon(
                    Icons.favorite_outline,
                  ),
                  title: const Text('Favorites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.info_outline,
                  ),
                  title: const Text('About Us'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.support_agent_outlined,
                  ),
                  title: const Text('Support'),
                ),
                ListTile(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  leading: const Icon(
                    Icons.logout_outlined,
                  ),
                  title: const Text(logout),
                ),
                const Spacer(),
                const Text(appversion),
                60.heightBox,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
