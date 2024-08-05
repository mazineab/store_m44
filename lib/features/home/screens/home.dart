import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/common/navigation/bottomn_navigation/bottom_navigation.dart';
import 'package:store_m44/core/utils/my_color.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/features/home/controllers/home_controller.dart';
import 'package:store_m44/global/widgets/custom_app_bar.dart';
import 'package:store_m44/global/widgets/custom_card_product.dart';
import 'package:store_m44/global/widgets/search_widget.dart';

class Home extends StatelessWidget {
  Home({super.key});

  HomeController homeController=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Home"),
      backgroundColor:MyColors.bgColor,
      // bottomNavigationBar:const BottomNavigation(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 80),
                  child: const Text("Quality goods,waiting for you to choose",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25))),
              const SizedBox(height: 10),
              SearchWidget(),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Cetgories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                  viewAll(()=>homeController.goToCategories())
                ],
              ),const SizedBox(height: 5),
              SizedBox(
                height: 270,
                child: GetBuilder<HomeController>(
                    init: HomeController(),
                    builder: (controller){
                      return ListView.builder(
                          scrollDirection:Axis.horizontal,
                          itemCount: controller.listPrdByCategory.length,
                          itemBuilder: (context,index){
                            Product prd=controller.listPrdByCategory[index];
                            return CustomCardProduct(product: prd,);
                          }
                      );
                    }
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Must populaire",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                  Text("View all",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17))
                ],
              ),const SizedBox(height: 5),
              SizedBox(
                height: 270,
                child: GetBuilder<HomeController>(
                    builder: (controller){
                      controller.listPrd.shuffle();
                      if(controller.isload.value){
                        return const Center(child:  CircularProgressIndicator());
                      }else{
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listPrd.length,
                          itemBuilder: (context,index){
                            Product prd=controller.listPrd[index];
                            return CustomCardProduct(product: prd,);
                          },
                        );
                      }
                    }

                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Medium Priced",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                  Text("View all",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17))
                ],
              ),const SizedBox(height: 5),
              SizedBox(
                height: 270,
                child: GetBuilder<HomeController>(
                    builder: (controller){
                      controller.listMdPrc.shuffle();
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:controller.listMdPrc.length,
                          itemBuilder:(context,index){
                            Product prd=controller.listMdPrc[index];
                            return CustomCardProduct(product: prd,);
                          }
                      );
                    }
                ),
              )
            ],
          ),
        ),
      )
    );
  }
  Widget viewAll(onTap){
    return GestureDetector(
      onTap: onTap,
      child: const Text("View all",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
    );
  }
}
