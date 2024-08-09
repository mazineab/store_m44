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
    sortListOfProducts();
    update();
  }

  Future<void> loadProductsByCategory(String category)async{
      var list=await productRepositories.loadData(category);
      listProduct.assignAll(list.map((e)=>Product.fromJson(e)).toList());
      sortListOfProducts();
      update();
  }

  Future<void> loadProducts()async{
    isload.value = true;
    listProduct.clear();
    if(controller.category.value!="All"){
      await loadProductsByCategory(controller.category.value);
    }else{
      await loadAllProduct();
    }
    filterList.assignAll(listProduct);
    isload.value = false;
    update();

  }

  searchProduct(String word,String category){
    var seachBy=controller.selectSearch;
    print(seachBy);
    if(seachBy.value=="Description"){
      filterList.assignAll(listProduct.where((e)=>e.description.toLowerCase().contains(word.toLowerCase())));
    }
    else if(seachBy.value=="Brand name"){
     filterList.assignAll(listProduct.where((e)=>e.nameBrand.toLowerCase().contains(word.toLowerCase())));
    }
    else if(seachBy.value=="Price"){
      filterList.assignAll(listProduct.where((e)=>e.prix.replaceAll(" ","").toLowerCase().contains(word.toLowerCase())));
    }
    update();
  }

  sortListOfProducts(){
    var sortBy=controller.selectSort;
    print(sortBy);
    if(sortBy.value=="Price"){
      filterList.sort((a,b)=> parsePrice(a.prix).compareTo(parsePrice(b.prix)));
    }
    else if(sortBy.value=="Description"){
      filterList.sort((a, b) => a.description.compareTo(b.description));
    }else if(sortBy.value=="Brand name"){
      filterList.sort((a, b) => a.nameBrand.compareTo(b.nameBrand));
    }
    else{
      filterList.assignAll(listProduct);
    }
    update();
  }

  int parsePrice(String price){
    return int.parse(price.replaceAll(" ",""));
  }

  @override
  void onInit()async{
    super.onInit();
    ever(controller.category,(_)=>loadProducts());
    ever(controller.selectSort, (_) => sortListOfProducts());
    loadProducts();
    // filterList.assignAll(listProduct);
  }
}