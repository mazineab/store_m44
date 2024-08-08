import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/common/product/product_shop_widget.dart';
import 'package:store_m44/core/utils/my_color.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/global/widgets/custom_app_bar.dart';
import 'package:store_m44/global/widgets/search_widget.dart';
import '../controllers/search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:"Search"),
      backgroundColor: MyColors.bgColor,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal:20),
              child: SearchWidget()
          ),
          const SizedBox(height: 20,),
          GetBuilder<SearchScreenController>(
            init: SearchScreenController(),
            builder:(controller)=> Expanded(
              child: ListView.builder(
                itemCount: controller.listProduct.length,
                  itemBuilder: (context,index){
                  Product product=controller.listProduct[index];
                    return ProductShopWidget(product:product,isSearch:true,);
                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}
