import 'package:get/get.dart';
import 'package:store_m44/core/services/load_servcie.dart';
import 'package:store_m44/data/repositories/product_repositories.dart';

class HomeBidings extends Bindings{
  @override
  void dependencies() {
    Get.put(LoadService());
    Get.put(ProductRepositories());
  }

}