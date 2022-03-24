void main() {
  var numeros = [
    23,
    5,
    4,
    8,
    55,
    30,
    1,
    84,
    73,
    60,
    25,
    35,
    39,
    7,
    5,
    74,
    100,
    57,
    30,
    20
  ];
  final multiplicador = 2;
  for (var i = 0; i < numeros.length; i++) {
    numeros[i] = numeros[i] * multiplicador;
  }
  print(numeros);
}
