import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Modular.get<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: buildListView(homeController),
            ),
          )
        ],
      ),
    );
  }

  Widget buildListView(HomeController homeController) {
    return FutureBuilder(
      builder: (context, snapdata) {
        if (snapdata.hasData == false) {
          return Container(child: Center(child: Text("Carregando..."),),);
        }
        return ListView.builder(
          itemCount: snapdata.data.length,
          itemBuilder: (_, index) {
            var item = snapdata.data[index];
            return ListTile(
              title: Text(
                item.name,
                textAlign: TextAlign.center,
              ),
            );
          },
        );
      }, 
      future: homeController.getCharacterList(),
    );
  }
}
