import 'package:himalsanchar/models/comment_model.dart';
import 'package:himalsanchar/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Future<List> getData(String url) async {
    print(url);
    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);

    List<News> _news = [];
    List<Comment> _comment = [];
    if (url.contains("/v2/posts/")) {
      for (var u in jsonData) {
        News news = News(
          u["id"],
          u["title"]["rendered"],
          u["jetpack_featured_media_url"],
          u["excerpt"]["rendered"],
          u["link"],
          u["content"]["rendered"],
          u["date_gmt"],
          u["yoast_head_json"]["schema"]["@graph"][6]["name"],
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
    print(_news.length);
    return _news;
  }
}
