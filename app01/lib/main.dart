import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: widgetHome(),
    );
  }
}

class widgetHome extends StatelessWidget {
  const widgetHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        child: Container(
          child: AppBar(
            title: Text("App Bryan"),
            backgroundColor: Colors.cyan,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
      ),
      appBar: AppBar(
        title: Text("App Bryan"),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            "First App",
            style: TextStyle(
              fontSize: 50,
              color: Colors.black26,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              //decoration: TextDecoration.overline,
              decorationColor: Colors.blue,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
        ),
      ),
    );
  }
}
