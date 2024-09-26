import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../model/category.dart';
import 'category_item.dart';

class CategoryFragment extends StatelessWidget {

  CategoryFragment({required this.onCategoryItemClick, super.key});

  //
  var category = Categorys.getCategory();

  Function onCategoryItemClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Pick Your Category Of Interest : ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 2,
                mainAxisExtent: 150,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryItemClick(category[index]);
                    },
                    child:
                        CategoryItem(category: category[index], index: index));
              },
              itemCount: category.length,
            )
          ],
        ),
      ),
    );
  }
}
