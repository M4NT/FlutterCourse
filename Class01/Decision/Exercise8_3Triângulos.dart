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
  TextEditingController ladoAController = TextEditingController();
  TextEditingController ladoBController = TextEditingController();
  TextEditingController ladoCController = TextEditingController();

  String infoResultado = "Informe o os 3 lados do triângulo";

  void _calcularTriangulo() {
    setState(() {
      double ladoA = double.parse(ladoAController.text);
      double ladoB = double.parse(ladoBController.text);
      double ladoC = double.parse(ladoCController.text);

      if (ladoA + ladoB > ladoC &&
          ladoA + ladoC > ladoB &&
          ladoB + ladoC > ladoA) {
        infoResultado = 'Formam um triângulo';
      }
      if (ladoA == ladoB && ladoA == ladoC) {
        infoResultado = 'Forma um equilátero!';
      } else if (ladoA == ladoB || ladoA == ladoC || ladoB == ladoC) {
        infoResultado = 'Forma um isósceles!';
      } else {
        infoResultado = 'Forma um escaleno!';
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
      title: Text("Triângulo"),
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
          _campo("Digite o lado A", ladoAController),
          _campo("Digite o lado B", ladoBController),
          _campo("Digite o lado C", ladoCController),
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
          onPressed: _calcularTriangulo,
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
