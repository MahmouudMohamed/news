import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/NewsResponse.dart';
import '../utils/end_points.dart';
import '../model/SourcesResponse.dart';

class ApiManager {
  static Future<SourcesResponse?> getSources(String id) async {
    Uri url = Uri.https(
      EndPoints.baseUrl,
      EndPoints.sources,
      {
        "apiKey": EndPoints.apiKey,
        "category": id
      },
    );

    var response = await http.get(url);
    try {
      // Map<String, dynamic> format = jsonDecode(response.body);
      SourcesResponse sourcesResponse =
          SourcesResponse.fromJson(jsonDecode(response.body));
      return sourcesResponse;
    } catch (e) {
      throw e;
    }
  }
  static Future<NewsResponse?> getNewsData({String? sourceId, String? searchId}) async {
    Uri url = Uri.https(
      EndPoints.baseUrl,
      EndPoints.everything,
      {
        "apiKey": EndPoints.apiKey,
        "sources": sourceId,
        "q": searchId,
      },
    );
    var response = await http.get(url);
    NewsResponse newsResponse =
    NewsResponse.fromJson(jsonDecode(response.body));
    return newsResponse;
  }
}
