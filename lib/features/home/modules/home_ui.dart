//                                        Deus seja louvado !!!

// ignore_for_file: avoid_print


import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:miminews/features/result/modules/result_data.dart';
import 'package:miminews/features/result/result_page.dart';
import 'package:quickalert/quickalert.dart';

import '../../result/modules/result_model.dart';

class HomeUi{

  //Singleton
  HomeUi._();
  static final HomeUi _instance = HomeUi._();

  //Home Utils:
  Icon _userThemeIcon = const Icon(HeroIcons.sun);
  bool _userThemeState = false; // False -> Night | True -> Light;
  final TextEditingController _searchController = TextEditingController();

  //Screen -> Variaveis para a responsividade do APP
  double _userDeviceHeight = 0.0; //Altura da tela do usuario;
  double _userDeviceWidth = 0.0; //Largura da tela do usuario;

  ThemeData _userTheme = ThemeData(
    primaryColor: Colors.indigo,
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 16, color: Colors.white)
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurpleAccent
    )
  );


  themeChange(BuildContext context) {
    if(_userThemeState) {

      _userTheme = ThemeData(
          primaryColor: Colors.indigo,
          brightness: Brightness.dark,
          buttonTheme: const ButtonThemeData(
              buttonColor: Colors.deepPurpleAccent
          )
      );

      _userThemeState = false;
      _userThemeIcon = const Icon(HeroIcons.sun);

    } else {

      _userTheme = ThemeData(
          primaryColor: Colors.white,
          brightness: Brightness.light,

          buttonTheme: const ButtonThemeData(
              buttonColor: Colors.grey
          )
      );

      _userThemeState = true;
      _userThemeIcon = const Icon(HeroIcons.moon);
    }

  }

  search(BuildContext context) async {
    print("gloria Deo -> Resultado da pesquisa: ${_searchController.text}");
    List<ResultModel> artigos = await ResultData.getInstance.searchNews(_searchController.text);

    if(artigos.isEmpty || artigos.first.title == "error")  {
      QuickAlert.show(context: context,
        type: QuickAlertType.error,
        title: "Erro inesperado",
        showCancelBtn: false,
        text: "Ocorreu um erro ao realizar a requisição"
      );
    } else {

      for (var element in artigos) {
        print("gloria Deo -> ${element.url}");
      }

      // ignore: use_build_context_synchronously
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultPage(
          artigos,
          _searchController.text)));

    }

  }


  //Getters
  static HomeUi get getInstance => _instance;
  ThemeData get getTheme => _userTheme;
  Icon get getIcon   => _userThemeIcon;
  TextEditingController get getSearchController => _searchController;
  bool get getUserTheme => _userThemeState;
  //Screen
  double get getDeviceHeight => _userDeviceHeight;
  double get getDeviceWidth  => _userDeviceWidth;


  //Setters;
  set deviceHeight(double height) => _userDeviceHeight = height;
  set deviceWidth(double width)   => _userDeviceWidth  = width;


}



