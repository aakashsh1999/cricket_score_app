class NewsModel {
  final title;
  final image;
  final category;
  final id;
  final date;
  final body;

  NewsModel({
    this.title,
    this.image,
    this.category,
    this.id,
    this.date,
    this.body,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json){
    return NewsModel(
       title: json['title'],
       image: json['urlToImage'],
       category: "No-category",
       id: json['source']['id'],
       date: json['publishedAt'],
       body:json['description']
    );
  }

}

