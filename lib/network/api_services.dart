import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class ApiServices {
  Dio dio = Dio();
  static const String apiKey = 'c8ad00290d8247cebd1c97e819a43b04';

  Future<List<ArticleModel>> getApiData(String category) async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey');

      if (response.statusCode == 200) {
        List<dynamic> jsonData =
            response.data['articles']; // Fix: Access articles list

        List<ArticleModel> articles = jsonData.map((element) {
          return ArticleModel(
            title: element['title'],
            description: element['description'],
            image: element['urlToImage'],
          );
        }).toList(); // Fix: Convert map to list

        return articles;
      } else {
        throw Exception('Failed to fetch articles');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e'); // Fix: Handle errors
    }
  }
}
