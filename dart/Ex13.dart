void main() {
  var valorAnterior = 0;
  var proximoValor = 0;
  String out = '';
  for (var i = 0; i < 30; i++) {
    out += '${proximoValor}, ';
    proximoValor += valorAnterior;
    valorAnterior = proximoValor - valorAnterior;

    if (proximoValor == 0) proximoValor += 1;
    if (i == 29) {
      out = out.substring(0, out.length - 2);
      out += '.';
      print(out);
    }
  }
}
