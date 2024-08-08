import 'package:get/get.dart';

class BottomSheetFilterController extends GetxController{
  var selectedOtion=" brand name".obs;

  chnage(String val){
    selectedOtion.value=val;
    update();
  }
}