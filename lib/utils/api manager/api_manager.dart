import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/NewsResponse.dart';
import '../end_points.dart';

class ApiManager {

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
