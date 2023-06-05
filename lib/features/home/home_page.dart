//                                         Deus seja louvado !!!

import 'package:flutter/material.dart';
import 'package:miminews/features/home/modules/home_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    //Instanciação dos setters com as caracteristicas do display do usuario;
    HomeUi.getInstance.deviceHeight = MediaQuery.of(context).size.height;
    HomeUi.getInstance.deviceWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      theme: HomeUi.getInstance.getTheme,
      debugShowCheckedModeBanner: false,
      title: "Doogle",
      home: SafeArea(
        child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text("Doogle"),
                  elevation: 8.0,
                  actions: [
                    IconButton(onPressed: () => setState(() => HomeUi.getInstance.themeChange(context)),
                        icon: HomeUi.getInstance.getIcon)
                  ],
                ),

                body: SingleChildScrollView(
                  child: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                        width: HomeUi.getInstance.getDeviceHeight * 0.35,
                        height: HomeUi.getInstance.getDeviceHeight * 0.35,
                        child: Image.asset("lib/features/home/assets/banner.png",
                        fit: BoxFit.cover),
                      ),
                      Padding(padding:
                      EdgeInsets.only(
                          left: HomeUi.getInstance.getDeviceWidth * 0.1,
                          right: HomeUi.getInstance.getDeviceWidth * 0.1
                      ),
                        child: TextField(
                          autocorrect: true,
                          controller: HomeUi.getInstance.getSearchController,
                          onSubmitted: (text) => HomeUi.getInstance.search(context),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.grey)
                            ),
                            hintText: "Type here",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.grey),
                            )
                          ),
                        ),
                      ),

                    ],
                  )),
                ),

              ),
      ),
    );

  }
}




