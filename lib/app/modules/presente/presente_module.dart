import 'package:site_babycha/app/modules/presente/presente_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presente_page.dart';

class PresenteModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PresenteBloc()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => PresentePage()),
      ];

  static Inject get to => Inject<PresenteModule>.of();
}
