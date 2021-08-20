// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;

// class HttpClient {
//   static final HttpClient _singleton = HttpClient();

//   static HttpClient get instance => _singleton;

//   Future<dynamic> fetchData() async {
//     var responseJson;
//     try {
//       final response = await http.get(Uri.https('newsapi.org','/v2/everything', {'q':'{cricket}'}), headers: {
//           'Authorization':'88e4d8769a6342119a67b335cb2bec68'
//       });
//       print(response.body.toString());
//       responseJson = json.decode(response.body);
//     } on SocketException {
//       throw Exception('No Internet Service Available');
//     }
//     return responseJson;
//   }
// }