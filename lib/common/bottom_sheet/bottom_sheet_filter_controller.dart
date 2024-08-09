import 'package:get/get.dart';

class BottomSheetFilterController extends GetxController{
  var selectSearch=" brand name".obs;
  var selectSort="default".obs;
  String?category;

  chnageSearch(String val){
    selectSearch.value=val;
    update();
  }

  changeSort(String val){
    selectSort.value=val;
    update();
  }
}