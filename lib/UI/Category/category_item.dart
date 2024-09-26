import 'package:flutter/material.dart';

import '../../model/category.dart';

class CategoryItem extends StatelessWidget {
  Categorys category;
  int index;

  CategoryItem({required this.category, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              fit: BoxFit.fill,
              category.imagePath,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height ,
            ),

            Text(
              category.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),
            ),

          ],
        ),
      ),
    );
  }
}
