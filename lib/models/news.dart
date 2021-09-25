class NewsModel {
  final title;
  final image;
  final author;
  final id;
  final date;
  final body;
  final url;

  NewsModel({
    this.title,
    this.image,
    this.id,
    this.author,
    this.date,
    this.body,
    this.url,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return NewsModel(
      title: json['title'],
      image: json['urlToImage'],
      author: json['author'],
      id: json['source']['id'],
      date: json['publishedAt'],
      body: json['description'],
      url: json['url'],
    );
  }
}
