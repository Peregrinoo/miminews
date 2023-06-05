//                                                Deus seja louvado !!!

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miminews/features/home/home_page.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),

    )
  );
}


