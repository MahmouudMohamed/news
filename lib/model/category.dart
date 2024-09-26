import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class Categorys {
  String id;
  String title;
  String imagePath;

  Categorys(
      {required this.id,
      required this.title,
      required this.imagePath,
      });


static List<Categorys>getCategory(){
  return [
//business entertainment general health science sports technology
    Categorys(id: "sports", title: "Sports", imagePath: "assets/images/sport.jpeg",),
    Categorys(id: "general", title: "General", imagePath: "assets/images/gen.jpeg", ),
    Categorys(id: "health", title: "Health", imagePath: "assets/images/healthcare.jpg", ),
    Categorys(id: "business", title: "Business", imagePath: "assets/images/business.jpg",),
    Categorys(id: "entertainment", title: "Entertainment", imagePath: "assets/images/entertainment.jpg",),
    Categorys(id: "science", title: "Science", imagePath: "assets/images/science.jpg", ),
    Categorys(id: "technology", title: "Technology", imagePath: "assets/images/tech.jpeg",),

  ];
}



}
