import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/network/api_services.dart';
import 'package:news_app/widgets/article_list.dart';
import 'package:news_app/widgets/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices apiServices = ApiServices();
  List<ArticleModel> articles = [];
  String selectedCategory = "science"; // Default category

  Future<void> getAllArticles(String name) async {
    List<ArticleModel> fetchedArticles = await apiServices.getApiData(name);
    setState(
      () {
        articles = fetchedArticles;
        selectedCategory = name; // Update selected category
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getAllArticles(selectedCategory); // Load default category
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CarouselSliderWidget(
            onCategorySelected: (String category) {
              getAllArticles(category); // Fetch articles on selection
            },
          ),
          ArticleList(articles: articles),
        ],
      ),
    );
  }
}
