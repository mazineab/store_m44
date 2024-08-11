import 'package:get/get.dart';
import 'package:store_m44/data/models/product.dart';

class CardPageController extends GetxController{
  var productAdd=<Product>[].obs;
  var isload=false.obs;
  var message="".obs;
  var sum=0.obs;

  addToCart(Product prd){
    productAdd.add(prd);
  }
  removeItem(Product prd){
    productAdd.remove(prd);
    update();
  }

  countAllPrice(){
    sum.value=0;
    for(var i in productAdd){
      print(i.countItem);
      sum.value+=(i.countItem*int.parse(i.prix.replaceAll(" ","")));
    }
    update();
  }



  @override
  void onInit() {
    super.onInit();
    productAdd.listen((_) {
      countAllPrice();
    });
  }
}