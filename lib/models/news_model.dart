class NewsModel {
  final String title;
  final String article;
  final String image;
  final String date;
  final String author;
  final int readTime;

  NewsModel(
      {required this.title,
      required this.article,
      required this.image,
      required this.date,
      required this.author,
      required this.readTime});
}
