import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

//chave da api 8536ee7e2c02b177dd1328209053f05f

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  @observable
  int value = 0;
  

  @action
  void increment() {
    value++;
  }
}
