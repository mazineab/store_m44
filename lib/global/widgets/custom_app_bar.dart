import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/core/utils/my_color.dart';
import 'package:store_m44/features/home/screens/search_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  String title;
  CustomAppBar({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.bgColorBar,
      title: Text(title,style:const TextStyle(fontWeight: FontWeight.bold)),
      bottomOpacity: 1.0,
      actions: [
        IconButton(
            onPressed: (){
              Get.to(SearchScreen());
            },
            icon:const Icon(Icons.search)
        )
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
