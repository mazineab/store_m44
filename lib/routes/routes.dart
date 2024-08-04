import 'package:get/get.dart';
import 'package:store_m44/features/home/bidings/home_bidings.dart';
import 'package:store_m44/features/home/screens/home.dart';
import 'package:store_m44/routes/route_names.dart';

class Routes {
  static appRoutes()=>[
    GetPage(name: RouteNames.home, page:()=>const Home(),binding: HomeBidings())
  ];
}