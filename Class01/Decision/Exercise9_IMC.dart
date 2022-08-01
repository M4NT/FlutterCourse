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
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController sexoController = TextEditingController();

  String infoResultado = "Informe o peso, altura e sexo!";

  void _calcularIMC() {
    setState(() {
      String sexo = "Masculino";

      if (sexo == "Feminino") {
        _calcularIMCFeminino();
      } else if (sexo == "Masculino") {
        _calcularIMCMasculino();
      }
    });
  }

  void _calcularIMCFeminino() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;

      double resultado = peso / (altura * altura);

      if (resultado < 19) {
        infoResultado = 'Resultado: $resultado \n Abaixo do peso';
      } else if (resultado < 24) {
        infoResultado = 'Resultado: $resultado \n Peso ideal';
      } else if (resultado >= 24) {
        infoResultado = 'Resultado: $resultado \n Acima do peso';
      }
    });
  }

  void _calcularIMCMasculino() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;

      double resultado = peso / (altura * altura);

      if (resultado < 20) {
        infoResultado = 'Resultado: $resultado \n Abaixo do peso';
      } else if (resultado < 25) {
        infoResultado = 'Resultado: $resultado \n Peso ideal';
      } else if (resultado >= 25) {
        infoResultado = 'Resultado: $resultado \n Acima do peso';
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
      title: Text("Calculadora IMC"),
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
          _campo("Digite o peso", pesoController),
          _campo("Digite a altura", alturaController),
          _campo("Digite o seu sexo", sexoController),
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
          onPressed: _calcularIMC,
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
