import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();

  String infoResultado = "";
  String moedaOrigem = "Real";
  String moedaDestino = "Dólar";

  void _calcularConversao() {
    setState(() {
      double valor = double.parse(n1Controller.text);
      if (moedaOrigem == 'Real') {
        if (moedaDestino == 'Bitcoin')
          infoResultado = (valor / 201528.27).toStringAsFixed(2);
        else if (moedaDestino == 'Dólar')
          infoResultado = (valor / 4.72).toStringAsFixed(2);
        else if (moedaDestino == 'Euro')
          infoResultado = (valor / 5.13).toStringAsFixed(2);
        else
          infoResultado = valor.toString();
      }

      if (moedaOrigem == 'Dólar') {
        if (moedaDestino == 'Bitcoin')
          infoResultado = (valor / 42746.10).toStringAsFixed(2);
        else if (moedaDestino == 'Real')
          infoResultado = (valor * 4.59).toStringAsFixed(2);
        else if (moedaDestino == 'Euro')
          infoResultado = (valor * 1.09).toStringAsFixed(2);
        else
          infoResultado = valor.toString();
      }

      if (moedaOrigem == 'Euro') {
        if (moedaDestino == 'Bitcoin')
          infoResultado = (valor / 39313.59).toStringAsFixed(2);
        else if (moedaDestino == 'Real')
          infoResultado = (valor * 5.13).toStringAsFixed(2);
        else if (moedaDestino == 'Dólar')
          infoResultado = (valor / 0.92).toStringAsFixed(2);
        else
          infoResultado = valor.toString();
      }

      if (moedaOrigem == 'Bitcoin') {
        if (moedaDestino == 'Euro')
          infoResultado = (valor / 0.000025).toStringAsFixed(2);
        else if (moedaDestino == 'Real')
          infoResultado = (valor / 0.0000050).toStringAsFixed(2);
        else if (moedaDestino == 'Dólar')
          infoResultado = (valor / 0.000023).toStringAsFixed(2);
        else
          infoResultado = valor.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text(
        "Conversor de Moedas\nDólar, Real, Euro e Bitcoin",
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      backgroundColor: Colors.amber,
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _campo("Valor", n1Controller),
          _campoOrigem(),
          _campoDestino(),
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
        labelText: labelTitulo,
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green, fontSize: 25.0),
      controller: objController,
    );
  }

  _campoOrigem() {
    return Row(
      children: <Widget>[
        Text(
          "De: ",
          style: TextStyle(fontSize: 25.0),
        ),
        DropdownButton<String>(
          value: moedaOrigem,
          items:
              <String>['Bitcoin', 'Dólar', 'Euro', 'Real'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontSize: 30.0),
              ),
            );
          }).toList(),
          onChanged: (String? valorSelecionado) {
            setState(() {
              moedaOrigem = valorSelecionado!;
            });
          },
        ),
      ],
    );
  }

  _campoDestino() {
    return Row(
      children: <Widget>[
        Text(
          "Para: ",
          style: TextStyle(fontSize: 25.0),
        ),
        DropdownButton<String>(
          value: moedaDestino,
          items:
              <String>['Bitcoin', 'Dólar', 'Euro', 'Real'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontSize: 30.0),
              ),
            );
          }).toList(),
          onChanged: (String? valorSelecionado) {
            setState(() {
              moedaDestino = valorSelecionado!;
            });
          },
        ),
      ],
    );
  }

  _containerCampo() {
    return Row(
      children: <Widget>[
        _botao(),
        _texto("ué"),
      ],
    );
  }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcularConversao,
          child: Text("Converter",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.amber,
        ),
      ),
    );
  }

  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green, fontSize: 25.0),
    );
  }
}
