import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/recados.dart';
import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "CháFraldas"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = HomeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          cardPrincipal(context),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          evento(context),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 2,
            decoration: BoxDecoration(color: Colors.blue[100]),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          presentes(context),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          listaPresentes(),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 2,
            decoration: BoxDecoration(color: Colors.blue[100]),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          recado(context),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
        ],
      ),
    ));
  }

  Widget presentes(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.blue),
      // padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Quer me dar um presente?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              //fontFamily: 'Fino',
              //fontWeight: FontWeight.w100,
              fontSize: 20,
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(bottom: 8),
          // ),
          // Text(
          //   'Olha só o que a mamãe e o papai fizeram pra te ajudar.',
          //   style: TextStyle(color: Colors.blue, fontSize: 15),
          //   textAlign: TextAlign.center,
          // ),
          // Padding(
          //   padding: EdgeInsets.only(bottom: 20),
          // ),
        ],
      ),
    );
  }

  Widget recado(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width < 400
          ? MediaQuery.of(context).size.width
          : 400,
      child: Column(
        children: <Widget>[
          Text(
            'Recadinhos dos convidados',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
          ListView.builder(
            //scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: Recados.recados.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> recado = Recados.recados[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                    image: AssetImage(recado['foto']),
                  ),
                ),
                title: Text(recado['nome']),
                subtitle: Text(recado['recado']),
                //trailing: Icon(Icons.more_vert),
                isThreeLine: true,
              );
            },
          )
        ],
      ),
    );
  }

  Widget evento(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Conto com a sua presença!',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
          ),
        ),
        Text(
          'Informações sobre a festinha',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blue,
            fontFamily: 'Fino',
            //fontWeight: FontWeight.w100,
            fontSize: 20,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 6,
              right: MediaQuery.of(context).size.width / 6),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.date_range,
                  size: 40,
                ),
                title: Text('Dia 16 de Fevereiro'),
                subtitle: Text('às 11:00h'),
              ),
              ListTile(
                leading: GestureDetector(
                  onTap: () async {
                    if (await canLaunch(
                        'https://goo.gl/maps/n5xyyA5VHHEb5J5f7')) {
                      await launch('https://goo.gl/maps/n5xyyA5VHHEb5J5f7');
                    }
                  },
                  child: Icon(
                    Icons.location_on,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
                title: Text('Local'),
                subtitle: Text(
                    'Casa da Tia Paulinha. \nSHIS Qi 7, Conj. 4, casa 11 \nCasinha amarela.'),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget cardPrincipal(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height / 1.8,
      margin: EdgeInsets.only(top: 25, left: 10, right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        gradient: LinearGradient(colors: [Colors.blue[50], Colors.white]),
      ),
      child: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                //color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MediaQuery.of(context).size.width < 600
                        ? Container(
                            margin: EdgeInsets.all(20),
                            child: Image(
                              image: AssetImage('assets/img/bebe.png'),
                            ))
                        : Container(),
                    Text(
                      'Bem vindos ao',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Fino',
                        //fontWeight: FontWeight.w100,
                        fontSize: 30,
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'CháFraldas do ',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Rafael',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Text(
                      'Oi amiguinhos, como todos sabem já estou a caminho para trazer muita alegria. Por isso, quero convidá-los a minha primeira festinha mesmo antes de nascer.',
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                    ),
                  ],
                ),
              ),
            ),
            MediaQuery.of(context).size.width > 600
                ? Expanded(
                    child: Container(
                        margin: EdgeInsets.all(20),
                        child: Image(
                          image: AssetImage('assets/img/bebe.png'),
                        )),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget listaPresentes() {
    return Stack(
      children: <Widget>[
        Container(
          width: 250,
          height: 400,
          margin: EdgeInsets.only(top: 60, left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 100),
              ),
              Text(
                'Kit Fraldas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  'O recém-nascido usa em média 8 fraldas por dia. Sendo assim, cada pacote é suficiente para, mais ou menos, 5 dias de vida do bebê.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'R\$ ${_bloc.valor},00',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _bloc.remove();
                            });
                          },
                          child:
                              Container(width: 30, child: Icon(Icons.remove)),
                        ),
                        Text(
                          '${_bloc.quantidade}',
                          style: TextStyle(fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _bloc.add();
                            });
                          },
                          child: Container(width: 30, child: Icon(Icons.add)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              FlatButton(
                color: Colors.white,
                child: Text(
                  "Doar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                onPressed: () {
                  _bloc.doar();
                },
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 0),
          width: 300,
          child: Image(
            image: AssetImage('assets/img/fralda_pacote.png'),
          ),
        ),
      ],
    );
  }
}
