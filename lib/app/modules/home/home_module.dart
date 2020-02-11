import 'package:marvelpedia/app/app_module.dart';
import 'package:marvelpedia/app/modules/home/home_repository.dart';
import 'package:marvelpedia/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelpedia/app/modules/home/home_page.dart';
import 'package:marvelpedia/app/modules/two/two_controller.dart';
import 'package:marvelpedia/app/modules/two/two_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeRepository(AppModule.to.get())),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/two', module: TwoModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
