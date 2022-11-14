void main() {
  contaCorrente contaBryan = new contaCorrente(236, 1000, 100, "Bryan");
  contaBryan.saque(200);
  contaBryan.deposito(350);
  contaPoupanca contaFlutter = new contaPoupanca(237, 2000, 100, "Flutter");

  if (contaBryan.transferencia(contaFlutter, 1200) != 0) {
    print("Transferido com sucesso! \n");
  } else {
    print("A transferência falhou! \n");
  }
}

class conta {
  var numero;
  var saldo;
  var limite;
  var nome;
  var verif;

  conta(var numero, var saldo, var limite, var nome) {
    this.numero = numero;
    this.saldo = saldo;
    this.limite = limite;
    this.nome = nome;
  }

  void saque(var valor) {
    if (saldo + limite < valor) {
      verif = 0;
      print('$nome, saque negado!');
    } else {
      saldo = saldo - valor;
      verif = 1;
      print('$nome sacou R\$$valor, novo saldo: R\$$saldo');
    }
  }

  void deposito(var valor) {
    saldo = saldo + valor;
    print('$nome depositou R\$$valor, novo saldo: R\$$saldo');
  }

  bool transferencia(conta contaPoupanca, var valor) {
    if (verif == 0) {
      return false;
    } else {
      contaPoupanca.deposito(valor);
      return true;
    }
  }
}

class contaCorrente extends conta {
  contaCorrente(var numero, var saldo, var limite, var nome)
      : super(numero, saldo, limite, nome);
}

class contaPoupanca extends conta {
  contaPoupanca(var numero, var saldo, var limite, var nome)
      : super(numero, saldo, limite, nome);
}
