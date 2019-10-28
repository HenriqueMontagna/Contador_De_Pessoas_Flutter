import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode Entrar!";

  void changePeople(int delta) {
    setState(() {
      _people += delta;
      if (_people < 0){
        _infoText = "Valor Invalido";
      }else if(_people >=0 && _people <10){
        _infoText = "Pode Entrar!";
      }
      else if(_people >= 10){
        _infoText = "JÁ LOTOU A JAULA!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "images/fundo.jpg",
        fit: BoxFit.cover,
        height: 1000.0,
      ),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Text(
          "Pessoas: $_people",
          textAlign: TextAlign.justify,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {
                  changePeople(1);
                },
                child: Text("+1",
                    style: TextStyle(color: Colors.white, fontSize: 40)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {
                  changePeople(-1);
                },
                child: Text("-1",
                    style: TextStyle(color: Colors.white, fontSize: 40)),
              ),
            ),
          ],
        ),
        Text(
          _infoText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
        )
      ]),
    ]);
  }
}
