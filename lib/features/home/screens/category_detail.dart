import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/core/utils/my_color.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/features/home/controllers/category_detail_controller.dart';
import 'package:store_m44/global/widgets/custom_app_bar.dart';
import 'package:store_m44/global/widgets/custom_card_product.dart';

class CategoryDetail extends StatelessWidget {
  String name;
  CategoryDetail({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      appBar: CustomAppBar(title: "products of $name"),
      body: GetBuilder<CategoryDetailController>(
        init: CategoryDetailController()..nameCat.value=name,
        builder: (controller){
          if(controller.isload.value){
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.63,
                  crossAxisSpacing: 10,
                ),
                itemCount: controller.listProducts.length,
                itemBuilder: (context,index){
                  Product product=controller.listProducts[index];
                  return CustomCardProduct(product: product);
                },
            ),
          );
        },
      )
    );
  }
}
