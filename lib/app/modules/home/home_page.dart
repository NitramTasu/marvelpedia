import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelpedia/app/models/character.dart';
import 'package:marvelpedia/app/modules/home/home_controller.dart';
import 'package:marvelpedia/app/modules/home/home_repository.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Marvel"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Character> characters = List<Character>();
  Timer timer;
  double currentOpacity = 0;
  int moveTop = 250;

  @override
  void initState() {
    timer = Timer(Duration(seconds: 3), () {
      setState(() {
        moveTop = 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    //   statusBarColor: Color.fromARGB(255, 200, 255, 10)
    // ));
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Color.fromARGB(255, 200, 255, 10)
    // ));

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    final homeController = Modular.get<HomeController>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          AnimatedOpacity(
            opacity: currentOpacity,
            duration: Duration(seconds: 1),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 118,
                ),
                Flexible(
                  child: buildListView(homeController),
                )
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            width: MediaQuery.of(context).size.width,
            top: moveTop.toDouble(),
            child: Image.network(
                "https://d23.com/app/uploads/2019/07/marvel-op-2-1180w-600hIris-780x440-1563899008.jpg"),
            onEnd: () {
              setState(() {
                currentOpacity = 1;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildListView(HomeController homeController) {
    return FutureBuilder(
      builder: (context, snapdata) {
        if (snapdata.hasData == false) {
          return Container(
            child: Center(
              child: Text("Carregando..."),
            ),
          );
        }
        return ListView.builder(
          itemCount: snapdata.data.length,
          itemBuilder: (_, index) {
            Character item = snapdata.data[index];
            return buildCharacterItem(item);
          },
        );
      },
      future: homeController.getCharacterList(),
    );
  }

  Card buildCharacterItem(Character item) {
    return Card(
        margin: EdgeInsets.only(top: 30),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.network(
                item.urlImage,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child:Text(item.name,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Open Sans'
              ),),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ));
  }
}
