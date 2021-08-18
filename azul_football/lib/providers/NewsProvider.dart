// import 'package:cric_dice/models/news.dart';
// import 'package:cric_dice/respository/newsRepository.dart';
// import 'package:flutter/material.dart';
// import 'package:cric_dice/network/apiResponse.dart';

// class NewsProvider with ChangeNotifier {
//   NewsRepository _newsRepository;

//   ApiResponse<NewsModel> _news;

//   ApiResponse<NewsModel> get album=> _news;

//   AlbumDetailsProvider() {
//     _newsRepository = NewsRepository();
//     fetchAlbumDetails();
//   }

//   fetchAlbumDetails() async {
//       NewsModel news = await _newsRepository.fetchAlbumDetails();
//       _news = ApiResponse.completed(news);
//         notifyListeners();
//   }

// }