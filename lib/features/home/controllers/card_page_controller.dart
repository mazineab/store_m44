import 'package:get/get.dart';
import 'package:store_m44/data/models/product.dart';

class CardPageController extends GetxController{
  var productAdd=<Product>[].obs;
  var isload=false.obs;
  var message="".obs;

  addToCart(Product prd){
    productAdd.add(prd);
    print(productAdd);
  }

  // getProduct(){
  //   if(productAdd.isEmpty){
  //     message.value="Empty card";
  //   }
  //   else{
  //     message.value="";
  //   }
  //   Future.delayed(Duration(seconds: 1));
  //   isload.value=false;
  //   update();
  // }

  @override
  void onInit() {
    super.onInit();
    // getProduct();
  }
}