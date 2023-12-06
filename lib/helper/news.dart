import 'dart:convert';

import 'package:flutternews/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{

  List<ArticleModel> news = [];

  Future<void> getNews() async{

    String url = "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=07d7f541a51c41af95cfb6b9590fee68";

    var response = await http.get(url as Uri);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "oke"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(
              author: element["author"],
              title: element['title'],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["Content"]
          );

          news.add(articleModel);
        }
      });
    }
  }
}