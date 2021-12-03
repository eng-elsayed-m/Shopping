import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rzq_customer/screens/cart/cart_screen.dart';
import 'package:rzq_customer/screens/category/category_screen.dart';
import 'package:rzq_customer/screens/home/home_screen.dart';
import 'package:rzq_customer/screens/notifications/notifications_screen.dart';
import 'package:rzq_customer/screens/profile/profile_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class NavigationScreen extends StatefulWidget {
  static const nav = "/navigation";

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

screen(index) {
  switch (index) {
    case 0:
      return HomeScreen();
    case 1:
      return CategoryScreen();

    case 2:
      return CartScreen();
    case 3:
      return NotificationsScreen();
    case 4:
      return ProfileScreen();
    default:
      return HomeScreen();
  }
}

class _NavigationScreenState extends State<NavigationScreen> {
  int? index;
  @override
  Widget build(BuildContext context) => Platform.isIOS ? _buildIosHome(context) : _buildAndroidHome(context);
  
  

  Widget _buildIosHome(BuildContext context) => CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.shopping_cart,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell_fill),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
          ),
        ],
      ),
      tabBuilder: (context, index) => screen(index));

  Widget _buildAndroidHome(BuildContext context) => Scaffold(
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            curve: Curves.bounceOut,
            activeColor: Colors.black,
            curveSize: 0,
            color: Colors.grey.shade400,
            top: 0,
            style: TabStyle.react,
            items: [
              TabItem(icon: Icons.home),
              TabItem(icon: Icons.grid_on_rounded),
              TabItem(
                isIconBlend: false,
                activeIcon: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    Icons.shopping_basket,
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
                icon: Icon(
                  Icons.shopping_basket,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              TabItem(icon: Icons.notifications_active_outlined),
              TabItem(icon: Icons.people),
            ],
            onTap: (int i) => setState(() {
                  index = i;
                })),
        body: Builder(
          builder: (context) => screen(index),
        ),
      );
}
