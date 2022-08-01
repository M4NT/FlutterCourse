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
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  TextEditingController n3Controller = TextEditingController();
  TextEditingController n4Controller = TextEditingController();
  TextEditingController n5Controller = TextEditingController();

  String infoResultado = "Insira os produtos";

  set infoPagamentoInvalido(String infoPagamentoInvalido) {}

  void _calcularProdutos() {
    setState(() {
      double n1 = double.parse(n1Controller.text);
      double n2 = double.parse(n2Controller.text);
      double n3 = double.parse(n3Controller.text);
      double n4 = double.parse(n4Controller.text);
      double n5 = double.parse(n5Controller.text);

      double resultado = n1 + n2 + n3 + n4 + n5;

      infoResultado = 'Resultado: $resultado';
    });
  }

  TextEditingController resultadoController = TextEditingController();

  void _calcularPagamento() {
    setState(() {
      double n1 = double.parse(n1Controller.text);
      double n2 = double.parse(n2Controller.text);
      double n3 = double.parse(n3Controller.text);
      double n4 = double.parse(n4Controller.text);
      double n5 = double.parse(n5Controller.text);
      double resultado = double.parse(resultadoController.text);

      double resultadoPagamento = resultado - (n1 + n2 + n3 + n4 + n5);
      if (resultadoPagamento < 0) {
        infoPagamento = 'Pagamento Insuficiente';
      } else {
        infoPagamento = 'Troco: $resultadoPagamento';
      }
    });
  }

  String infoPagamento = "Insira o valor do pagamento";

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
      title: Text("Carrinho"),
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
          _campo("Digite o valor do primeiro produto", n1Controller),
          _campo("Digite o valor do segundo produto", n2Controller),
          _campo("Digite o valor do terceiro produto", n3Controller),
          _campo("Digite o valor do quarto produto", n4Controller),
          _campo("Digite o valor do quinto produto", n5Controller),
          _botao(),
          _texto(infoResultado),
          _campo("Digite o valor do pagamento", resultadoController),
          _texto(infoPagamento),
          _botaoPagamento(),
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
          onPressed: _calcularProdutos,
          child: Text("Calcular",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.blue,
        ),
      ),
    );
  }

  _botaoPagamento() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcularPagamento,
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
