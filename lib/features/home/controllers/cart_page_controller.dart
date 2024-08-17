import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/core/utils/localStorage/shared_pref_manager.dart';
import 'package:store_m44/data/models/product.dart';

class CardPageController extends GetxController{
  final SharedPrefManager sharedPrefManager=Get.find<SharedPrefManager>();
  var productAdd=<Product>[].obs;
  var isload=false.obs;
  var sum=0.obs;

  var isFirstForSwip=false.obs;
  var isFirstForScroll=false.obs;


  Future<void> saveFirstSwip(bool vl) async {
    await sharedPrefManager.saveBool("firstSwip",vl);
  }

  void loadFirstSwip() {
    isFirstForSwip.value = sharedPrefManager.getSavedBool("firstSwip") ?? false;
  }

  Future<void> saveFirstScroll(bool vl) async {
    await sharedPrefManager.saveBool("firstScroll",vl);
  }

  void loadFirstScroll() {
    isFirstForScroll.value = sharedPrefManager.getSavedBool("firstScroll") ?? false;
  }

  Future<void> saveList() async {
    String listStr = jsonEncode(productAdd.map((prd) => prd.toJson()).toList());
    await sharedPrefManager.saveString("products", listStr);
  }

  addToCart(Product prd) async {
    var jsn=prd.toJson();
    var frm=Product.fromJson(jsn);
    print("to json: ${jsn}");
    print("From json: ${frm}");
    final index=productAdd.indexWhere((i)=>i.equals(prd));
    if(index!= -1){
      productAdd[index].countItem++;
      countAllPrice();
    }else{
      productAdd.add(prd);
    }
    await saveList();
  }
  removeItem(Product prd)async{
    productAdd.remove(prd);
    await saveList();
    update();
  }

  getSavedList()async{
    String? savedProducts = await sharedPrefManager.getString("products");
    List<dynamic> decodeData=jsonDecode(savedProducts??"[]");
    List<Product>list= decodeData.map((e)=>Product.fromJson(e as Map<String, dynamic>)).toList();
    productAdd.assignAll(list);
  }

  countAllPrice(){
    sum.value=0;
    for(var i in productAdd){
      sum.value+=(i.countItem*int.parse(i.prix.replaceAll(" ","")));
    }
    update();
  }

  clearCart()async{
    productAdd.clear();
    await sharedPrefManager.clearAll();
    update();
  }

  PageController pageController=PageController();



  @override
  void onInit() {
    super.onInit();
    getSavedList();
    productAdd.listen((_) {
      countAllPrice();
    });
  }
}