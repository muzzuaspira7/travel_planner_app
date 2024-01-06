import 'package:flutter/material.dart';
import 'package:nothing/color/all_colors.dart';
import 'package:nothing/screens/homescreen.dart';
import 'package:nothing/screens/map_page.dart';
import 'package:nothing/screens/profile.dart';
import 'package:nothing/screens/trip.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  final _controller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreen() {
    return [MyHomeScreen(), MyTrip(), MapPage(), ProfilePage()];
  }

  List<PersistentBottomNavBarItem> _navigationItem() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        title: "Home",
        activeColorPrimary: AppColor().HeadingColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.tire_repair_outlined),
          title: "My Trip",
          activeColorPrimary: AppColor().HeadingColor,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.map_sharp),
          title: 'Map',
          activeColorPrimary: AppColor().HeadingColor,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          title: 'Profile',
          activeColorPrimary: AppColor().HeadingColor,
          inactiveColorPrimary: Colors.grey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      items: _navigationItem(),
      controller: _controller,
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          border: Border(
              top: BorderSide(color: AppColor().HeadingColor),
              left: BorderSide(color: AppColor().HeadingColor),
              right: BorderSide(color: AppColor().HeadingColor))),
      navBarStyle: NavBarStyle.style12,
    );
  }
}
