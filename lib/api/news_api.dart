import 'package:cric_dice/models/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../helpers/constants.dart';

class NewsApi {
  static List<NewsModel> get aListNews => _newsData;
  static List<NewsModel> _newsData = [];

  static Future<List<NewsModel>> fetchData() async {
    _newsData.clear();
    var response = await http.get(
        Uri.https('api.babajikijay.com', '/v2/get_newslist'),
        headers: {'Authorization': '${token}'});
    var result = convert.jsonDecode(response.body);
    if (result['status'] == true) {
      result["data"].forEach((element) {
        if (element['image'] != null && element['description'] != null) {
          NewsModel newsModel = NewsModel.fromJson(element);
          _newsData.add(newsModel);
        }
      });
    }
    return _newsData;
  }
}
