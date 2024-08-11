import 'package:get/get.dart';

class BottomSheetFilterController extends GetxController{
  var selectSearch="Description".obs;
  var selectSort="Default".obs;
  var category="tout".obs;

  chnageSearch(String val){
    selectSearch.value=val;
    update();
  }

  changeSort(String val){
    selectSort.value=val;
    update();
  }
}