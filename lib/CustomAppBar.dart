import 'package:flight_ticket_tracker/main.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];

  final bottomNavigationBarItemStyle =
      TextStyle(fontStyle: FontStyle.normal, color: Colors.black);

  CustomAppBar() {
    bottomBarItems.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: Text("Explore",
            style: TextStyle(
                fontStyle: FontStyle.normal, color: appTheme.primaryColor))));
    bottomBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        title: Text(
          "Watchlist",
          style: bottomNavigationBarItemStyle,
        )));
    bottomBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.local_offer,
          color: Colors.black,
        ),
        title: Text(
          "Deals",
          style: bottomNavigationBarItemStyle,
        )));
    bottomBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        title: Text(
          "Notification",
          style: bottomNavigationBarItemStyle,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BottomNavigationBar(
        items: bottomBarItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
