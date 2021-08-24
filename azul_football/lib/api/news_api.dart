import 'package:cric_dice/models/news.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert' as convert;

class NewsApi {
  static  List<NewsModel> get aListNews=>_newsData;
  static List<NewsModel> _newsData = [
   

  ];



static Future<List<NewsModel>> fetchData() async {
    _newsData.clear();
    var response = await http.get(
        Uri.https('newsapi.org', '/v2/everything', {'q': '{cricket}'}),
        headers: {'Authorization': '88e4d8769a6342119a67b335cb2bec68'});
    print(response.body);
    var result = convert.jsonDecode(response.body);
    if (result['status'] == "ok") {
      result["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          NewsModel newsModel = NewsModel(
              title: element['title'],
              image: element['urlToImage'],
              category: "No-category",
              id: element['source']['id'],
              date: element['publishedAt'],
              body: element['description']);
          _newsData.add(newsModel);
        }
      });
      
    }
    return _newsData;
  }


}
