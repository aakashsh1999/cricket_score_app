class NewsModel {
  final title;
  final image;
  final category;
  final id;
  final date;
  final body;
  final url;

  NewsModel({
    this.title,
    this.image,
    this.category,
    this.id,
    this.date,
    this.body,
    this.url,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      image: json['urlToImage'],
      category: "No-category",
      id: json['source']['id'],
      date: json['publishedAt'],
      body: json['description'],
      url: json['url'],
    );
  }
}
