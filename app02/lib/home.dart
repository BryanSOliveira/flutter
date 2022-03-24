import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController quantidadePessoasController = TextEditingController();
  int quantidadePessoas = 0;

  void _incrementarPessoas() {
    setState(() {
      quantidadePessoas++;
    });
  }

  void _decrementarPessoas() {
    setState(() {
      if (quantidadePessoas > 0) quantidadePessoas--;
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
      title: Text("Contador de Pessoas"),
      centerTitle: true,
      backgroundColor: Colors.orange,
    );
  }

  _corpo() {
    return Container(
      child: Column(
        children: <Widget>[
          _contador(),
          _acoes(),
        ],
      ),
    );
  }

  _contador() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _botaoQuantidade(),
        ],
      ),
    );
  }

  _botaoQuantidade() {
    return RaisedButton(
      onPressed: null,
      child: _texto(quantidadePessoas.toString()),
    );
  }

  _acoes() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _botaoIncrementar(),
          _botaoDecrementar(),
        ],
      ),
    );
  }

  _botaoIncrementar() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: RaisedButton(
        onPressed: _incrementarPessoas,
        color: Colors.green,
        child: _texto('+'),
      ),
    );
  }

  _botaoDecrementar() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: RaisedButton(
        onPressed: _decrementarPessoas,
        color: Colors.red,
        child: _texto('-'),
      ),
    );
  }

  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}
