import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

class ConfirmarPresencaBloc extends Disposable {
  //dispose will be called automatically by closing its streams
  @override
  void dispose() {}

  final StreamController _streamController = StreamController();
  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;

  String nome = '';
  int criancas = 0;
  int adultos = 0;

  String validarNome() {
    if (nome == null || nome.isEmpty) {
      print('null ou vazio');
      return 'Este campo é obrigatório.';
    } else if (nome.length < 3) {
      print('menor que 3');
      return 'Seu nome precisa ter mais de 3 caracteres';
    }
    return null;
  }

  void addCriancas() {
    criancas += criancas != 5 ? 1 : 0;
  }

  void removeCriancas() {
    criancas -= criancas != 0 ? 1 : 0;
  }

  void addAdultos() {
    adultos += adultos != 5 ? 1 : 0;
  }

  void removeAdultos() {
    adultos -= adultos != 0 ? 1 : 0;
  }
}
