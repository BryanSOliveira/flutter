import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController quantidadePessoasController = TextEditingController();
  String quantidadePessoas = "0";

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
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _botao(),
        ],
      ),
    );
  }

  _botao() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //height: 50.0,
        children: <Widget>[
          _buttonQuantidade(quantidadePessoas),
        ],
      ),
    );
  }

  _buttonQuantidade(quantidadePessoas) {
    return RaisedButton(
      color: Colors.green,
      onPressed: null,
      //onPressed: () {
      //print("Okay!");
      //},
      child: Text(
        quantidadePessoas,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
