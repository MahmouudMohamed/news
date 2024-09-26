import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../model/NewsResponse.dart';
import '../model/SourcesResponse.dart';
import '../utils/end_points.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context)=>BlocProvider.of(context);
  SourcesResponse? sourcesResponse;
  NewsResponse? newsResponse;
  int selectedIndex = 0;
  changeIndex(int index) {
    selectedIndex = index;
    emit(HomeChangeSource());
  }

  getSources(String id) async {
    emit(GetSourcesLoadingState());
    Uri url = Uri.https(
      EndPoints.baseUrl,
      EndPoints.sources,
      {"apiKey": EndPoints.apiKey, "category": id},
    );
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        sourcesResponse = SourcesResponse.fromJson(jsonDecode(response.body));
        emit(GetSourcesSuccessState());
        getNewsData(sourceId: sourcesResponse?.sources?[selectedIndex].id??"");
      } else {
        emit(GetSourcesErrorState());
      }
    } catch (e) {
      emit(GetSourcesErrorState());
    }
  }

  getNewsData({String? sourceId, String? searchId}) async {
    emit(GetNewsLoadingState());
    Uri url = Uri.https(
      EndPoints.baseUrl,
      EndPoints.everything,
      {
        "apiKey": EndPoints.apiKey,
        "sources": sourceId,
        "q": searchId,
      },
    );
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        newsResponse = NewsResponse.fromJson(jsonDecode(response.body));

        emit(GetNewsSuccessState());
      } else {
        emit(GetNewsErrorState());
      }
    } catch (e) {
      emit(GetNewsErrorState());
    }
  }


  getSearchData({String? sourceId, String? searchId}) async {
    emit(GetSearchLoadingState());
    Uri url = Uri.https(
      EndPoints.baseUrl,
      EndPoints.everything,
      {
        "apiKey": EndPoints.apiKey,
        "sources": sourceId,
        "q": searchId,
      },
    );
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        newsResponse = NewsResponse.fromJson(jsonDecode(response.body));
        emit(GetSearchSuccessState());
      } else {
        emit(GetSearchErrorState());
      }
    } catch (e) {
      emit(GetSearchErrorState());
    }
  }

}
