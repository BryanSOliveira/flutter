import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        "Vagas",
        style: TextStyle(fontSize: 30),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  _corpo() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          _containerVaga(
            "Desenvolvedor Backend",
            3000,
            "Descrição 1",
            "company@company.com.br",
          ),
          _containerVaga(
            "Desenvolvedor Frontend",
            3000,
            "Descrição 2",
            "company@company.com.br",
          ),
          _containerVaga(
            "Engenheiro de Dados",
            3000,
            "Descrição 3",
            "company@company.com.br",
          ),
          _containerVaga(
            "Desenvolvedor Backend",
            3000,
            "Descrição 1",
            "company@company.com.br",
          ),
          _containerVaga(
            "Desenvolvedor Frontend",
            3000,
            "Descrição 2",
            "company@company.com.br",
          ),
          _containerVaga(
            "Engenheiro de Dados",
            3000,
            "Descrição 3",
            "company@company.com.br",
          ),
        ],
      ),
    );
  }

  _containerVaga(title, salary, desc, contact) {
    salary = salary.toStringAsFixed(2);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
      )),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          _tituloVaga(title),
          _texto("Salário: R\$ $salary"),
          _texto("Descrição: $desc"),
          _texto("Contato: $contact"),
        ],
      ),
    );
  }

  _tituloVaga(title) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }

  _texto(descTitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          descTitle,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}
