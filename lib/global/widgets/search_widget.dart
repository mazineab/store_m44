import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:store_m44/core/utils/text_content.dart';

class SearchWidget extends StatelessWidget{
  Function(String) fun;
  VoidCallback onTap;
  SearchWidget({required this.fun,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon:  IconButton(
          onPressed: onTap,
         icon: const Icon(FontAwesome.sliders_solid,size: 15) ,
        ),
        hintText: TextContent.rechercher,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
      onChanged: (val){
        fun(val);
      },
    );
  }

}