import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController aceleracaoController = TextEditingController();
  TextEditingController tempoController = TextEditingController();
  TextEditingController viController = TextEditingController();

  String infoResultado = "Calcular velocidade";

  void _calcularVelocidade() {
    setState(() {
      double aceleracao = double.parse(aceleracaoController.text);
      double tempo = double.parse(tempoController.text);
      double vi = double.parse(viController.text);

      double resultado = vi + (aceleracao * tempo);

      if (resultado < 40) {
        infoResultado = 'Resultado: $resultado Km/h \n Veículo muito lento';
      } else if (resultado < 60) {
        infoResultado = 'Resultado: $resultado Km/h \n Velocidade permitida';
      } else if (resultado < 80) {
        infoResultado = 'Resultado: $resultado Km/h \n Velocidade de cruzeiro';
      } else if (resultado < 120) {
        infoResultado = 'Resultado: $resultado Km/h \n Veículo rápido';
      } else if (resultado > 120) {
        infoResultado = 'Resultado: $resultado Km/h \n Veículo muito rápido';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _corpo(),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Velocímetro"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _campo("Digite a aceleração", aceleracaoController),
          _campo("Digite a velocidade inicial", viController),
          _campo("Digite o tempo", tempoController),
          _botao(),
          _texto(infoResultado),
        ],
      ),
    );
  }

  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.green)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green, fontSize: 25.0),
      controller: objController,
    );
  }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcularVelocidade,
          child: Text("Calcular",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.blue,
        ),
      ),
    );
  }

  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red, fontSize: 25.0),
    );
  }
}
