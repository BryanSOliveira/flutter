void main() {
  var valorAnterior = 0;
  var valorAtual = 0;
  var proximoValor = 0;
  String out = '';
  for (var i = 0; i < 20; i++) {
    if (valorAnterior == 0) {
      valorAnterior = 1;
      valorAtual = 1;
      proximoValor = 1;
    }
    out += '${proximoValor}, ';
    if (i < 2) continue;

    proximoValor += valorAnterior + valorAtual;
    valorAtual = proximoValor - valorAtual - valorAnterior;
    valorAnterior = proximoValor - valorAtual - valorAnterior;

    if (i == 19) {
      out = out.substring(0, out.length - 2);
      out += '.';
      print(out);
    }
  }
}
