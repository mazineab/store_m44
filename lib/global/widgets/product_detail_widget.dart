import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/core/utils/text_content.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/features/home/controllers/card_page_controller.dart';

import '../../core/utils/my_color.dart';

class ProductDetailWidget extends StatelessWidget {
  Product product;
  ProductDetailWidget({super.key,required this.product});

  CardPageController controller=Get.put(CardPageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(product.imgSrc),
              fit: BoxFit.fill,
            ),
          ),
        ),
        // Product Details
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color:Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        product.description,
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow.withOpacity(0.7)),
                        Text(
                          "4.3 Review",
                          style: TextStyle(color: Colors.grey.withOpacity(0.8), fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      product.nameBrand,
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 1),
                  const Icon(Icons.verified, size: 18, color: MyColors.blue),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                "${product.prix.trim()} DH",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10,)
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: (){
              controller.addToCart(product);
            },
            style: ButtonStyle(
                backgroundColor:const WidgetStatePropertyAll(MyColors.blue),
                foregroundColor: const WidgetStatePropertyAll(Colors.white),
                shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    )
                )
            ),
            child:const Text(TextContent.ajt),
          ),
        )
      ],
    );
  }
}
