import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class Categorys {
  String id;
  String title;
  String imagePath;
  Color color;

  Categorys(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.color});


static List<Categorys>getCategory(){
  return [
//business entertainment general health science sports technology
    Categorys(id: "sports", title: "Sports", imagePath: "assets/images/ball.png", color: AppColors.redColor),
    Categorys(id: "general", title: "General", imagePath: "assets/images/Politics.png", color: AppColors.darkBlueColor),
    Categorys(id: "health", title: "Health", imagePath: "assets/images/health.png", color: AppColors.pinkColor),
    Categorys(id: "business", title: "Business", imagePath: "assets/images/bussines.png", color: AppColors.orangeCoLor),
    Categorys(id: "entertainment", title: "Entertainment", imagePath: "assets/images/environment.png", color: AppColors.blueColor),
    Categorys(id: "science", title: "Science", imagePath: "assets/images/science.png", color: Colors.yellowAccent),
    Categorys(id: "technology", title: "Technology", imagePath: "assets/images/environment.png", color: Colors.redAccent),

  ];
}



}
