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
        "Anúncios",
        style: TextStyle(color: Colors.black, fontSize: 30),
      ),
      centerTitle: true,
      backgroundColor: Colors.yellow,
    );
  }

  _corpo() {
    return Container(
      color: Colors.white,
      child: PageView(
        children: <Widget>[
          _containerAnuncio(
              "assets/images/produto.jpg", "Descrição 1", "Computador Gamer"),
          _containerAnuncio(
              "assets/images/produto2.jpeg", "Descrição 2", "Notebook Gamer"),
          _containerAnuncio(
              "assets/images/produto3.jpg", "Descrição 3", "Playstation 5")
        ],
      ),
    );
  }

  _containerAnuncio(src, desc, title) {
    return Container(
      child: Column(
        children: <Widget>[
          _tituloProduto(title),
          _foto(src),
          _texto(desc),
        ],
      ),
    );
  }

  _tituloProduto(title) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  _texto(desc) {
    return Text(
      desc,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20.0),
    );
  }

  _foto(src) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20),
      child: Image.asset(
        src,
        width: 300,
      ),
    );
  }
}
