import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/UI/Source/tab_item.dart';
import 'package:news_project/api%20manager/api_manager.dart';
import 'package:news_project/view%20model/home_cubit.dart';
import '../../model/SourcesResponse.dart';
import '../../view model/home_state.dart';
import '../news/news_wigdet.dart';

class SourceWidget extends StatelessWidget {

  SourceWidget({required this.id, super.key});

  String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) =>
    HomeCubit()
      ..getSources(id),
        child: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              var cubit = HomeCubit.get(context);
              return DefaultTabController(
                  length: cubit.sourcesResponse?.sources?.length ?? 0,
                  child: TabBar(
                    // onTap: (value) {
                    //   selectedIndex = value;
                    //   setState(() {});
                    // },
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabs: cubit.sourcesResponse?.sources?
                        .map((e) =>
                        TabItem(
                          isSelected: cubit.sourcesResponse!.sources!.elementAt(
                              0) == e,
                          source: e,
                        ))
                        .toList()??"",
                  ));
            }
        )


    );
    // FutureBuilder(
    //     future: ApiManager.getSources(widget.id),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: CircularProgressIndicator(color: Colors.green,),
    //         );
    //       }
    //       if (snapshot.hasError) {
    //         return Center(
    //           child: Text(snapshot.error.toString()),
    //         );
    //       }
    //       if (snapshot.hasData) {
    //          sources = snapshot.data?.sources ?? [];
    //         return Column(
    //           children: [
    //             DefaultTabController(
    //                 length:sources .length,
    //                 child: TabBar(
    //                   onTap: (value) {
    //                     selectedIndex = value;
    //                     setState(() {});
    //                   },
    //                   isScrollable: true,
    //                   tabAlignment: TabAlignment.start,
    //                   indicatorColor: Colors.transparent,
    //                   dividerColor: Colors.transparent,
    //                   tabs: sources
    //                       .map((e) => TabItem(
    //                             isSelected: sources .elementAt(selectedIndex) == e,
    //                             source: e,
    //                           ))
    //                       .toList(),
    //                 )),
    //             NewsWigdet(id:sources[selectedIndex].id!)
    //           ],
    //         );
    //       }
    //       return Container();
    //     });


  }
}
