import 'package:flutter/material.dart';
import 'package:store_m44/core/utils/text_content.dart';
import 'package:store_m44/global/widgets/custom_app_bar.dart';
import 'package:store_m44/global/widgets/product_detail_widget.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

import '../../../data/models/product.dart';

class TiktokScreen extends StatelessWidget {
  final List<Product> list;

  TiktokScreen({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    final Controller controller = Controller();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: TextContent.prds),
      body: TikTokStyleFullPageScroller(
        contentSize: list.length,
        swipePositionThreshold: 0.2,
        swipeVelocityThreshold: 2000,
        animationDuration: const Duration(milliseconds: 400),
        controller: controller,
        builder: (context, index) {
          if (index >= list.length) {
            return Center(child: Text(TextContent.aucPrd));
          }
          Product product = list[index];
          return ProductDetailWidget(product: product);
        },
      ),
    );
  }
}
