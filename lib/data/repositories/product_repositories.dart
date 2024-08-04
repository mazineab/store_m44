import 'dart:convert';

import 'package:get/get.dart';
import 'package:store_m44/core/services/load_servcie.dart';

class ProductRepositories{
  LoadService _loadService=Get.find<LoadService>();

  Future<List<dynamic>> loadData(String category)async{
    String jsondata=await _loadService.loadAsset();
    var parseData=jsonDecode(jsondata)[category] as List;
    return parseData;
    // listPrd.clear();
    // listPrd.addAll(parseData.map((e)=>Product.fromJson(e)).toList());
  }


}