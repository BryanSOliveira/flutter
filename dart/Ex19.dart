void main() {
  var pessoas = [
    ['Bryan', 20],
    ['Raissa', 19],
    ['Nicolle', 14],
    ['Bruno', 22],
    ['Angélica', 32]
  ];
  for (var i = 0; i < pessoas.length; i++) {
    for (var j = 0; j < pessoas[i].length; j++) {
      print(pessoas[i][j]);
    }
  }
}
