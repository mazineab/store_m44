import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/core/utils/my_color.dart';
import 'package:store_m44/features/home/screens/product_detail.dart';

import '../../data/models/product.dart';

class CustomCardProduct extends StatelessWidget{
  // String url,title,desc,price;
  // CustomCardProduct({required this.url,required this.title,required this.desc,required this.price});
  Product product;
  CustomCardProduct({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
        width:150,
        margin: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
      child:InkWell(
        onTap:()=>Get.to(ProductDetail(product: product,)),
        child:Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 120,width: 140,
                    decoration:BoxDecoration(
                      image: DecorationImage(
                          image:CachedNetworkImageProvider(product.imgSrc)
                      )
                    ),
                  ),
                ),
                Text(product.description,style: const TextStyle(fontSize:17),maxLines: 2,textAlign: TextAlign.start),
                Row(
                  children: [
                    Flexible(child: Text(product.nameBrand,style: const TextStyle(color: Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,)),const SizedBox(width:1),
                    const Icon(Icons.verified,size: 15,color:MyColors.blue,)
                  ],
                ),const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child:Text("${product.prix.trim()} DH",style: const TextStyle(color:MyColors.blue,fontSize: 16))),
                    IconButton(icon: Icon(Icons.add_circle,color:MyColors.categoryBg,),onPressed: (){},)
                  ],
                )
                ,
              ],
            ),
          ),
        )
    );
  }

}