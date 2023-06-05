//                                                    Deus seja louvado !!!


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miminews/features/home/modules/home_ui.dart';
import 'package:miminews/features/view/view_page.dart';

class ResultUI{

  //Singleton;
  ResultUI._();

  //TextStyles;
  final TextStyle _headerStyle = GoogleFonts.roboto(fontSize: 18, color: HomeUi.getInstance.getUserTheme ? Colors.black : Colors.white, fontWeight: FontWeight.bold);
  final TextStyle _descriptionStyle = GoogleFonts.poppins(fontSize: 16, color: HomeUi.getInstance.getUserTheme ? Colors.black : Colors.white);
  final ButtonStyle _buttonStyle = ButtonStyle(
    alignment: Alignment.center,

    padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.only(left: HomeUi.getInstance.getDeviceWidth * 0.15,
        right: HomeUi.getInstance.getDeviceWidth * 0.15)),
    shape: const MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20))
    )),
    backgroundColor: HomeUi.getInstance.getUserTheme ? const MaterialStatePropertyAll<Color>(Colors.lightBlue) : const MaterialStatePropertyAll<Color>(
        Color.fromRGBO(72, 71, 71, 1.0))
        //484747FF
  );


  //Checa se a imagem é valida ou não (se ela é bloqueada por algum cloudflare ou alguma outra proteção :P)
  NetworkImage checkImage(String url) {
    try {
      NetworkImage image = NetworkImage(url);
      return image;
    } catch(e) {
      return const NetworkImage("https://cdn2.iconfinder.com/data/icons/gaming-and-beyond-part-2-1/80/Warning_gray-512.png");
    }
  }

  viewArticle(String url, BuildContext context) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPage(url)));


  //Getters;
  static ResultUI get getInstance => ResultUI._();
  TextStyle get headerStyle => _headerStyle;
  TextStyle get descriptionStyle => _descriptionStyle;
  ButtonStyle get buttonStyle => _buttonStyle;


}
