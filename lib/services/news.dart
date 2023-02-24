import 'dart:convert';

import 'package:metiz_cinema/models/postNews.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class newAPI {
  static const String url = 'https://63c4c7d7e1292e5bea156ec9.mockapi.io/api/v1/news';
  static List<postNews> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<postNews> posts = list.map((model) => postNews.fromJson(model)).toList();
    return posts;
  }

  static Future<List<postNews>> fetchPost({int page = 1}) async {
    http.Response response = await http.get(Uri.parse(url));
    String source = Utf8Decoder().convert(response.bodyBytes);
    if (response.statusCode == 200) {
      return compute(parsePost, source);
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can\'t get post');
    }
  }
}