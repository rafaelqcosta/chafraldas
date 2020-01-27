import 'package:site_babycha/app/widgets/confirmar_presenca/confirmar_presenca_bloc.dart';
import 'package:site_babycha/app/app_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'modules/obrigado/obrigado_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ConfirmarPresencaBloc()),
        Bind((i) => AppBloc()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/obrigado', module: ObrigadoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
