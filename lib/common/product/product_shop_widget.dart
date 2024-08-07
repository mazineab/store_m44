import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/common/product/product_shop_widget_controller.dart';
import 'package:store_m44/core/utils/my_color.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/features/home/controllers/card_page_controller.dart';

class ProductShopWidget extends StatelessWidget{
  Product product;
  ProductShopWidget({super.key, required this.product});

  ProductShopWidgetController controller =Get.put(ProductShopWidgetController());
  final cardController =Get.find<CardPageController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: 60,height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:CachedNetworkImageProvider(product.imgSrc),
                  fit: BoxFit.fill
              )
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.description,style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis
                ),
                Row(
                  children: [
                    Flexible(child: Text(product.nameBrand,style: const TextStyle(color: Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,)),const SizedBox(width:1),
                    const Icon(Icons.verified,size: 15,color:MyColors.blue,)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${product.prix} DH",style: const TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                      margin:const EdgeInsets.symmetric(horizontal:10),
                      height: 33,
                      decoration: BoxDecoration(
                        color: MyColors.bgColor,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GetBuilder<ProductShopWidgetController>(
                            builder: (controller) {
                              return Container(
                                  width: 24,height: 24,
                                  margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: IconButton(
                                    onPressed: (){
                                      product.countItem=controller.increment(product.countItem);
                                      cardController.countAllPrice();
                                    },
                                    icon:const Icon(Icons.add,size:13),
                                    padding: EdgeInsets.zero,
                                  ));
                            },

                          ),
                          GetBuilder<ProductShopWidgetController>(builder: (controller)=>Text("${product.countItem}",style: TextStyle(fontWeight: FontWeight.bold),)) ,
                          GetBuilder<ProductShopWidgetController>(
                            builder: (controller){
                              return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                  width: 24,height: 24,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(2)
                                  ),
                                  child: IconButton(onPressed: (){
                                    product.countItem=controller.decrement(product.countItem);
                                    cardController.countAllPrice();
                                  }, icon:const Icon(Icons.remove,size:13),
                                    padding: EdgeInsets.zero,
                                  ));
                            },
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
  }

}