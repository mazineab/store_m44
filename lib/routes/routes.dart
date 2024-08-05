import 'package:get/get.dart';
import 'package:store_m44/features/home/bidings/home_bidings.dart';
import 'package:store_m44/features/home/screens/categories_page.dart';
import 'package:store_m44/features/home/screens/home.dart';
import 'package:store_m44/routes/routes_names.dart';

class Routes {
  static appRoutes()=>[
    GetPage(name: RoutesNames.home, page:()=>Home(),binding: HomeBidings()),
    GetPage(name: RoutesNames.categories, page:()=>const CategoriesPage(),binding: HomeBidings()),
  ];
}