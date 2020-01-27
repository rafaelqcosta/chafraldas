import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:site_babycha/app/app_module.dart';
import 'package:site_babycha/app/widgets/confirmar_presenca/confirmar_presenca_bloc.dart';
import 'package:site_babycha/app/app_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(AppModule());
  ConfirmarPresencaBloc bloc;

  setUp(() {
    bloc = AppModule.to.get<ConfirmarPresencaBloc>();
  });

  group('ConfirmarPresencaBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<ConfirmarPresencaBloc>());
    });
  });
}
