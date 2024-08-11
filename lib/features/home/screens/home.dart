import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:store_m44/core/utils/my_color.dart';
import 'package:store_m44/core/utils/text_content.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/features/home/controllers/home_controller.dart';
import 'package:store_m44/features/home/screens/story_screen.dart';
import 'package:store_m44/features/home/screens/tiktok_screen.dart';
import 'package:store_m44/global/widgets/custom_app_bar.dart';
import 'package:store_m44/global/widgets/custom_card_product.dart';
import 'package:store_m44/global/widgets/skeleton_loading_horizontal.dart';

class Home extends StatelessWidget {
  Home({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title:TextContent.accueil),
        backgroundColor: MyColors.bgColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: const Text(TextContent.wlc,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),textAlign: TextAlign.start,),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(TextContent.cat,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17)),
                    viewAll(() => homeController.goToCategories())
                  ],
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 270,
                  child: GetBuilder<HomeController>(
                      init: HomeController(),
                      builder: (controller) {
                        if (controller.isload.value) {
                          return SkeletonLoadingHorizontal();
                        } else {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.listPrdByCategory.length,
                              itemBuilder: (context, index) {
                                Product prd =
                                    controller.listPrdByCategory[index];
                                return CustomCardProduct(
                                  product: prd,
                                );
                              });
                        }
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(TextContent.populaire,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17)),
                    viewAll(() => Get.to(StoryProductScreen(
                          products: homeController.listPrd,
                        )))
                  ],
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 270,
                  child: GetBuilder<HomeController>(builder: (controller) {
                    controller.listPrd.shuffle();
                    if (controller.isload.value) {
                      return SkeletonLoadingHorizontal();
                    }else{
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.listPrd.length,
                        itemBuilder: (context, index) {
                          Product prd = controller.listPrd[index];
                          return CustomCardProduct(
                            product: prd,
                          );
                        },
                      );
                    }
                  }),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(TextContent.prx,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17)),
                    // Text("View all",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17))
                    viewAll(() => Get.to(TiktokScreen(
                          list: homeController.listMdPrc,
                        )))
                  ],
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 270,
                  child: GetBuilder<HomeController>(builder: (controller) {
                    controller.listMdPrc.shuffle();
                    if (controller.isload.value) {
                      return SkeletonLoadingHorizontal();
                    }else{
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listMdPrc.length,
                          itemBuilder: (context, index) {
                            Product prd = controller.listMdPrc[index];
                            return CustomCardProduct(
                              product: prd,
                            );
                          });
                    }
                  }),
                )
              ],
            ),
          ),
        ));
  }

  Widget viewAll(onTap) {
    return GestureDetector(
      onTap: onTap,
      child: const Text("Voir tout",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
    );
  }
}
