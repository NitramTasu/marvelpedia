import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:marvelpedia/app/modules/two/two_controller.dart';
import 'package:marvelpedia/app/app_module.dart';

void main() {
  initModule(AppModule());
  TwoController two;

  setUp(() {
    two = AppModule.to.get<TwoController>();
  });

  group('TwoController Test', () {
    test("First Test", () {
      expect(two, isInstanceOf<TwoController>());
    });

    test("Set Value", () {
      expect(two.value, equals(0));
      two.increment();
      expect(two.value, equals(1));
    });
  });
}
