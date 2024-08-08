import 'package:get/get.dart';
import 'package:store_m44/data/models/product.dart';

import '../../../core/utils/constant.dart';
import '../../../data/repositories/product_repositories.dart';

class SearchScreenController extends GetxController{
  ProductRepositories productRepositories=Get.find<ProductRepositories>();
  var listProduct=<Product>[].obs;
  var isload=true.obs;

  Future<void> loadAllProduct()async{
    var listCategory=Constant.list;
    listCategory.forEach((e)async{
      var data=await productRepositories.loadData(e);
      List<Product> list=data.map((e)=>Product.fromJson(e)).toList();
      listProduct.addAll(list);
    });
    await Future.delayed(const Duration(seconds:5));
    isload.value=true;
    update();
  }

  searchProduct(){

  }

  @override
  void onInit() {
    super.onInit();
    loadAllProduct();
  }
}