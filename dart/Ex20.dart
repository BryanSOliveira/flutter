void main() {
  var pessoas = [
    ['Bryan', 'M', 20],
    ['Raissa', 'F', 19],
    ['Nicolle', 'F', 14],
    ['Bruno', 'M', 22],
    ['Angélica', 'F', 32]
  ];
  var mulheres = [];
  for (var i = 0; i < pessoas.length; i++) {
    for (var j = 0; j < pessoas[i].length; j++) {
      if (pessoas[i][j] == 'F') {
        mulheres.add(pessoas[i]);
      }
    }
  }

  for (var i = 0; i < mulheres.length; i++) {
    print(mulheres[i]);
  }
}
