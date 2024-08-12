import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:store_m44/core/utils/constant.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/data/repositories/product_repositories.dart';
import 'package:store_m44/global/widgets/no_connection_alert.dart';
import 'package:store_m44/routes/routes_names.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class HomeController extends GetxController {
  ProductRepositories productRepositories = Get.find<ProductRepositories>();

  var listPrdByCategory = <Product>[].obs;
  var listPrd = <Product>[].obs;
  var listMdPrc = <Product>[].obs;
  var isload = true.obs;
  var isShow = false.obs;

  Future<void> loadCategoryProducts(String catgeoryName) async {
    var list = await productRepositories.loadData(catgeoryName);
    listPrdByCategory.assignAll(list.map((e) => Product.fromJson(e)).toList());
    update();
  }

  Future<void> loadMostPop() async {
    var listProduct = Constant.list;
    listProduct.forEach((e) async {
      var data = await productRepositories.loadData(e);
      List<Product> list = data.map((e) => Product.fromJson(e)).toList();
      list.shuffle();
      listPrd.addAll(list.take(3));
      listMdPrc.addAll(list.where((e) => int.parse(e.prix.replaceAll(" ", "")) < 2500));
    });
    await Future.delayed(const Duration(seconds: 6));
    isload.value = false;
    update();
  }

  goToCategories() {
    Get.toNamed(RoutesNames.categories);
  }

  // void check(BuildContext context) async {
  //   bool result = await InternetConnection().hasInternetAccess;
  //   print("result $result");
  //   if (!result) {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return NoConnectionAlertDialog(
  //           title: "Error connection",
  //           message: "Turn on connection to enable see images",
  //           onRetry: () {
  //             Get.back();
  //             check(context);
  //           },
  //         );
  //       },
  //     );
  //   }
  //   update();
  // }

  void check(BuildContext context) async {
    bool result = await InternetConnection().hasInternetAccess;
    print("result $result");
    if (!result) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Error connection',
        text: 'Turn on connection to enable see images',
        confirmBtnText: 'OK',
        onConfirmBtnTap: () {
          Get.back();
        },
      );
    }
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await loadCategoryProducts("décoration");
    await loadMostPop();
    print("isShow ${isShow.value}");
    if (!isShow.value) {
      check(Get.context!); // Pass the context here
      isShow.value = true;
    }
  }
}
