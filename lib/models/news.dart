class NewsModel {
  final title;
  final image;
  final author;
  final id;
  final date;
  final body;
  final content;

  NewsModel({
    this.title,
    this.image,
    this.id,
    this.author,
    this.date,
    this.body,
    this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return NewsModel(
      title: json['title'],
      image: json['image'],
      id: json['news_id'],
      date: json['pub_date'],
      body: json['description'],
      content: json['content'],
    );
  }
}
