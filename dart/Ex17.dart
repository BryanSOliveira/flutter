void main() {
  var numeros = [23, 5, 4, 8, 55, 30, 1, 84, 73, 60];
  var maior = 0;
  for (var i = 0; i < numeros.length; i++) {
    if (maior < numeros[i]) maior = numeros[i];
  }
  print('Maior: ${maior}');
}
