class Anotacao {
  int id;
  String titulo;

  Anotacao(this.titulo);

  Anotacao.fromMap(Map map) {
    this.id = map["id"];
    this.titulo = map["titulo"];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "titulo": this.titulo,
    };

    if (this.id != null) {
      map["id"] = this.id;
    }

    return map;
  }
}
