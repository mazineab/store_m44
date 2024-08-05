import 'package:get/get.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/data/repositories/product_repositories.dart';

class CategoryDetailController extends GetxController{
  ProductRepositories productRepositories=Get.find<ProductRepositories>();
  var listProducts=<Product>[].obs;
  var nameCat="".obs;
  var isload=true.obs;

  Future<void> loadProductOfCategory(String nameCat)async {
    var data=await productRepositories.loadData(nameCat);
    listProducts.assignAll(data.map((e)=>Product.fromJson(e)).toList());
    isload.value=false;
    update();
  }



  @override
  void onInit() {
    super.onInit();
    loadProductOfCategory(nameCat.value);
  }
}