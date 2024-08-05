import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_m44/core/utils/my_color.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/global/widgets/custom_app_bar.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Product Detail"),
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(product.imgSrc),
                  fit: BoxFit.fill, // Changed to cover to maintain aspect ratio
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
                    margin: const EdgeInsets.only(top: 250),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            product.description,
                            style: const TextStyle(fontSize: 25),
                            overflow: TextOverflow.ellipsis,
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
                  const SizedBox(height: 90,)
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 50,
              right: 50,
              child: ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor:const WidgetStatePropertyAll(MyColors.blue),
                    foregroundColor: const WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    )
                  ),
                  child:const Text("Add to cart"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
