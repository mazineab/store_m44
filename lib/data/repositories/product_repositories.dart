import 'dart:convert';

import 'package:get/get.dart';
import 'package:store_m44/core/services/load_servcie.dart';

class ProductRepositories{
  LoadService _loadService=Get.find<LoadService>();

  Future<List<dynamic>> loadData(String category)async{
    String jsondata=await _loadService.loadAsset();
    var parseData=jsonDecode(jsondata)[category] as List;
    return parseData;
  }

  Future<List<dynamic>> loadCategories()async{
    String jsonData=await _loadService.loadAsset();
    var parseData=jsonDecode(jsonData) as Map<String,dynamic>;
    List<String> listCategories=parseData.keys.toList();
    return listCategories;
  }


}