import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  void _calcularConversao() async {
    String urlBtcBrl = 'https://economia.awesomeapi.com.br/json/last/BTC-BRL';
    http.Response responseBtcBrl = await http.get(Uri.parse(urlBtcBrl));
    Map<String, dynamic> retornoBtcBrl = json.decode(responseBtcBrl.body);
    double realToBtc = double.parse(retornoBtcBrl['BTCBRL']['ask']);

    String urlUsdBrl = 'https://economia.awesomeapi.com.br/json/last/USD-BRL';
    http.Response responseUsdBrl = await http.get(Uri.parse(urlUsdBrl));
    Map<String, dynamic> retornoUsdBrl = json.decode(responseUsdBrl.body);
    double realToUsd = double.parse(retornoUsdBrl['USDBRL']['ask']);

    String urlEurBrl = 'https://economia.awesomeapi.com.br/json/last/EUR-BRL';
    http.Response responseEurBrl = await http.get(Uri.parse(urlEurBrl));
    Map<String, dynamic> retornoEurBrl = json.decode(responseEurBrl.body);
    double realToEur = double.parse(retornoEurBrl['EURBRL']['ask']);

    String urlBtcUsd = 'https://economia.awesomeapi.com.br/json/last/BTC-USD';
    http.Response responseBtcUsd = await http.get(Uri.parse(urlBtcUsd));
    Map<String, dynamic> retornoBtcUsd = json.decode(responseBtcUsd.body);
    double usdToBtc = double.parse(retornoBtcUsd['BTCUSD']['ask']);

    String urlBrlUsd = 'https://economia.awesomeapi.com.br/json/last/BRL-USD';
    http.Response responseBrlUsd = await http.get(Uri.parse(urlBrlUsd));
    Map<String, dynamic> retornoBrlUsd = json.decode(responseBrlUsd.body);
    double usdToBrl = double.parse(retornoBrlUsd['BRLUSD']['ask']);

    String urlEurUsd = 'https://economia.awesomeapi.com.br/json/last/EUR-USD';
    http.Response responseEurUsd = await http.get(Uri.parse(urlEurUsd));
    Map<String, dynamic> retornoEurUsd = json.decode(responseEurUsd.body);
    double usdToEur = double.parse(retornoEurUsd['EURUSD']['ask']);

    setState(() {
      double valor = double.parse(n1Controller.text);
      if (moedaOrigem == 'Real') {
        if (moedaDestino == 'Bitcoin') {
          infoResultado = (valor / realToBtc).toStringAsFixed(2);
        } else if (moedaDestino == 'Dólar')
          infoResultado = (valor / realToUsd).toStringAsFixed(2);
        else if (moedaDestino == 'Euro')
          infoResultado = (valor / realToEur).toStringAsFixed(2);
        else
          infoResultado = valor.toString();
      }

      if (moedaOrigem == 'Dólar') {
        if (moedaDestino == 'Bitcoin')
          infoResultado = (valor / usdToBtc).toStringAsFixed(2);
        else if (moedaDestino == 'Real')
          infoResultado = (valor * usdToBrl).toStringAsFixed(2);
        else if (moedaDestino == 'Euro')
          infoResultado = (valor * usdToEur).toStringAsFixed(2);
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
          items: <String>['Real', 'Dólar'].map((String value) {
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
