import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/article_item.dart';

class ArticleList extends StatelessWidget {
  ArticleList({super.key, required this.articles});

  List<ArticleModel> articles = [];

  @override
  Widget build(BuildContext context) {
    return articles.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                SliverList.separated(
                  itemBuilder: (c, index) => Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    child:ArticleItem(article: articles[index],),
                  ),
                  itemCount: articles.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ],
            ),
          );
  }
}
