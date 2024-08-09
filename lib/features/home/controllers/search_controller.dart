import 'package:get/get.dart';
import 'package:store_m44/common/bottom_sheet/bottom_sheet_filter_controller.dart';
import 'package:store_m44/data/models/product.dart';

import '../../../core/utils/constant.dart';
import '../../../data/repositories/product_repositories.dart';

class SearchScreenController extends GetxController{
  ProductRepositories productRepositories=Get.find<ProductRepositories>();
  BottomSheetFilterController controller=Get.put(BottomSheetFilterController());
  var filterList=<Product>[].obs;
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
    isload.value=false;
    update();
  }

  searchProduct(String word,String category){
    var seachBy=controller.selectSearch;
    if(seachBy.value=="Description"){
      filterList.assignAll(listProduct.where((e)=>e.description.toLowerCase().contains(word.toLowerCase())));
    }
    else if(seachBy.value=="Brand name"){
    filterList.assignAll(listProduct.where((e)=>e.nameBrand.toLowerCase().contains(word.toLowerCase())));
    }
    update();
  }

  @override
  void onInit()async{
    super.onInit();
    await loadAllProduct();
    filterList.assignAll(listProduct);
  }
}