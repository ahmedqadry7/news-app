import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:session_7_news/models/NewsResponse.dart';
import 'package:session_7_news/models/source_response.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String category) async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=34e846bea7d647249221e647ca5ffd9b
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "34e846bea7d647249221e647ca5ffd9b",
        "category":category});
    http.Response response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    return SourceResponse.fromJson(json);
  }

  static Future<NewsResponse> getNewsData(String sourceId) async {
    Uri url = Uri.http("newsapi.org", "/v2/everything", {"sources": sourceId});
    var response = await http.get(url, headers: {"x-api-key": "34e846bea7d647249221e647ca5ffd9b"});
    var json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
