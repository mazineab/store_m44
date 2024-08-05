import 'package:get/get.dart';
import 'package:store_m44/features/home/screens/card_page.dart';
import 'package:store_m44/features/home/screens/categories_page.dart';
import 'package:store_m44/features/home/screens/home.dart';

class BottomNavigationController extends GetxController{
  var selctedIndex=0.obs;
  final List pages=[
    Home(),
    const CategoriesPage(),
    const CardPage()
  ];

  onTapItem(int index){
    selctedIndex.value=index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    onTapItem(selctedIndex.value);
  }

}