import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/utils/app_color.dart';
import '../../view model/home_cubit.dart';
import '../../view model/home_state.dart';
import 'news_item.dart';

class NewsWigdet extends StatelessWidget {
  String id;
  NewsWigdet({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
      var cubit = HomeCubit.get(context);
      if(state is GetSourcesLoadingState||state is GetNewsLoadingState){
        return  Center(
          child: CircularProgressIndicator(color: AppColors.redColor,),
        );
      }
      return ListView.builder(
        itemBuilder: (context, index) {
          return NewsItem(
            articles: cubit.newsResponse!.articles![index],
          );
        },
        itemCount: cubit.newsResponse?.articles?.length??0,
      );
    });
    ;
  }
}
