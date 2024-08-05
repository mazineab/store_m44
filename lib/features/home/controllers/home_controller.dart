import 'package:get/get.dart';
import 'package:store_m44/core/utils/constant.dart';
import 'package:store_m44/data/models/product.dart';
import 'package:store_m44/data/repositories/product_repositories.dart';

class HomeController extends GetxController{
  ProductRepositories productRepositories=Get.find<ProductRepositories>();
  var listPrdByCategory=<Product>[].obs;
  var listPrd=<Product>[].obs;
  var listMdPrc=<Product>[].obs;
  var isload=true.obs;

  Future<void> loadCategory(String catgeoryName)async{
    var list=await productRepositories.loadData(catgeoryName);
    listPrdByCategory.assignAll(list.map((e)=>Product.fromJson(e)).toList());
    update();

  }

  Future<void> loadMostPop()async{
    var listProduct=Constant.list;
    listProduct.forEach((e)async{
      var data=await productRepositories.loadData(e);
      List<Product> list=data.map((e)=>Product.fromJson(e)).toList();
      list.shuffle();
      listPrd.addAll(list.take(3));
      listMdPrc.addAll(list.where((e)=>int.parse(e.prix.replaceAll(" ",""))<2500));
    });
    await Future.delayed(const Duration(seconds:5));
    isload.value=false;
    update();
  }



  @override
  void onInit() {
    super.onInit();
    loadCategory("luminaires");
    loadMostPop();
  }
}