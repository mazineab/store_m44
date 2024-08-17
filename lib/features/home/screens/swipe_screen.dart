import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:store_m44/core/utils/text_content.dart';
import 'package:store_m44/features/home/controllers/cart_page_controller.dart';
import '../../../core/utils/my_color.dart';
import '../../../data/models/product.dart';

class StoryProductScreen extends StatelessWidget {
  final List<Product> products;

  StoryProductScreen({Key? key, required this.products}) : super(key: key);

  final CardPageController controller = Get.put(CardPageController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadFirstSwip();
      if (!controller.isFirstForSwip.value) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.info,
          title: TextContent.info,
          text: TextContent.infoSwip,
          onConfirmBtnTap: () {
            controller.saveFirstSwip(true);
            Get.back();
          },
        );
      }
    });

    return CupertinoPageScaffold(
      backgroundColor: Colors.grey,
      navigationBar: const CupertinoNavigationBar(
        middle: Text(TextContent.gls),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                margin: EdgeInsets.only(left: 15,right: 15,top: 30),
                constraints: BoxConstraints(
                  maxHeight: 500,
                ),
                child: AppinioSwiper(
                  onEnd: () => Get.back(),
                  cardCount: products.length,
                  controller: AppinioSwiperController(),
                  swipeOptions: const SwipeOptions.only(left: true, right: true),
                  onSwipeEnd: (int index, int lastIndex, SwiperActivity swiper) {
                    if (swiper.direction == AxisDirection.right) {
                      controller.addToCart(products[index]);
                    }
                  },
                  cardBuilder: (BuildContext context, int index) {
                    Product product = products[index];
                    return Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.min, // Wrap content height
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                imageUrl: product.imgSrc,
                                fit: BoxFit.cover,
                                height: 300,
                                width: double.infinity,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              product.description,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                            const SizedBox(height: 5),
                            Text(
                              "${product.prix.trim()} DH",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
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
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
