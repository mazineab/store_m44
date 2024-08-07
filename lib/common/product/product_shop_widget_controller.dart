import 'package:get/get.dart';

class ProductShopWidgetController extends GetxController{
  var count=1.obs;

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
}