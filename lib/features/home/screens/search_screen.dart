import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/common/product/product_shop_widget.dart';
import 'package:store_m44/core/utils/my_color.dart';
import 'package:store_m44/core/utils/text_content.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/common/bottom_sheet/bottom_sheet_filter.dart';
import 'package:store_m44/global/widgets/custom_app_bar.dart';
import 'package:store_m44/global/widgets/search_widget.dart';
import 'package:store_m44/global/widgets/skeleton_loading_vertical.dart';
import '../controllers/search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:TextContent.rechercher),
      backgroundColor: MyColors.bgColor,
      body: GetBuilder<SearchScreenController>(
          init: SearchScreenController(),
          builder:(controller)=>Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal:20),
                child: SearchWidget(
                  onTap:()=> showModalBottomSheet(
                      context: context,
                      builder: (context){
                        return const BottomSheetFilter();
                      }
                  ),
                  fun: (word){
                    controller.word.value=word;
                    print(controller.word.value);
                    controller.searchProduct();
                  }
                )
            ),
            if(controller.isload.value)
              Expanded(child: SkeletonLoadingVertical()),
            if(!controller.isload.value && controller.filterList.isEmpty)
              Expanded(child: Center(child: Text(TextContent.aucun))),
            if(!controller.isload.value)
            Expanded(
                child: ListView.builder(
                  itemCount: controller.filterList.length,
                    itemBuilder: (context,index){
                    Product product=controller.filterList[index];
                      return ProductShopWidget(product:product,isSearch:true,);
                    }
                ),
              ),
          ],
        )
      ),
    );
  }
}
