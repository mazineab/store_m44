import 'package:flutter/material.dart';

import '../../../core/utils/my_color.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor:MyColors.bgColor,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.view_headline),
            label: "category"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: "card"
        )
      ],
    );
  }
}
