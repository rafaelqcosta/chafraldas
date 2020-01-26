import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:site_babycha/app/app_module.dart';
import 'package:site_babycha/app/modules/obrigado/obrigado_bloc.dart';
import 'package:site_babycha/app/modules/obrigado/obrigado_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(ObrigadoModule());
  ObrigadoBloc bloc;

  setUp(() {
    bloc = ObrigadoModule.to.get<ObrigadoBloc>();
  });

  group('ObrigadoBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<ObrigadoBloc>());
    });
  });
}
