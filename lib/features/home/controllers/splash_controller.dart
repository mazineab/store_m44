import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:store_m44/routes/routes_names.dart';

class SplashController extends GetxController{
  // RxBool hasNavigated = false.obs;

  Future<void> goTo()async{
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed(RoutesNames.mainPage);
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      goTo();
    });
  }
}