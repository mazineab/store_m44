import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/common/navigation/bottomn_navigation/bottom_navigation.dart';
import 'package:store_m44/core/utils/constant.dart';
import 'package:store_m44/core/utils/my_color.dart';
import 'package:store_m44/features/home/controllers/categories_page_controller.dart';
import 'package:store_m44/global/widgets/custom_app_bar.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      appBar: CustomAppBar(title: "Categories"),
      bottomNavigationBar: const BottomNavigation(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CategoriesPageController>(
              init: CategoriesPageController(),
              builder: (controller) {
                return SizedBox(
                  height: 400,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: controller.listCategories.length,
                    itemBuilder: (context, index) {
                      return customCategory(controller.listCategories[index],Constant.listIcon[index]);
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget customCategory(String title,IconData icondt) {
    return GestureDetector(
      onTap: (){

      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: MyColors.categoryBg,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(child: Icon(icondt, color: Colors.white)),
          ),
          Text(title[0].toUpperCase() + title.substring(1)),
        ],
      ),
    );
  }
}
