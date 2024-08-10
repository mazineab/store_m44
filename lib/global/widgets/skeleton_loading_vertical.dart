import 'package:flutter/cupertino.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:store_m44/common/product/product_shop_widget.dart';

import '../../data/models/product.dart';
import 'custom_card_product.dart';

class SkeletonLoadingVertical extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(child: ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return ProductShopWidget(
            isSearch: true,
            product: Product(
                id: -1,
                nameBrand: "aaaaaaa",
                description: "aaaaaaaaaaaaa",
                imgSrc: "https://avatars.githubusercontent.com/u/119409424?v=4",
                prix: "2145DH"));
      },
    ));
  }

}