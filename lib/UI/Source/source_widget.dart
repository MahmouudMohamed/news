import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/UI/Source/custom_source.dart';
import 'package:news_project/view%20model/home_cubit.dart';
import '../news/news_wigdet.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({required this.id, super.key});
  String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..getSources(id),
        child:  Column(
          children: [
             const CustomSource(),
            Expanded(child: NewsWigdet(id: id,)),
          ],
        ));

  }
}
