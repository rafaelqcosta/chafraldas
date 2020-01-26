import 'package:site_babycha/app/modules/home/home_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../presente/presente_module.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeBloc()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/presente', module: PresenteModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
