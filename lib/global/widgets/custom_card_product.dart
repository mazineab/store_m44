import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_m44/core/utils/my_color.dart';

class CustomCardProduct extends StatelessWidget{
  String url,title,desc,price;
  CustomCardProduct({required this.url,required this.title,required this.desc,required this.price});
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
        child:Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 120,width: 140,
                    decoration:BoxDecoration(
                      image: DecorationImage(
                          image:NetworkImage(url)
                      )
                    ),
                  ),
                ),
                Text(desc,style: const TextStyle(fontSize:18),textAlign: TextAlign.start),
                Row(
                  children: [
                    Text(title,style: const TextStyle(color: Colors.grey)),const SizedBox(width:2),
                    const Icon(Icons.verified,size: 15,color:MyColors.blue,)
                  ],
                ),

                Text("${price.trim()} DH",style: const TextStyle(color:MyColors.blue,fontSize: 16))
              ],
            ),
          ),
        )
    );
  }

}