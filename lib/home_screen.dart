import 'package:flutter/material.dart';
import 'package:news_project/UI/Category/category_fragment.dart';
import 'package:news_project/search_tab.dart';

import 'UI/Source/source_widget.dart';
import 'UI/drawer/home_drawer.dart';
import 'model/category.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  static Categorys? selectedCategory;
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
          drawer: Drawer(
            child: HomeDrawer(
              onDrawerClick:onDrawerClick,
            ),
          ),
          appBar: AppBar(
            title:  Text(HomeScreen.selectedCategory == null
                ? "Akhbarak App"
                : HomeScreen.selectedCategory!.title,),
            actions: [
             IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchTab());
                },
                icon: Icon(
                  Icons.search_rounded,
                  size: 30,
                ),
              )
            ],
          ),
          body: HomeScreen.selectedCategory == null
              ? CategoryFragment(
                  onCategoryItemClick: onCategoryItemClick,
                )
              : HomeWidget(id:HomeScreen.selectedCategory!.id ,)),
    );
  }


  onCategoryItemClick(categoryD) {
    HomeScreen.selectedCategory = categoryD;
    setState(() {});
  }
  int selectedDrawer = HomeDrawer.categoryId;
  void onDrawerClick(int id) {
    selectedDrawer = id;
    HomeScreen.selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
