import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:store_m44/core/utils/text_content.dart';
import 'package:store_m44/features/home/controllers/cart_page_controller.dart';
import 'package:store_m44/global/widgets/custom_app_bar.dart';
import 'package:store_m44/global/widgets/product_detail_widget.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

import '../../../data/models/product.dart';

class TiktokScreen extends StatelessWidget {
  final List<Product> list;

  TiktokScreen({super.key, required this.list});

  CardPageController cardPageController=Get.put(CardPageController());

  @override
  Widget build(BuildContext context) {
    final Controller controller = Controller();
    WidgetsBinding.instance.addPostFrameCallback((_){
      cardPageController.loadFirstScroll();
      if(!cardPageController.isFirstForScroll.value){
        QuickAlert.show(
          context: context,
          type: QuickAlertType.info,
          title:TextContent.info,
          text: TextContent.infoScroll,
          onConfirmBtnTap: () {
            cardPageController.saveFirstScroll(true);
            Get.back();
          },
        );
      }
    });



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
