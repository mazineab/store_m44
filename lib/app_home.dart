import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data/models/product.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  List<Product> listPrd=[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: listPrd.length,
          itemBuilder: (context,index){
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(listPrd[index].imgSrc),
              ),
              title: Text(listPrd[index].nameBrand),
              subtitle: Text(listPrd[index].description),
            );
          },
        ),
      ),
    );
  }
}
