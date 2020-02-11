import 'package:marvelpedia/app/modules/two/two_controller.dart';
import 'package:dio/dio.dart';
import 'package:marvelpedia/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:marvelpedia/app/app_widget.dart';
import 'package:marvelpedia/app/modules/home/home_module.dart';
import 'package:marvelpedia/app/modules/two/two_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TwoController()),
        Bind((i) => AppController()),
        Bind((i) => Dio()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/two', module: TwoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
