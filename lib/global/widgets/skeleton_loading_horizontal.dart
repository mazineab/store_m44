import 'package:flutter/cupertino.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/models/product.dart';
import 'custom_card_product.dart';

class SkeletonLoadingHorizontal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return CustomCardProduct(
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