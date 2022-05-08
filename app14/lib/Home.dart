import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pegarEstadoDia();
    pegarEstadoFonte();
  }

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
      padding: EdgeInsets.all(10),
      color: dia ? Colors.white : Colors.black26,
      child: Text(
        '"A vingança nunca é plena, mata a alma e envenena" (Seu Madruga)',
        style: TextStyle(fontSize: pequeno ? 15 : 30),
      ),
    );
  }

  Future<bool> salvarEstadoDia(bool estado) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("dia", dia);
    return prefs.setBool("dia", dia);
  }

  Future<bool> pegarEstadoDia() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      dia = prefs.getBool("dia") == true;
    });
    return dia;
  }

  Future<bool> salvarEstadoFonte(bool pequeno) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("pequeno", pequeno);
    return prefs.setBool("pequeno", pequeno);
  }

  Future<bool> pegarEstadoFonte() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      pequeno = prefs.getBool("pequeno") == true;
    });
    return pequeno;
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
                    setState(() {
                      dia = value;
                      salvarEstadoDia(value);
                    });
                  },
                ),
                Text('Pequeno'),
                Switch(
                  value: pequeno,
                  onChanged: (value) {
                    setState(() {
                      pequeno = value;
                      salvarEstadoFonte(pequeno);
                    });
                  },
                ),
              ],
            ),
            _blocoFrase(),
          ],
        ),
      ),
    );
  }
}
