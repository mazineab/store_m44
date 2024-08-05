import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/core/utils/my_color.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/features/home/controllers/home_controller.dart';
import 'package:store_m44/global/widgets/custom_app_bar.dart';
import 'package:store_m44/global/widgets/custom_card_product.dart';
import 'package:store_m44/global/widgets/search_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Home"),
      backgroundColor:MyColors.bgColor,
      bottomNavigationBar: BottomNavigationBar(
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
      ),
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cetgories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                  Text("View all",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17))
                ],
              ),const SizedBox(height: 5),
              SizedBox(
                height: 250,
                child: GetBuilder<HomeController>(
                    init: HomeController(),
                    builder: (controller){
                      return ListView.builder(
                          scrollDirection:Axis.horizontal,
                          itemCount: controller.listPrdByCategory.length,
                          itemBuilder: (context,index){
                            Product prd=controller.listPrdByCategory[index];
                            return CustomCardProduct(url:prd.imgSrc, title:prd.nameBrand, desc:prd.description, price:prd.prix);
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
                height: 250,
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
                            return CustomCardProduct(url:prd.imgSrc, title:prd.nameBrand, desc:prd.description, price:prd.prix);
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
                height: 250,
                child: GetBuilder<HomeController>(
                    builder: (controller){
                      controller.listMdPrc.shuffle();
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:controller.listMdPrc.length,
                          itemBuilder:(context,index){
                            Product prd=controller.listMdPrc[index];
                            return CustomCardProduct(url:prd.imgSrc, title:prd.nameBrand, desc:prd.description, price:prd.prix);
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
}
