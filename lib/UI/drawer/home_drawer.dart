import 'package:flutter/material.dart';
import 'package:news_project/UI/drawer/row_item.dart';

import '../../utils/app_color.dart';


class HomeDrawer extends StatelessWidget {
  static const int categoryId=1;
  // static const int settingId=2;
  Function onDrawerClick;
  HomeDrawer({required this.onDrawerClick, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.1,
          ),
          width: double.infinity,
          // height: MediaQuery.of(context).size.height*0.2,
          decoration: BoxDecoration(color: AppColors.primaryLightColor),
          child: Text(
            "News App!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25,color: Colors.white),
          ),
        ),
        InkWell(
            onTap: () {
              onDrawerClick(categoryId);
            },
            child: RowItem(name: "Category's", icon: Icons.list)),

      ],
    );
  }
}
