//                                         Deus seja louvado !!!



import 'package:flutter/material.dart';
import 'package:miminews/features/home/modules/home_ui.dart';
import 'package:miminews/features/result/modules/result_ui.dart';

import 'modules/result_model.dart';

class ResultPage extends StatefulWidget {

   List<ResultModel> artigos = [];
   String query = "";

  ResultPage(this.artigos, this.query, {super.key});



  @override
  State<ResultPage> createState() => _ResultPageState(artigos, query);
}

class _ResultPageState extends State<ResultPage> {

  List<ResultModel> artigos = [];
  String query = "";

  _ResultPageState(this.artigos, this.query);

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: HomeUi.getInstance.getTheme,
      home: SafeArea(child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Results for $query"),
        ),

        body: Column(
          children: [
            Expanded(child: ListView.builder(itemCount: artigos.length, itemBuilder: (context, index) {
              return Padding(padding: const EdgeInsets.all(25), child: Card(
                elevation: 4,
                color: HomeUi.getInstance.getUserTheme ? Colors.white : const Color.fromRGBO(87, 85, 85, 1),
                child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        SizedBox(
                          width: HomeUi.getInstance.getDeviceWidth * 0.7,
                          height: HomeUi.getInstance.getDeviceHeight * 0.25,
                          child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: const AssetImage("lib/features/result/assets/wait.jpg"),
                            image: ResultUI.getInstance.checkImage(artigos[index].urlToImage),
                            imageErrorBuilder: (context, error, trace) {
                              return Image.asset("lib/features/result/assets/error.png", fit: BoxFit.cover,);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(artigos[index].title, style:
                          ResultUI.getInstance.headerStyle,
                              textAlign: TextAlign.center),
                        ),
                        const SizedBox(height: 15),
                        Padding(padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                            child: Text(artigos[index].description,
                              style: ResultUI.getInstance.descriptionStyle,)),
                        ElevatedButton(
                            style: ResultUI.getInstance.buttonStyle,
                            onPressed: () => ResultUI.getInstance.viewArticle(artigos[index].url, context),
                            child: const Text("View Post", style: TextStyle(fontSize: 17),))

                      ],
                    )
                ),
              ),);
            }))
          ],
        )
    )));
  }
}




