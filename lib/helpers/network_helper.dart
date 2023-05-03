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

    List<News> _news = [];
    List<Comment> _comment = [];
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
        _news.add(news);
      }
      return _news;
    } else if (url.contains("/v2/comments")) {
      for (var u in jsonData) {
        Comment comment = Comment(
          u["id"],
          u["author_name"],
          u["content"]["rendered"],
        );
        _comment.add(comment);
      }
      return _comment;
    }
    debugPrint("${_news.length}");
    return _news;
  }
}
