import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/core/utils/my_color.dart';
import 'package:store_m44/features/home/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder:(controller){
          return Center(
            child: Container(
              width: 150,height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:AssetImage("assets/images/playstore.png")
                  )
              ),),
          );
        }
      ),
    );
  }
}
