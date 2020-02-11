import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelpedia/app/modules/two/two_controller.dart';
import 'package:marvelpedia/app/modules/two/two_page.dart';

class TwoModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => TwoController()),
  ];

  @override
  List<Router> get routers => [
    Router('/', child: (_, args) => TwoPage()),
  ];

  static Inject get to => Inject<TwoModule>.of();
}
