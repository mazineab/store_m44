import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/common/navigation/bottomn_navigation/bottom_navigation_controller.dart';

import '../../../core/utils/my_color.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
      init: BottomNavigationController(),
      builder: (controller){
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
          currentIndex: controller.selctedIndex.value,
          onTap: controller.onTapItem,
        );
      }
    );
  }
}
