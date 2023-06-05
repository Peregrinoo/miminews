//                                                                  Deus seja louvado !!!

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewPage extends StatefulWidget {

  String url;

  ViewPage(this.url, {super.key});

  @override
  State<ViewPage> createState() => _ViewPageState(url);
}

class _ViewPageState extends State<ViewPage> {

  String url = "";

  _ViewPageState(this.url);

  //Webview controller;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)..loadRequest(Uri.parse(url));
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(url),
            ),
            body: WebViewWidget(
                  controller: controller,

                ),
            ),
        );
  }
}
