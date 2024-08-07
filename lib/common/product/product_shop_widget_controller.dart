import 'package:get/get.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/features/home/controllers/card_page_controller.dart';

class ProductShopWidgetController extends GetxController{
  CardPageController cardPageController=Get.find<CardPageController>();


  increment(int index){
    index++;
    update();
    return index;
  }

  decrement(int index){
    if(index>0){
      index--;
    }
    update();
    return index;
  }

  @override
  void onInit() {
    super.onInit();
  }

}