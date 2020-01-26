import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:site_babycha/app/app_module.dart';
import 'package:site_babycha/app/modules/presente/presente_bloc.dart';
import 'package:site_babycha/app/modules/presente/presente_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(PresenteModule());
  PresenteBloc bloc;

  setUp(() {
    bloc = PresenteModule.to.get<PresenteBloc>();
  });

  group('PresenteBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<PresenteBloc>());
    });
  });
}
