import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:store_m44/common/navigation/bottomn_navigation/bottom_navigation_controller.dart';
import 'package:badges/badges.dart' as badges;

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
        init: BottomNavigationController(),
        builder: (controller) {
          return FlashyTabBar(
            selectedIndex: controller.selctedIndex.value,
            showElevation: true,
            onItemSelected: controller.onTapItem,
            items: [
              FlashyTabBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              FlashyTabBarItem(
                icon: Icon(FontAwesome.list_solid),
                title: Text('Category'),
              ),
              FlashyTabBarItem(
                icon: Obx(()=>
                  badges.Badge(
                    showBadge:controller.isempty.value,
                    badgeContent: Text(
                        '${controller.countProuct.value}',
                        style: TextStyle(color: Colors.white),
                      ),
                    child: Icon(Icons.shopping_cart_rounded),
                  ),
                ),
                title: Text('Cart'),
              ),


            ],
          );
        });
  }
}
