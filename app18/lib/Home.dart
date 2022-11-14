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

  _recuperarUsuario() async {
    String url = 'https://api.github.com/users/${userController.text}';

    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    int id = retorno["id"];
    String nome = retorno["name"];
    String repositorios = retorno["repos_url"];
    String dataCriacao = retorno["created_at"];
    int qtdSeguidores = retorno["followers"];
    int qtdSeguindo = retorno["following"];

    setState(() {
      imagem = retorno["avatar_url"];
      info_usuario =
          'Id: $id \nNome: $nome \nRepositórios: $repositorios\nCriado em: $dataCriacao\nSeguidores: $qtdSeguidores\nSeguindo: $qtdSeguindo';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil dos Devs"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Image.network(
              imagem != ''
                  ? imagem
                  : 'https://programadoresbrasil.com.br/wp-content/uploads/2020/04/GitHub-logo-2-imagen.jpg',
              height: 100,
              width: 100,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Digite o seu usuário",
                  labelStyle: TextStyle(color: Colors.green)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: userController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _recuperarUsuario,
                  child: Text("Obter usuário",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.blue,
                ),
              ),
            ),
            Text(info_usuario),
          ],
        ),
      ),
    );
  }
}
