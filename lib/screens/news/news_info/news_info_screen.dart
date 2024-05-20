import 'package:accounting_app/models/news_model.dart';
import 'package:accounting_app/theme/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewsInfoScreen extends StatefulWidget {
  final NewsModel news;

  const NewsInfoScreen({super.key, required this.news});

  @override
  State<NewsInfoScreen> createState() => _NewsInfoScreenState();
}

class _NewsInfoScreenState extends State<NewsInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        title: Text(
          'News',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19,
              color: AppColors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.news.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 23,
                      color: AppColors.white),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    text: 'By ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: AppColors.white60),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.news.author,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: AppColors.orange),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.news.date,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: AppColors.white60),
                    ),
                    Text(
                      '${widget.news.readTime} min read',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: AppColors.white60),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    widget.news.image,
                    fit: BoxFit.cover,
                    height: 195,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  widget.news.article,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
