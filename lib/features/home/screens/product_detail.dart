import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_m44/core/utils/my_color.dart';
import 'package:store_m44/core/utils/text_content.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/global/widgets/custom_app_bar.dart';
import 'package:store_m44/global/widgets/product_detail_widget.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: TextContent.dtl),
      backgroundColor:Colors.white,
      body: ProductDetailWidget(product: product)
    );
  }
}
