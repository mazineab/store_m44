import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/common/navigation/bottomn_navigation/bottom_navigation.dart';
import 'package:store_m44/common/navigation/bottomn_navigation/bottom_navigation_controller.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
        init: BottomNavigationController(),
        builder: (controller) {
          return Scaffold(
            body: controller.pages[controller.selctedIndex.value],
            bottomNavigationBar:const BottomNavigation(),
          );
        });
  }
}
