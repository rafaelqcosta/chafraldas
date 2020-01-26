import 'package:site_babycha/app/modules/obrigado/obrigado_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'obrigado_page.dart';

class ObrigadoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ObrigadoBloc()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ObrigadoPage()),
      ];

  static Inject get to => Inject<ObrigadoModule>.of();
}
