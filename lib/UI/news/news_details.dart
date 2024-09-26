import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home_screen.dart';
import '../../model/NewsResponse.dart';
import '../../utils/app_color.dart';
class NewsDetails extends StatelessWidget {
  static const String routeName = "news";
  const NewsDetails({super.key});
  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute.of(context)?.settings.arguments as Articles;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            HomeScreen.selectedCategory == null
                ? "Akhbarab News Details"
                : HomeScreen.selectedCategory!.title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.28,
                  imageUrl: articles.urlToImage ?? "",
                  fit: BoxFit.fill,
                  placeholder: (context, text) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.2,
                      height: MediaQuery.of(context).size.height*0.28,
                      color: Colors.grey[600]!,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Text(articles.author ?? ""),
              Text(articles.title ?? ""),
              Text(articles.publishedAt!.substring(0, 10) ?? "",textAlign: TextAlign.end,),
              Text(articles.description?? ""),
              Text(articles.content ?? ""),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  _launchUrl(articles.url??"");
                },
                child:const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("View Full Article"),
                    Icon(Icons.arrow_right)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
