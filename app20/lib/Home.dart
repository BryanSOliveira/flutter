import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController userController = TextEditingController();
  String info_usuario = '';
  String imagem = '';
  List<dynamic> _filmes;

  _recuperarFilmes() async {
    String url = 'https://sujeitoprogramador.com/r-api/?api=filmes';
    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> retorno = json.decode(response.body);

    setState(() {
      _filmes = retorno;
      print(_filmes);
    });
  }

  _containerFilme(filme) {
    return Container(
        child: Row(children: <Widget>[
      Text(filme['nome']),
      Image.network(
        filme['foto'].toString(),
      )
    ]));
  }

  @override
  void initState() {
    super.initState();
    _recuperarFilmes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App de Filmes"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _filmes.length,
                  itemBuilder: (context, index) {
                    final filme = _filmes[index];

                    return SingleChildScrollView(
                      //title: Text(anotacao['nome'].toString()),
                      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          _containerFilme(filme),
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
