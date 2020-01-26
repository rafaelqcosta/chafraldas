import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PresentePage extends StatefulWidget {
  final String title;
  const PresentePage({Key key, this.title = "Presente"}) : super(key: key);

  @override
  _PresentePageState createState() => _PresentePageState();
}

class _PresentePageState extends State<PresentePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 250,
                margin: EdgeInsets.only(left: 100),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(300)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 25, left: 50),
                child: Image(
                  width: 300,
                  image: AssetImage('assets/img/moto.png'),
                ),
              ),
            ],
          ),
          cabecalho(),
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

  Widget cabecalho() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Como funciona o',
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
            text: 'Sistema do ',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: 'CháFraldas',
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
        Container(
          margin: EdgeInsets.all(15),
          child: Text(
            'Para ajudar a vida da mamãe e do papai o CháFraldas traz a facilidade na hora das compras das minhas fraldinhas. Imagine quanto trabalho eles teriam em comprar, estocar e trocar durante toda a minha infância. Funciona como um sistema delivery, o papai e a mamãe vê qual fraldinha me atende no momento e então basta pedir pelo aplicativo para que chegue até a nossa casa. Você pode realizar a compra das fraldinhas por aqui mesmo. Agora, caso opte por usar o método convencional também ficarei muito feliz.',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget presentes(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Fraldas',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
          Text(
            'É só escolher',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontFamily: 'Fino',
              //fontWeight: FontWeight.w100,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
