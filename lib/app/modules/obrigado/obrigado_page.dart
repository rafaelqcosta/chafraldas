import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class ObrigadoPage extends StatefulWidget {
  final String title;
  const ObrigadoPage({Key key, this.title = "Obrigado"}) : super(key: key);

  @override
  _ObrigadoPageState createState() => _ObrigadoPageState();
}

class _ObrigadoPageState extends State<ObrigadoPage> {
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
          escrever(context),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          feedback(),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
        ],
      ),
    ));
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
                      'Obrigado!!! Te Espero no',
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

  Widget feedback() {
    return Column(
      //mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Feedback',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (await canLaunch(
                'https://docs.google.com/forms/d/e/1FAIpQLSeVYf6nS2LiysnSeFPYdYV_kVi_--1khaeLqynsZ0OE_nrx2A/viewform?usp=sf_link')) {
              await launch(
                  'https://docs.google.com/forms/d/e/1FAIpQLSeVYf6nS2LiysnSeFPYdYV_kVi_--1khaeLqynsZ0OE_nrx2A/viewform?usp=sf_link');
            }
          },
          child: Text(
            'Clique aqui para nos ajudar a melhorar!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontFamily: 'Fino',
              //fontWeight: FontWeight.w100,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  File image;

  void _itemSelecionado(int escolha) async {
    File photo;
    if (escolha == 1) {
      photo = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      photo = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      image = photo;
    });
    Navigator.of(context).pop();
  }

  Widget escrever(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Colors.blue[50], borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: <Widget>[
            Text(
              'Escrever um recadinho!',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            GestureDetector(
              onTap: () {
                _capturarImagem();
              },
              child: Container(
                child: image == null
                    ? Icon(
                        Icons.photo_camera,
                        color: Colors.blue,
                      )
                    : null,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: image != null
                        ? DecorationImage(
                            image: FileImage(image),
                            fit: BoxFit.cover,
                          )
                        : null,
                    border: Border.all(color: Colors.blue, width: 2)),
              ),
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: 'Nome',
                    icon: Icon(
                      Icons.person,
                    ))),
            TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 2,
                maxLength: 100,
                decoration: InputDecoration(
                    hintText: 'Recadinho',
                    icon: Icon(
                      Icons.textsms,
                    ))),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            RaisedButton(
              onPressed: () {
                _recadinhoResult();
              },
              child: Text(
                'Enviar',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            )
          ],
        ));
  }

  void _recadinhoResult() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 60,
            child: ListTile(
              leading: Icon(Icons.check_circle),
              title: Text('Recadinho enviado com sucesso!'),
            ),
          );
        });
  }

  void _capturarImagem() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 122,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Câmera'),
                  onTap: () {
                    _itemSelecionado(1);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.folder),
                  title: Text('Arquivos'),
                  onTap: () {
                    _itemSelecionado(2);
                  },
                ),
              ],
            ),
          );
        });
  }
}
