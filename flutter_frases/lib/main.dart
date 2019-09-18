import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frases = [
    "Se hoje foi ruim, pode ter certeza que amanhã será pior.",
    "A grama do vizinho é sempre mais verde.",
    "Reaja a assaltos, confie no seu potencial.",
    "Os problemas de hoje, deixe para amanhã.",
    "Teste o ambiente em produção."
  ];
  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase(){
    var numeroSroteado = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[numeroSroteado];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do Dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child:  Container( //caso o container tenha um filho ele ocupara na tela somente o tamanho do filho POR PADRÃO
          padding: EdgeInsets.all(16),
          //width: double.infinity , //faz com que a largura seja definida como 100% do espaço disponivel
          /*decoration: BoxDecoration(
              border: Border.all (width: 3, color: Colors.amber)
          ),*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.png"),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    color: Colors.black
                ),
              ),
              RaisedButton(
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                color: Colors.lightGreen,
                onPressed: _gerarFrase,
              )
            ],
          ),
        ),
      )
    );
  }
}
