import 'package:flutter/services.dart';

class LoadService {
  Future<String> loadAsset()async{
    return await rootBundle.loadString("assets/data/Store.json");
  }
}