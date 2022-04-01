import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();

  String nome = "";
  var idade;
  String sexo = "Selecione um sexo";
  String infoResultado = "";
  String escolaridade = "Selecione sua escolaridade";

  void _calcularMultiplicacao() {
    setState(() {
      nome = n1Controller.text;
      idade = int.parse(n2Controller.text);
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
      title: Text("Abertura de Conta"),
      centerTitle: true,
      backgroundColor: Colors.purple,
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _campoText("Nome:", n1Controller),
          _campoNumber("Idade", n2Controller),
          _campoDropdownSexo(),
          _campoDropdownEscolaridade(),
          _botao(),
          _texto(infoResultado),
        ],
      ),
    );
  }

  _campoText(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: labelTitulo,
      ),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25.0),
      controller: objController,
    );
  }

  _campoNumber(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelTitulo,
      ),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25.0),
      controller: objController,
    );
  }

  _campoDropdownSexo() {
    return DropdownButton<String>(
      value: sexo,
      items: <String>[
        'Selecione um sexo',
        'Masculino',
        'Feminino',
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          if (valorSelecionado != 'Selecione um sexo') sexo = valorSelecionado!;
        });
      },
    );
  }

  _campoDropdownEscolaridade() {
    return DropdownButton<String>(
      value: escolaridade,
      items: <String>[
        'Selecione sua escolaridade',
        'Analfabeto',
        'Até 5º Ano Incompleto',
        '5º Ano Completo',
        '6º ao 9º Ano do Fundamental',
        'Fundamental Completo	',
        'Médio Incompleto',
        'Médio Completo',
        'Superior Incompleto',
        'Superior Completo',
        'Mestrado',
        'Doutorado',
        'Ignorado',
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          if (valorSelecionado != 'Selecione sua escolaridade')
            escolaridade = valorSelecionado!;
        });
      },
    );
  }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcularMultiplicacao,
          child: Text("Confirmar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.purple,
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
