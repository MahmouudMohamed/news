import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/UI/Source/tab_item.dart';

import '../../view model/home_cubit.dart';
import '../../view model/home_state.dart';

class CustomSource extends StatelessWidget {
  const CustomSource({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
      var cubit = HomeCubit.get(context);
      if(state is GetSourcesLoadingState){
        return const Center(
          child: CircularProgressIndicator(color: Colors.green,),
        );
      }
      return DefaultTabController(
          length: cubit.sourcesResponse?.sources?.length ?? 0,
          child: TabBar(
            onTap: (value) {
              cubit.changeIndex(value);
            },
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabs: cubit.sourcesResponse?.sources
                ?.map((e) =>
                TabItem(
                  isSelected: cubit.sourcesResponse!.sources!
                      .elementAt(cubit.selectedIndex) ==
                      e,
                  source: e,
                ))
                .toList() ??
                [],
          ));
    });
  }
}