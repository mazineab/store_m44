import 'package:get/get.dart';
import 'package:store_m44/data/repositories/product_repositories.dart';

class CategoriesPageController extends GetxController{
  ProductRepositories productRepositories=Get.put(ProductRepositories());
  var listCategories=<String>[].obs;
  var isload=true.obs;

  Future<void> loadCategory()async{
    var listCategory=await productRepositories.loadCategories();
    listCategories.assignAll(listCategory as Iterable<String>);
    isload=false.obs;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadCategory();
  }
}