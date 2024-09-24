import 'package:flutter/material.dart';

import '../../model/category.dart';

class CategoryItem extends StatelessWidget {
  Categorys category;
  int index;

  CategoryItem({required this.category, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(index % 2 != 0 ? 20 : 0),
            bottomRight: Radius.circular(index % 2 == 0 ? 20 : 0),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category.imagePath,
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.12,
          ),
          Text(
            category.title,
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),
          )
        ],
      ),
    );
  }
}
