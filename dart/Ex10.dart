void main() {
  var aceleracao = 20, velocidadeInicial = 0, tempoPercurso = 5;
  var velocidade = velocidadeInicial + (aceleracao * tempoPercurso);
  if (velocidade <= 40) {
    print('Veículo muito lento');
  } else if (velocidade <= 60) {
    print('Velocidade permitida');
  } else if (velocidade <= 80) {
    print('Velocidade de cruzeiro');
  } else if (velocidade <= 120) {
    print('Veículo rápido');
  } else {
    print('Veículo muito rápido');
  }
}
