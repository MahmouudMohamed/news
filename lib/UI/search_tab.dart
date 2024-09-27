import 'package:flutter/material.dart';
import '../utils/api manager/api_manager.dart';
import '../utils/app_color.dart';
import 'news/news_item.dart';
import '../model/NewsResponse.dart';

class SearchTab extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
            showSuggestions(context);
          },
          icon: const Icon(
            Icons.clear_outlined,
            color: Colors.white,
          )),
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: const Icon(
            Icons.search_rounded,
            size: 30,
            color: Colors.white,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return searchSuggestionsBar();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return searchSuggestionsBar();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {return ThemeData(
        appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 50),
      iconTheme: IconThemeData(color: Colors.white, size: 30),
      color: Color(0xffC91C22),
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
    ));
  }

  // Widget search() {
  //   return Container(
  //       decoration: const BoxDecoration(
  //         color: Colors.white,
  //         image: DecorationImage(
  //           image: AssetImage("assets/images/pattern.png"),
  //           fit: BoxFit.fill,
  //         ),
  //       ),
  //       child: BlocProvider(
  //           create: (context) => HomeCubit()..getSearchData(searchId: query),
  //           child: BlocBuilder<HomeCubit, HomeStates>(
  //             builder: (BuildContext context, HomeStates state) {
  //               if (state is GetSearchLoadingState) {
  //                 return Center(
  //                     child: CircularProgressIndicator(
  //                   color: AppColors.redColor,
  //                 ));
  //               }
  //               if (state is GetSearchErrorState) {
  //                 return Center(
  //                   child: Container(
  //                     height: double.infinity,
  //                     width: double.infinity,
  //                     decoration: const BoxDecoration(
  //                       color: Colors.white,
  //                       image: DecorationImage(
  //                         image: AssetImage("assets/images/pattern.png"),
  //                         fit: BoxFit.fill,
  //                       ),
  //                     ),
  //                     child: const Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       crossAxisAlignment: CrossAxisAlignment.center,
  //                       children: [
  //                         Text("The Data Has Corrupted",style: TextStyle(color: Colors.black),),
  //                       ],
  //                     ),
  //                   ),
  //                 );
  //               }
  //               if (state is GetSearchSuccessState) {
  //                 var newsList = HomeCubit.get(context).newsResponse?.articles?? [];
  //                 return ListView.builder(
  //                   itemBuilder: (context, index) {
  //                     return NewsItem(
  //                         articles:newsList[index]);
  //                   },
  //                   itemCount:
  //                       newsList.length
  //                 );
  //               }
  //               return Container();
  //             },
  //           )));
  // }
searchSuggestionsBar() {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      image: DecorationImage(
        image: AssetImage("assets/images/pattern.png"),
        fit: BoxFit.fill,
      ),
    ),
    child: FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsData(searchId: query),
      builder: (context, snapshot) {
        if (query.isEmpty) {
          return Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/images/pattern.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("No Item To Search",style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  Center(
              child: CircularProgressIndicator(
            color: AppColors.redColor,
          ));
        }
        if (snapshot.hasError) {
          return Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/images/pattern.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Something Went Wrong"),
                ],
              ),
            ),
          );
        }
        var newsList = snapshot.data!.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(articles: newsList[index]);
          },
          itemCount: newsList.length,
        );
      },
    ),
  );
}
}
