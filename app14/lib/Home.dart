import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _textoSalvo = "Nada salvo!";
  bool dia = true;
  bool pequeno = true;
  TextEditingController _controllerCampo = TextEditingController();

  _salvar() async {
    String valorDigitado = _controllerCampo.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);

    print("Método Salvar:  $valorDigitado");
  }

  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _textoSalvo = prefs.getString("nome").toString();
    });

    print("Método Recuperar:  $_textoSalvo");
  }

  _remover() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove("nome");

    print("Método Remover");
  }

  _blocoFrase() {
    return Container(
      color: Colors.grey,
      child: Text(
        '"A vingança nunca é plena, mata a alma e envenena" (Seu Madruga)',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Dia'),
                Switch(
                  value: dia,
                  onChanged: (value) {
                    setState(() async {
                      dia = value;
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString("dia", dia.toString());
                      print('Aqui: $dia');
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.blue,
                ),
                Text('Pequeno'),
                Switch(
                  value: pequeno,
                  onChanged: (value) {
                    setState(() {
                      pequeno = value;
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.blue,
                ),
              ],
            ),
            _blocoFrase(),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Digite seu nome"),
              controller: _controllerCampo,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text("Salvar", style: TextStyle(fontSize: 15)),
                  onPressed: _salvar,
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text("Recuperar", style: TextStyle(fontSize: 15)),
                  onPressed: _recuperar,
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text("Remover", style: TextStyle(fontSize: 15)),
                  onPressed: _remover,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}