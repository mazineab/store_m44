import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/global/widgets/custom_app_bar.dart';
import 'package:store_m44/global/widgets/product_detail_widget.dart';

import '../../../core/utils/my_color.dart';
import '../../../data/models/product.dart';

class StoryProductScreen extends StatelessWidget {
  List<Product> products;
  StoryProductScreen({super.key,required this.products});

  @override
  Widget build(BuildContext context) {
    print(products.length);
    return CupertinoPageScaffold(
        backgroundColor:Colors.grey,
        navigationBar:const CupertinoNavigationBar(
        middle: Text('Product Stories'),
         ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.85,
              child: AppinioSwiper(
                onEnd:()=>Get.offNamed("/"),
                cardCount: products.length,
                cardBuilder: (BuildContext context, int index) {
                  Product product=products[index];
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: product.imgSrc,
                          fit: BoxFit.fill,
                          height: 300,
                          width: double.infinity,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.description,
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow.withOpacity(0.7)),
                                      const SizedBox(width: 5),
                                      Text(
                                        "4.3 Review",
                                        style: TextStyle(
                                          color: Colors.grey.withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "${product.prix.trim()} DH",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
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
                                      const Icon(Icons.verified, size: 17, color: MyColors.blue),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}
