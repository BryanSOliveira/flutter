void main() {
  var lado_1 = 10, lado_2 = 9, lado_3 = 5;
  if (lado_1 + lado_2 > lado_3 ||
      lado_1 + lado_3 > lado_2 ||
      lado_2 + lado_3 > lado_1) {
    if (lado_1 != lado_2 && lado_2 != lado_3) {
      print('Triângulo escaleno');
    } else if (lado_1 == lado_2 && lado_2 == lado_3) {
      print('Triângulo equilátero');
    } else {
      print('Triângulo isósceles');
    }
  } else {
    print('Não existe um triângulo');
  }
}
