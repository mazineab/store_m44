import 'package:get/get.dart';
import 'package:store_m44/features/home/controllers/card_page_controller.dart';
import 'package:store_m44/features/home/screens/card_page.dart';
import 'package:store_m44/features/home/screens/categories_page.dart';
import 'package:store_m44/features/home/screens/home.dart';

class BottomNavigationController extends GetxController{
  CardPageController cardPageController=Get.put(CardPageController());
  var selctedIndex=0.obs;
  var countProuct=0.obs;
  var isempty=false.obs;
  final List pages=[
    Home(),
    const CategoriesPage(),
    const CardPage()
  ];

  onTapItem(int index){
    selctedIndex.value=index;
    update();
  }

   chnageCounte(){
    countProuct.value=cardPageController.productAdd.length;
   }

   changeval(){
    isempty.value=countProuct.value!=0;
   }

  @override
  void onInit() {
    super.onInit();
    onTapItem(selctedIndex.value);
    cardPageController.productAdd.listen((_){
      chnageCounte();
      changeval();
    });
  }

}