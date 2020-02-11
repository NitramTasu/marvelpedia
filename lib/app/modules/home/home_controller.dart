import 'package:marvelpedia/app/models/character.dart';
import 'package:marvelpedia/app/modules/home/home_module.dart';
import 'package:marvelpedia/app/modules/home/home_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

//chave da api 8536ee7e2c02b177dd1328209053f05f

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  HomeRepository homeRepository = HomeModule.to.get<HomeRepository>();

  @observable
  int value = 0;

  @observable
  ObservableList<Character> characters = ObservableList.of([]);

  @action
  void increment() {
    value++;
  }

  // @action
  // void getCharacterList() {
  //   homeRepository.getCharacterList().then((data) => {characters = data});
  // }

  Future<List<Character>> getCharacterList() {
    return homeRepository.getCharacterSimpleList();
  }
}
