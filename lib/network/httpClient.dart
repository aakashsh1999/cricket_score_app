import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  String baseurl = "https://api.babajikijay.com/v2";
  Future get(String url) async {
    url = formater(url);
    // /user/register
    var response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer qeu0dq2d2q1ihfgx"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);

      return json.decode(response.body);
    }
    print(response.body);
    print(response.statusCode);
  }

  String formater(String url) {
    print(baseurl + url);
    return baseurl + url;
  }

  Future getById(String url, int id) async {
    String baseurl = "https://api.babajikijay.com/v2";
    String getUrl = baseurl + url + "?id=$id";
    print(getUrl);
    final http.Response response = await http.get(
      Uri.parse(getUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer qeu0dq2d2q1ihfgx"
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
      ;
    } else {
      throw Exception('Failed to delete album.');
    }
  }
}
