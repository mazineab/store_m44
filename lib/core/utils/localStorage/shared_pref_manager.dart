import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager extends GetxService{
  late SharedPreferences preferences;

  Future<SharedPrefManager> init()async{
    preferences=await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> saveString(String key,String value)async{
    try{
      await preferences.setString(key, value);
      return true;
    }catch(e){
      return false;
    }
  }

  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool> remove(String key)async{
    try{
      await preferences.remove(key);
      return true;
    }catch(e){
      return false;
    }
  }

  Future<bool> clearAll()async{
    return await preferences.clear();
  }
}