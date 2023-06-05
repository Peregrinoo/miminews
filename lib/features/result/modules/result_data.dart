//                                Deus seja louvado !!!

import 'package:dio/dio.dart';
import 'package:miminews/features/result/modules/result_model.dart';

class ResultData{

  //Singleton
  ResultData._();

  final String _apiKey = "8536ba789dc24e0680098ddcc26e114e";

  searchNews(String text) async {

    try {

      Dio dio = Dio(); // Responsavel pelos request's;
// Formata para a data atual

      int year = DateTime.now().year;
      int month = DateTime.now().month;
      int day = DateTime.now().day;

      print("Deo adiuvit -> ${"newsapi.org/v2/everything?q=$text&from=$year-0$month-0${day - 1}&sortBy=publishedAt&apiKey=$_apiKey"}");
      Response response = await dio.get("https://newsapi.org/v2/everything?q=$text&from=$year-0$month-0${day - 1}&sortBy=publishedAt&apiKey=$_apiKey");

      List<dynamic> listArticles = response.data["articles"];
      print("Deo adiuvit -> $listArticles");
      List<ResultModel> artigos = [];

      for(int i = 0; i < listArticles.length; i++) {
        artigos.add(ResultModel(
            author: listArticles[i]["author"].toString(),
            content: listArticles[i]["content"].toString(),
            description: listArticles[i]["description"].toString(),
            publishedAt: listArticles[i]["publishedAt"].toString(),
            title: listArticles[i]["title"].toString(),
            url: listArticles[i]["url"].toString(),
            urlToImage: listArticles[i]["urlToImage"].toString()
        ));
      }
      dio.close();
      return artigos;


    } catch(e) {
      return [ResultModel(
          author: "error",
          content: "error",
          description: "error",
          publishedAt: "error",
          title: "error",
          url: "error",
          urlToImage: "error")
      ];
    }

  }

  //Getters;
  static ResultData get getInstance => ResultData._();
}
//Deixo registrado que foi pela graça de Deus que eu fiz isto !