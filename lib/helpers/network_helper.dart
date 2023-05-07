import 'package:flutter/material.dart';
import 'package:himalsanchar/models/comment_model.dart';
import 'package:himalsanchar/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:himalsanchar/strings.dart';
class NetworkHelper {
  Future<List> getData(String url) async {
    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);

    List<News> news0 = [];
    List<Comment> comment0 = [];
    if (url.contains("/v2/posts/")) {
      
      for (var u in jsonData) {
        News news = News(
          u["id"],
          u["title"]["rendered"],
          weburl+u["jetpack_featured_media_url"],
          u["excerpt"]["rendered"],
          u["link"],
          u["content"]["rendered"],
          u["date_gmt"],
          u["yoast_head_json"]["author"],
        );
        news0.add(news);
      }
      return news0;
    } else if (url.contains("/v2/comments")) {
      for (var u in jsonData) {
        Comment comment = Comment(
          u["id"],
          u["author_name"],
          u["content"]["rendered"],
        );
        comment0.add(comment);
      }
      return comment0;
    }
    debugPrint("${news0.length}");
    return news0;
  }
}
