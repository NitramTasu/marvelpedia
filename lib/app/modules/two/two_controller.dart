import 'package:mobx/mobx.dart';

part 'two_controller.g.dart';

class TwoController = _TwoBase with _$TwoController;

abstract class _TwoBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
