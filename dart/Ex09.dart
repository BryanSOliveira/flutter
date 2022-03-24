void main() {
  var peso = 72, sexo = 'M', altura = 1.73;
  var imc = peso / (altura * altura);
  if (sexo.toLowerCase() == 'm' && imc >= 20 && imc < 25) {
    print('Peso ideal');
  } else if (sexo.toLowerCase() == 'f' && imc >= 19 && imc < 24) {
    print('Peso ideal');
  }
}
