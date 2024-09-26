import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../model/NewsResponse.dart';
import 'news_details.dart';

class NewsItem extends StatelessWidget {
  Articles articles;

  NewsItem({required this.articles, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.routeName,arguments: articles);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: CachedNetworkImage(
                height: MediaQuery.of(context).size.height*0.28,
                imageUrl: articles.urlToImage ?? "",fit: BoxFit.fill,
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: Colors.green,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(articles.author ?? ""),
            Text(articles.title ?? ""),
            Text(articles.description ?? ""),
            Text(articles.publishedAt!.substring(0,10)?? "",textAlign: TextAlign.end,),
          ],
        ),
      ),
    );
  }
}
