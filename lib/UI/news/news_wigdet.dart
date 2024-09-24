import 'package:flutter/material.dart';
import '../../api manager/api_manager.dart';
import 'news_item.dart';
class NewsWigdet extends StatelessWidget {
  String id;
   NewsWigdet({required this.id,super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future: ApiManager.getNewsData(sourceId:id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.green,),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          var articles = snapshot.data?.articles ?? [];
          return Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return NewsItem(articles: articles[index]);

            },
            itemCount: articles.length,),
          );
          return Container();
        });
    ;
  }
}
