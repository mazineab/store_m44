import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:store_m44/common/product/product_shop_widget.dart';
import 'package:store_m44/core/utils/my_color.dart';
import 'package:store_m44/core/utils/text_content.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/features/home/controllers/cart_page_controller.dart';
import 'package:store_m44/global/widgets/custom_app_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.bgColor,
        appBar: CustomAppBar(title: TextContent.panier),
        body: GetBuilder<CardPageController>(
          init: CardPageController(),
          builder: (controller) {
            if (controller.isload.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.productAdd.isEmpty)
              return Center(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(TextContent.empt,textAlign: TextAlign.center,style: TextStyle(fontSize: 17),),
              ));
            return Stack(
              children: [
                ListView.builder(
                    itemCount: controller.productAdd.length,
                    itemBuilder: (context, index) {
                      Product product = controller.productAdd[index];
                      return Dismissible(
                          key: Key(product.id.toString()),
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            controller.removeItem(product);
                          },
                          child: ProductShopWidget(product: product));
                    }),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 30),
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            title: TextContent.success,
                            text: TextContent.endCeckout,
                          );
                          controller.clearCart();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                const WidgetStatePropertyAll(MyColors.blue),
                            foregroundColor:
                                const WidgetStatePropertyAll(Colors.white),
                            shape:
                                WidgetStatePropertyAll<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8)))),
                        child: Text.rich(
                          TextSpan(
                              text: "${controller.sum.value}DH",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              children: const [TextSpan(text: " ${TextContent.cmd}")]),
                        )),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            );
          },
        ));
  }
}
