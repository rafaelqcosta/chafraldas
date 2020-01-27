import 'package:flutter/material.dart';

import 'confirmar_presenca_bloc.dart';

class ConfirmarPresencaWidget extends StatefulWidget {
  @override
  _ConfirmarPresencaWidgetState createState() =>
      _ConfirmarPresencaWidgetState();
}

class _ConfirmarPresencaWidgetState extends State<ConfirmarPresencaWidget> {
  ConfirmarPresencaBloc _bloc = ConfirmarPresencaBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          StreamBuilder<Object>(
              stream: _bloc.output,
              builder: (context, snapshot) {
                return TextField(
                  onChanged: (value) {
                    _bloc.nome = value;
                    _bloc.input.add(value);
                  },
                  maxLength: 30,
                  decoration: InputDecoration(
                      errorText: _bloc.validarNome(),
                      labelText: 'Nome e sobrenome',
                      counterStyle: TextStyle(fontSize: 0)),
                );
              }),
          TextField(
            maxLength: 11,
            decoration: InputDecoration(
                labelText: 'Telefone', counterStyle: TextStyle(fontSize: 0)),
          ),
          TextField(
            maxLength: 30,
            decoration: InputDecoration(
                labelText: 'E-mail', counterStyle: TextStyle(fontSize: 0)),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _quantidade('adultos'),
              _quantidade('crianças'),
            ],
          )
        ],
      ),
    );
  }

  Widget _quantidade(
    String label,
  ) {
    return Column(
      children: <Widget>[
        Text(label),
        Container(
          height: 30,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  label.contains('crianças')
                      ? _bloc.removeCriancas()
                      : _bloc.removeAdultos();
                  setState(() {});
                },
                child: Container(width: 30, child: Icon(Icons.remove)),
              ),
              Text(
                label.contains('crianças')
                    ? '${_bloc.criancas}'
                    : '${_bloc.adultos}',
                style: TextStyle(fontSize: 20),
              ),
              GestureDetector(
                onTap: () {
                  label.contains('crianças')
                      ? _bloc.addCriancas()
                      : _bloc.addAdultos();
                  setState(() {});
                },
                child: Container(width: 30, child: Icon(Icons.add)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
