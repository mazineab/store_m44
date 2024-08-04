import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/core/utils/my_color.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/features/home/controllers/home_controller.dart';
import 'package:store_m44/global/widgets/custom_card_product.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:MyColors.bgColor,
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller)=>
        ListView.builder(
          itemCount: controller.listPrd.length,
          itemBuilder: (context,index){
            Product prd=controller.listPrd[index];
            return CustomCardProduct(url:prd.imgSrc, title:prd.nameBrand, desc:prd.description, price:prd.prix);
            // return ListTile(
            //   leading: CircleAvatar(
            //     backgroundImage: NetworkImage(controller.listPrd[index].imgSrc),
            //   ),
            //   title: Text( controller.listPrd[index].nameBrand),
            //   subtitle: Text( controller.listPrd[index].description),
            // );
          },
        )
      ),
    );
  }
}
