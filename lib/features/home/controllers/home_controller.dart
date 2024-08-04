import 'package:get/get.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/data/repositories/product_repositories.dart';

class HomeController extends GetxController{
  ProductRepositories productRepositories=Get.find<ProductRepositories>();
  var listPrd=<Product>[].obs;

  Future<void> loadCategoryCanape()async{
    var data=await productRepositories.loadData("canape");
    listPrd.assignAll(data.map((e)=>Product.fromJson(e)).toList());
    update();
  }


  @override
  void onInit() {
    super.onInit();
    loadCategoryCanape();
  }
}