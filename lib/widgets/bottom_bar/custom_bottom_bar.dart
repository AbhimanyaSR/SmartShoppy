import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:smart_shopy/constants/consts.dart';
import 'package:smart_shopy/screens/account_screen/account_screen.dart';
import 'package:smart_shopy/screens/cart_screen/cart_screen.dart';
import 'package:smart_shopy/screens/favorite_screen/favorite_screen.dart';
import 'package:smart_shopy/screens/home/home_screen.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({final Key? key}) : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  PersistentTabController _controller = PersistentTabController();
  bool _hideNavBar = false;

  List<Widget> _buildScreens() => [
        const HomeScreen(),
        const CartScreen(),
        const FavoriteScreen(),
        const AccountScreen(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          inactiveIcon: const Icon(Icons.home_outlined),
          title: "Home",
          activeColorPrimary: whiteColor,
          inactiveColorPrimary: Colors.grey[300],
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart),
          inactiveIcon: const Icon(Icons.shopping_cart_outlined),
          title: "Cart",
          activeColorPrimary: whiteColor,
          inactiveColorPrimary: Colors.grey[300],
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.favorite),
          inactiveIcon: const Icon(Icons.favorite_border),
          title: "Favorite",
          activeColorPrimary: whiteColor,
          inactiveColorPrimary: Colors.grey[300],
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person_2),
          inactiveIcon: const Icon(Icons.person_2_outlined),
          title: "Account",
          activeColorPrimary: whiteColor,
          inactiveColorPrimary: Colors.grey[300],
        ),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,
          backgroundColor: redColor,
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle:
              NavBarStyle.style1, // Choose the nav bar style with this property
        ),
      );
}
