import 'package:flutter/material.dart';

class Dados extends StatelessWidget {
  String valueNome;
  String valueIdade;
  String valueSexo;
  String valueEscolaridade;
  int valueLimite;
  bool valueEhBrasileiro;
  Dados({
    required this.valueNome,
    required this.valueIdade,
    required this.valueSexo,
    required this.valueEscolaridade,
    required this.valueLimite,
    required this.valueEhBrasileiro,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados informados:'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _exibeCampo("Nome: $valueNome"),
            _exibeCampo("Idade: $valueIdade"),
            _exibeCampo("Sexo: $valueSexo"),
            _exibeCampo("Escolaridade: $valueEscolaridade"),
            _exibeCampo("Limite: $valueLimite"),
            _exibeCampo("Brasileiro: $valueEhBrasileiro"),
          ],
        ),
      ),
    );
  }

  _exibeCampo(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25.0),
    );
  }
}
