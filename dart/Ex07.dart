void main() {
  var peso = 72;
  var altura = 1.73;
  var imc = peso / (altura * altura);
  var pesoEhIdeal = (imc >= 18.5 || imc <= 24.9) ? true : false;
  print(pesoEhIdeal);
}
