class Anotacao {
  int id;
  String titulo;
  String descricao;

  Anotacao(this.titulo, this.descricao);

  Anotacao.fromMap(Map map) {
    this.id = map["id"];
    this.titulo = map["titulo"];
    this.descricao = map["descricao"];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "titulo": this.titulo,
      "descricao": this.descricao,
    };

    if (this.id != null) {
      map["id"] = this.id;
    }

    return map;
  }
}
